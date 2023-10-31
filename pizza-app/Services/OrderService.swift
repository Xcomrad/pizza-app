
import Foundation

// Бизнесс - логика

final class Order {
    
    var products: [Product]
    
    var totalPrice: Int {
        var result = 0
        for product in products {
            result += product.count * product.price
        }
        return result
    }
    
    var totalCount: Int {
        var result = 0
        for product in products {
            result += product.count
        }
        return result
    }
    
    var totalCoin: Int {
        let result = 0
        for product in products {
            return product.coin * totalCount
        }
        return result
    }
    
    internal init(products: [Product]) {
        self.products = products
    }
}



final class OrderService {
    
    let order = Order(products: [
        Product(index: 101,
                coin: 20,
                image: "1",
                name: "Пицца Жюльен",
                detail: "Цыпленок, шампиньоны, сливочный соус с грибами, красный лук, чеснок, моцарелла, смесь сыров чеддер и пармезан, фирменный соус альфредо",
                price: 25,
                count: 1,
                isNew: true),
        
        Product(index: 102,
                coin: 15,
                image: "2",
                name: "Итальянский цыпленок",
                detail: "Цыпленок, итальянские травы, сыр моцарелла, красный лук, томаты свежие, соус альфредо",
                price: 22,
                count: 1,
                isNew: true),
        
        Product(index: 103,
                coin: 25,
                image: "3",
                name: "Четыре сезона",
                detail: "Итальянские травы, томатный соус, томаты, пикантная пепперони, кубики брынзы, моцарелла, ветчина, шампиньоны",
                price: 30,
                count: 1,
                isNew: false),
        
        Product(index: 104,
                coin: 20,
                image: "4",
                name: "Деревенская",
                detail: "Картофель из печи, маринованные огурчики, цыпленок, соус ранч, томаты, красный лук, чеснок, моцарелла, томатный соус",
                price: 27,
                count: 1,
                isNew: true)
    ])
 }
