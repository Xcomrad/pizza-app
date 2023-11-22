
import UIKit
import SnapKit

 class MainTabBarController: UITabBarController {
    
    private lazy var menuVC: UINavigationController = {
        let controller = Di.shared.screenFactory.createMenuScreen()
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem(title: "Меню", image: image, selectedImage: selectedImage)
        
        controller.tabBarItem = tabItem
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.barTintColor = .white
        return navigationController
    }()
    
    private var contactsVC: UINavigationController = {
        let controller = Di.shared.screenFactory.createContactsScreen()
        let image = UIImage(systemName: "phone")
        let selectedImage = UIImage(systemName: "phone.fill")
        let tabItem = UITabBarItem(title: "Контакты", image: image, selectedImage: selectedImage)
        
        controller.tabBarItem = tabItem
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.barTintColor = .white
        return navigationController
    }()
    
    private var cartVC: UINavigationController = {
        let controller = Di.shared.screenFactory.createCartScreen()
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
