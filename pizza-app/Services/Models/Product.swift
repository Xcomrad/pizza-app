
import Foundation

struct ProductResponse: Codable {
    let products: [Product]
}

// Networking model
class Product: Codable {
    
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


