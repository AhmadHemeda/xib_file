import Foundation
import CoreData
import Combine

class CoreDataStorageManager: CoreDataStorageManagerProtocol {
    
    static let shared = CoreDataStorageManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataStorage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveProductsFromJSON(response: ProductAPIResponse) {
        
        do {
            
            let responseEntity = APIResponseEntity(context: managedObjectContext)
            responseEntity.total = Int16(response.total)
            responseEntity.skip = Int16(response.skip)
            responseEntity.limit = Int16(response.limit)
            
            for product in response.products {
                let productEntity = ProductEntity(context: managedObjectContext)
                productEntity.id = Int16(product.id)
                productEntity.title = product.title
                productEntity.productDescription = product.description
                productEntity.price = product.price
                productEntity.discountPercentage = product.discountPercentage
                productEntity.rating = product.rating
                productEntity.stock = Int16(product.stock)
                productEntity.brand = product.brand
                productEntity.category = product.category
                productEntity.thumbnail = product.thumbnail
                let nsArray = product.images as NSArray
                productEntity.images = nsArray
                
                responseEntity.addToProducts(responseEntity)
            }
            
            try managedObjectContext.save()
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
    
    
    // MARK: - API Operations
    
    func getAllProducts() -> AnyPublisher<[ProductEntity], Error> {
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        return Future<[ProductEntity], Error> { promise in
            do {
                let products = try self.managedObjectContext.fetch(fetchRequest)
                promise(.success(products))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    func getProduct(response: ProductAPIResponse) -> AnyPublisher<ProductEntity?, Error> {
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", response.products.first?.id ?? 0)
        
        return Future<ProductEntity?, Error> { promise in
            do {
                let products = try self.managedObjectContext.fetch(fetchRequest)
                promise(.success(products.first))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    func addNewProduct(response: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error> {
        return Future<ProductEntity, Error> { promise in
            let newProduct = ProductEntity(context: self.managedObjectContext)
            newProduct.title = response.products.first?.title
            
            do {
                try self.managedObjectContext.save()
                promise(.success(newProduct))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    func updateProduct(response: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error> {
        return getProduct(response: response)
            .flatMap { product -> AnyPublisher<ProductEntity, Error> in
                guard let product = product else {
                    return Fail(error: NSError(domain: "com.example.error", code: 404, userInfo: [NSLocalizedDescriptionKey: "Product not found"])) .eraseToAnyPublisher()
                }
                
                product.title = response.products.first?.title
                
                return self.managedObjectContext.savePublisher()
                    .map { _ in product }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func deleteProduct(response: ProductAPIResponse) -> AnyPublisher<ProductEntity, Error> {
        return getProduct(response: response)
            .flatMap { product -> AnyPublisher<ProductEntity, Error> in
                guard let product = product else {
                    return Fail(error: NSError(domain: "com.example.error", code: 404, userInfo: [NSLocalizedDescriptionKey: "Product not found"])) .eraseToAnyPublisher()
                }
                
                self.managedObjectContext.delete(product)
                
                return self.managedObjectContext.savePublisher()
                    .map { _ in product }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}

extension NSManagedObjectContext {
    func savePublisher() -> AnyPublisher<Void, Error> {
        do {
            try self.save()
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
