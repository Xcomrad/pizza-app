
import Foundation

final class JSONLoader {
    
     func loadProducts(fromFile menu: String) -> [ProductModel]? {
        
        if let url = Bundle.main.url(forResource: menu, withExtension: "json") {
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
