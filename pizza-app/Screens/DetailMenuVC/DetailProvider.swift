
import Foundation

protocol DetailProvider {
    func saveOrder()
    func retrieveOrder() -> [Product]
}

class DetailProviderImpl: DetailProvider {
 
    let cartArchiver: CartArchiver
    
     init(cartArchiver: CartArchiver) {
        self.cartArchiver = cartArchiver
    }
    
    func saveOrder() {
        cartArchiver.save([])
    }
    
    func retrieveOrder() -> [Product] {
       return cartArchiver.retrieve()
    }
}
