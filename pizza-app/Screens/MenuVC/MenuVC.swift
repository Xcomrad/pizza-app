
import UIKit

final class MenuVC: UIViewController {
    
    private var menuView: MenuView { return self.view as! MenuView }
    
    private let menuProvider: MenuProvider
    
    init(menuProvider: MenuProvider) {
        self.menuProvider = menuProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
}



extension MenuVC {
    
    //MARK: - Public
   private func fetchProducts() {
        Task {
            do {
                let products = try await menuProvider.menuApiClient.fetchProductsAsync()
                menuView.tableView.update(products)
            } catch {
                print(error)
            }
        }
    }
    //MARK: - Action
   private func action() {
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

