
import UIKit

final class DetailVC: UIViewController {
    
    private var productService = ProductService()
    private var product: [Product] = []

    private var ingredientService = IngredientService()
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
        product = productService.fetchProduct()
        ingredient = ingredientService.fetchIngredient()
        detailView.update(product, ingredient)
    }
}



