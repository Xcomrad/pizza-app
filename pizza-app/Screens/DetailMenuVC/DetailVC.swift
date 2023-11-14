
import UIKit

final class DetailVC: UIViewController {
    
    var currentProduct: Product?
    var productArchiver = ProductsArchiverImpl()
    
    private var detailView: DetailView { return self.view as! DetailView }
    
    override func loadView() {
        super.loadView()
        self.view = DetailView.init(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        dismissDetailScreen()
        
    }
}



extension DetailVC {
    
    //MARK: - Public
    func update() {
        detailView.tableView.update(currentProduct!)
    }
    
    //MARK: - Action
    func dismissDetailScreen() {
        detailView.dismissButton.onCloseDetail = {
            self.dismiss(animated: true, completion: nil)
        }
        detailView.buyButton.onAddProductInCart = {
            self.updateProductsInCart()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func updateProductsInCart() {
        
        var productsInCart = productArchiver.retrieve()
        let isRepeatProduct = productsInCart.contains { $0.index == currentProduct?.index }
        
        defer {
            productArchiver.save(productsInCart)
        }
        
        if productsInCart.isEmpty || !isRepeatProduct {
            productsInCart.append(currentProduct!)
            return
        }
        
        for product in productsInCart {
            
            var count = product.count ?? 1
            
            if product.index == currentProduct?.index {
                count  += 1
                product.count = count
            }
        }
    }
}
