
import UIKit

struct Ingredients {
    var name: String
    var price: Int
    var image: String
    
}

struct IngredientService {
    let ingredient: [Ingredients] = [
        Ingredients(name: "Моцарелла", price: 3, image: "002"),
        Ingredients(name: "Чеддер и пармезан", price: 3, image: "003"),
        Ingredients(name: "Острый хлапеньо", price: 2, image: "004"),
        Ingredients(name: "Цыпленок", price: 2, image: "005"),
        Ingredients(name: "Ветчина", price: 3, image: "006"),
        Ingredients(name: "Шампиньоны", price: 2, image: "007"),
        Ingredients(name: "Маринованные огурчики", price: 2, image: "008"),
        Ingredients(name: "Томаты", price: 2, image: "009"),
        Ingredients(name: "Острая чоризо", price: 3, image: "0010"),
        Ingredients(name: "Брынза", price: 3, image: "0011"),
        Ingredients(name: "Блю чиз", price: 2, image: "0012"),
        Ingredients(name: "Красный лук", price: 2, image: "0013"),
        Ingredients(name: "Итальянские травы", price: 2, image: "0014"),
        Ingredients(name: "Ананас", price: 2, image: "0015"),
        Ingredients(name: "Сладкий перец", price: 2, image: "0016"),
        Ingredients(name: "Маслины", price: 2, image: "0017"),
        Ingredients(name: "Митболы", price: 3, image: "0018"),
        Ingredients(name: "Пастрами из индейки", price: 3, image: "0019"),
    ]
    
    func fetchIngredients() -> [Ingredients] {
        return ingredient
    }
}
