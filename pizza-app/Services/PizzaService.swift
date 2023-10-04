
import UIKit

struct Pizza {
    var image: String
    var name: String
    var detail: String
    var price: Int
    var isNew: Bool
}

struct PizzaService {
    let product: [Pizza] = [
        Pizza(image: "1",
              name: "Пицца Жюльен",
              detail: "Цыпленок, шампиньоны, сливочный соус с грибами, красный лук, чеснок, моцарелла, смесь сыров чеддер и пармезан, фирменный соус альфредо", price: 25,
              isNew: true),
        Pizza(image: "2",
              name: "Итальянский цыпленок",
              detail: "Цыпленок, итальянские травы, сыр моцарелла, красный лук, томаты свежие, соус альфредо",
              price: 22,
              isNew: true),
        Pizza(image: "3",
              name: "Четыре сезона",
              detail: "Итальянские травы, томатный соус, томаты, пикантная пепперони, кубики брынзы, моцарелла, ветчина, шампиньоны",
              price: 30,
              isNew: false),
        Pizza(image: "4",
              name: "Деревенская",
              detail: "Картофель из печи, маринованные огурчики, цыпленок, соус ранч, томаты, красный лук, чеснок, моцарелла, томатный соус",
              price: 27,
              isNew: true),
        Pizza(image: "5",
              name: "Гавайская с альфредо",
              detail: "Фирменный соус альфредо, цыпленок, моцарелла, ананасы",
              price: 25,
              isNew: false),
        Pizza(image: "6",
              name: "Бургер-пицца",
              detail: "Томатный соус, моцарелла, ветчина, красный лук, томаты, маринованные огурчики, соус бургер, чеснок",
              price: 20,
              isNew: true),
        Pizza(image: "7",
              name: "Цыпленок барбекю",
              detail: "Соус барбекю, томатный соус, цыпленок, красный лук, моцарелла, бекон",
              price: 27,
              isNew: false),
        Pizza(image: "8",
              name: "Колбаски Барбекю",
              detail: "Острые колбаски чоризо, соус барбекю, томаты, красный лук, моцарелла, томатный соус",
              price: 22,
              isNew: false)
    ]
    
    func fetchPizza() -> [Pizza] {
        return product
    }
}
