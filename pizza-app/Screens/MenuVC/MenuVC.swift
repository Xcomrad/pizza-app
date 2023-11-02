
import UIKit

final class MenuVC: UIViewController {
     
    var selectProduct: ProductModel?
    private let jsonLoader = JSONLoader()
    
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
    
    //MARK: - Public
    func fetchProducts() {
        let products = jsonLoader.loadProducts(fromFile: "menu") ?? []
        menuView.tableView.update(products)
    }
    
    func action() {
        menuView.tableView.onCellEvent = { product in
            let controller = DetailVC()
            controller.currentProduct = product
            self.present(controller, animated: true)
        }
    }
    
    private func setup() {
        self.title = "Меню"
    }
}

