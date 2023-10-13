
import Foundation

struct ProductService {
    private let product: [Product] = [
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
                isNew: true),
        
        Product(index: 105,
                coin: 20,
                image: "5",
                name: "Гавайская с альфредо",
                detail: "Фирменный соус альфредо, цыпленок, моцарелла, ананасы",
                price: 25, 
                count: 1,
                isNew: false),
        
        Product(index: 106,
                coin: 10,
                image: "6",
                name: "Бургер-пицца",
                detail: "Томатный соус, моцарелла, ветчина, красный лук, томаты, маринованные огурчики, соус бургер, чеснок",
                price: 20, 
                count: 1,
                isNew: true),
        
        Product(index: 107,
                coin: 20,
                image: "7",
                name: "Цыпленок барбекю",
                detail: "Соус барбекю, томатный соус, цыпленок, красный лук, моцарелла, бекон",
                price: 27, 
                count: 1,
                isNew: false),
        
        Product(index: 108,
                coin: 20,
                image: "8",
                name: "Колбаски Барбекю",
                detail: "Острые колбаски чоризо, соус барбекю, томаты, красный лук, моцарелла, томатный соус",
                price: 22,
                count: 1,
                isNew: false)
    ]
    
    func fetchProduct() -> [Product] {
        return product
    }
}
