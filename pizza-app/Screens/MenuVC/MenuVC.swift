
import UIKit

final class MenuVC: UIViewController {
    
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
        let products = JSONLoader.loadProducts(fromFile: "menu") ?? []
        menuView.update(products)
    }
    
    func action() {
        menuView.tableView.onShowSelectedProduct = { product in
            let controller = DetailVC()
            controller.currentProduct = product
            self.present(controller, animated: true)
        }
    }
    
    private func setup() {
        self.title = "Меню"
    }
}

