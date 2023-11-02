
import Foundation

struct MenuModel: Codable {
    let products: [ProductModel]
}

// Networking model
class ProductModel: Codable {
    
    var index: Int
    var coin: Int
    var image: String
    var name: String
    var detail: String
    var size: String?
    var price: Int
    var count: Int?
    var isNew: Bool?
}

