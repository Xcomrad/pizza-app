
import UIKit

class MainTabBarController: UITabBarController {
    
    var menuVC: TableView = {
        let controller = TableView()
        
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem(title: "Меню", image: image, selectedImage: selectedImage)
        
        controller.tabBarItem = tabItem
        return controller
    }()
    
    var contactsVC: ContactsVC = {
       let controller = ContactsVC()
        
        let image = UIImage(systemName: "phone")
        let selectedImage = UIImage(systemName: "phone.fill")
        let tabItem = UITabBarItem(title: "Контакты", image: image, selectedImage: selectedImage)
        
        controller.tabBarItem = tabItem
        return controller
    }()
    
    var cartVC: CartVC = {
       let controller = CartVC()
        
        let image = UIImage(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart.fill")
        let tabItem = UITabBarItem(title: "Корзина", image: image, selectedImage: selectedImage)
        
        controller.tabBarItem = tabItem
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [menuVC, contactsVC, cartVC]
        tabBar.tintColor = .systemOrange
    }
}
