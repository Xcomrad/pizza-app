
import UIKit

final class MenuVC: UIViewController {
    
    private let productService = ProductService()
    private var product: [Product] = []
    
    private var menuView: MenuView { return self.view as! MenuView }
    
    override func loadView() {
        super.loadView()
        self.view = MenuView.init(frame: UIScreen.main.bounds)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProducts()
        action()
        setup()
    }
    
    func fetchProducts() {
        product = productService.fetchProduct()
        menuView.update(product)
    }
    
    func action() {
        menuView.tableView.onShowSelectedProduct = {
            let controller = DetailVC()
            self.present(controller, animated: true)
        }
    }
    
    private func setup() {
        self.title = "Меню"
    }
}

