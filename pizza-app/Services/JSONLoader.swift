
import Foundation

final class JSONLoader {
    
    static func loadProducts(fromFile: String) -> [ProductModel]? {
        
        if let url = Bundle.main.url(forResource: fromFile, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(MenuModel.self, from: data)
                return jsonData.products
            } catch {
                print("error \(error)")
            }
        }
        return nil
    }
}
