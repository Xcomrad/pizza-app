
//import Foundation
//
//// Бизнесс - логика
//
//
//class ProductInCart {
//    
//    var index: Int
//    var coin: Int?
//    var image: String
//    var name: String
//    var detail: String
//    var size: String?
//    var price: Int
//    var count: Int
//    var isNew: Bool?
//    
//    internal init(index: Int, coin: Int? = nil, image: String, name: String, detail: String, size: String? = nil, price: Int, count: Int, isNew: Bool? = nil) {
//        self.index = index
//        self.coin = coin
//        self.image = image
//        self.name = name
//        self.detail = detail
//        self.size = size
//        self.price = price
//        self.count = count
//        self.isNew = isNew
//    }
//}
//
//class Order {
//    
//    var products: [Product] = []
//    
//    var totalPrice: Int {
//        var result = 0
//        for product in products {
//            result += product.count * product.price
//        }
//        return result
//    }
//    
//    var totalCoin: Int {
//        var result = 0
//        for product in products {
//            result += product.count * product.coin!
//        }
//        return result
//    }
//    
//    internal init(products: [Product] = []) {
//        self.products = products
//    }
//}
//
//class OrderService {
//    
//    
//}
