
import UIKit

final class DetailVC: UIViewController {
    
    var currentProduct: ProductModel?
    
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
        let products = JSONLoader.loadProducts(fromFile: "menu") ?? []
        detailView.tableView.update(products)
    
    }
    
    func dismissDetail() {
        detailView.dismissButton.onCloseDetail = {
            self.dismiss(animated: true, completion: nil)
        }
    }
}



