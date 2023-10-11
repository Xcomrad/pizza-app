
import UIKit
    
class DetailVC: UIViewController {
    
    private let productService = ProductService()
    private var products: [Product] = []
    
    private let ingredientService = IngredientService()
    private var ingredient: [Ingredient] = []
    
    private var detailView: DetailView { return self.view as! DetailView }
    
    override func loadView() {
        super.loadView()
        self.view = DetailView.init(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      fetchProducts()
    }
    
    func fetchProducts() {
        products = productService.fetchProduct()
        detailView.update(products, ingredient)
    }
}



