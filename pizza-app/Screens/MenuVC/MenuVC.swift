
import UIKit

final class MenuVC: UIViewController {
    
    private let productService = ProductService()
    private var products: [Product] = []
    
    private var menuView: MenuView { return self.view as! MenuView }
    
    override func loadView() {
        super.loadView()
        self.view = MenuView.init(frame: UIScreen.main.bounds)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meню"
        fetchProducts()
        
    }
    
    func fetchProducts() {
        products = productService.fetchProduct()
        menuView.update(products)
    }
}

