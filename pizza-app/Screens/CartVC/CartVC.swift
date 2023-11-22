
import UIKit

final class CartVC: UIViewController {
    
    private var cartView: CartView { return self.view as! CartView }
    
    var order = Order(products: [])
    
    var cartProvider: CartProvider
    
    init(cartProvider: CartProvider) {
        self.cartProvider = cartProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
        
    override func loadView() {
        super.loadView()
        self.view = CartView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        order = Order(products: cartProvider.retrieveOrder())
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
