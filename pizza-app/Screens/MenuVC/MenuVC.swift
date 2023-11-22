
import UIKit

final class MenuVC: UIViewController {
    
    private var menuView: MenuView { return self.view as! MenuView }
    
    private let menuApiClient = MenuApiClientImpl()
    
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
                let products = try await menuApiClient.fetchProductsAsync()
                menuView.tableView.update(products)
            } catch {
                print(error)
            }
        }
    }
    
    func action() {
        menuView.tableView.onCellEvent = { product in
            let controller = Di.shared.screenFactory.createDetailScreen(product)
            controller.currentProduct = product
            self.present(controller, animated: true)
        }
    }
    
    private func setup() {
        self.title = "Меню"
    }
}

