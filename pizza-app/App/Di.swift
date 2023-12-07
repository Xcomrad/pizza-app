import UIKit


//MARK: - SCREEN FACTORY
protocol ScreenFactory {
    func createTabBarVC() -> MainTabBarController
    func createMenuScreen() -> MenuVC
    func createDetailScreen(_ currentProduct: Product?) -> DetailVC
    func createContactsScreen() -> ContactsVC
    func createCartScreen() -> CartVC
}

class ScreenFactoryImpl: ScreenFactory {
    
    weak var di: Di!
    
    func createTabBarVC() -> MainTabBarController {
        return MainTabBarController()
    }
    
    func createMenuScreen() -> MenuVC {
        return MenuVC(menuProvider: di.menuProvider)
    }
    
    func createDetailScreen(_ currentProduct: Product?) -> DetailVC {
        return DetailVC(currentProduct: currentProduct, cartArchiver: di.cartArchiver, detailProvider: di.detaiProvider)
    }
    
    func createContactsScreen() -> ContactsVC {
        return ContactsVC()
    }
    
    func createCartScreen() -> CartVC {
        return CartVC(cartProvider: di.cartProvider)
    }
}


//MARK: - DI
class Di {
    
    static let shared = Di()
    
    let menuApiClient: MenuApiClientImpl
    let cartArchiver: CartArchiverImpl
    let screenFactory: ScreenFactoryImpl
    let router: RouterImpl
    
    init() {
        menuApiClient = MenuApiClientImpl()
        cartArchiver = CartArchiverImpl()
        router = RouterImpl()
        
        screenFactory = ScreenFactoryImpl()
        screenFactory.di = self
    }
    
    var menuProvider: MenuProvider {
        return MenuProviderImpl(menuApiClient: menuApiClient, router: router)
    }
    var detaiProvider: DetailProvider {
        return DetailProviderImpl(cartArchiver: cartArchiver)
    }
    var cartProvider: CartProvider {
        return CartProviderImpl(cartArchiver: cartArchiver)
    }
}

extension Di {
    
    func makeRootScreen(scene: UIWindowScene) -> UIWindow {
        
        let window = UIWindow(windowScene: scene)
        let rootVC = screenFactory.createTabBarVC()
        window.rootViewController = rootVC
        
        return window
    }
}
