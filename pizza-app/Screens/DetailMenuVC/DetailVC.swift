
import UIKit

final class DetailVC: UIViewController {
    
    private var productService = ProductService()
    private var product: [Product] = []
    
    private var detailView: DetailView { return self.view as! DetailView }
    
    override func loadView() {
        super.loadView()
        self.view = DetailView.init(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProducts()
        dismissDetail()
    }
    
    // MARK: - Public
    func fetchProducts() {
        product = productService.fetchProduct()
        detailView.update(product)
    }
    
    func dismissDetail() {
        detailView.dismissButton.onCloseDetail = {
            self.dismiss(animated: true, completion: nil)
        }
    }
}



