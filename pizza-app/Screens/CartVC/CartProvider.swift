
import Foundation

protocol CartProvider {
    func saveOrder()
    func retrieveOrder() -> [Product]
}

class CartProviderImpl: CartProvider {
    
    let cartArchiver: CartArchiver
    
    init(cartArchiver: CartArchiverImpl) {
        self.cartArchiver = cartArchiver
    }
    
    func saveOrder() {
        cartArchiver.save([])
    }
    
    func retrieveOrder() -> [Product] {
       return cartArchiver.retrieve()
    }
}
