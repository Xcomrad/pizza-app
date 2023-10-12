
import UIKit

class CartVC: UIViewController {
    
    private var cartView: CartView { return self.view as! CartView }
    
    override func loadView() {
        super.loadView()
        self.view = CartView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Корзина"
    }
}
