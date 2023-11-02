
import UIKit

final class CartVC: UIViewController {
    
    var productArchiver = ProductsArchiverImpl()
    var order = Order(products: [])
        
    private var cartView: CartView { return self.view as! CartView }
    
    override func loadView() {
        super.loadView()
        self.view = CartView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        order = Order(products: productArchiver.retrieve())
        update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        showMenu()
    }
}



extension CartVC {
    
    private func setup() {
        self.title = "Корзина"
    }
    
    private func showMenu() {
        // переход в Menu
        cartView.emptyView.onEnterMenuVC = {
            self.tabBarController?.selectedIndex = 0
            
        }
    }
    
    // MARK: - Public
    func update() {
        cartView.tableView.update(order)
    }
}
