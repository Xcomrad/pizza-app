
import Foundation

struct CategoryService {
    let category: [Category] = [
        Category(name: "Пицца"),
        Category(name: "Закуски"),
        Category(name: "Десерты"),
        Category(name: "Напитки"),
        Category(name: "Кофе"),
        Category(name: "Соусы")
    ]
    
    func fetchCategories() -> [Category] {
        return category
    }
}
