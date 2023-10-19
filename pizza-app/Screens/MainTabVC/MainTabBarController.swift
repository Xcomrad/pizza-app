
import UIKit
import SnapKit

final class MainTabBarController: UITabBarController {
    
    private var menuVC: UINavigationController = {
        let controller = MenuVC()
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem(title: "Меню", image: image, selectedImage: selectedImage)
        
        controller.tabBarItem = tabItem
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.barTintColor = .white
        return navigationController
    }()
    
    private var contactsVC: ContactsVC = {
        let controller = ContactsVC()
        let image = UIImage(systemName: "phone")
        let selectedImage = UIImage(systemName: "phone.fill")
        let tabItem = UITabBarItem(title: "Контакты", image: image, selectedImage: selectedImage)
        
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private var cartVC: UINavigationController = {
        let controller = CartVC()
        let image = UIImage(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart.fill")
        let tabItem = UITabBarItem(title: "Корзина", image: image, selectedImage: selectedImage)
        
        controller.tabBarItem = tabItem
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.barTintColor = .white
        return navigationController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [menuVC, contactsVC, cartVC]
        tabBar.tintColor = .systemOrange
    }
}
