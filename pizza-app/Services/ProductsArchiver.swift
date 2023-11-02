
import Foundation


protocol ProductsArchiver {
    func save(_ products: [ProductModel])
    func retrieve() -> [ProductModel]
}

final class ProductsArchiverImpl: ProductsArchiver {

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private let key = "Products"

    //MARK: - Public
    func save(_ products: [ProductModel]) {

        do {
            let data = try encoder.encode(products)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
   
    func retrieve() -> [ProductModel] {

        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            let array = try decoder.decode(Array<ProductModel>.self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
}
