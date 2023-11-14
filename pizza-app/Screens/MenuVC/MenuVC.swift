
import UIKit

final class MenuVC: UIViewController {
    
    var selectProduct: ProductResponse?
    private let service = ProductsAPI()
    private var products: [Product] = []
    
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
        Task {
            do {
                let products = try await service.fetchProductsAsync()
                menuView.tableView.update(products)
            } catch {
                print(error)
            }
        }
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

