
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
    var detail: String?
    var size: String?
    var price: Int
    var count: Int
    var isNew: Bool?
}



class Product: Codable {
    
    var index: Int
    var coin: Int
    var image: String
    var name: String
    var detail: String?
    var size: String?
    var price: Int
    var count: Int
    var isNew: Bool?
    
    internal init(index: Int, coin: Int, image: String, name: String, detail: String? = nil, size: String? = nil, price: Int, count: Int, isNew: Bool? = nil) {
        self.index = index
        self.coin = coin
        self.image = image
        self.name = name
        self.detail = detail
        self.size = size
        self.price = price
        self.count = count
        self.isNew = isNew
    }
}
