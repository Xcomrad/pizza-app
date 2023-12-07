
import Foundation

protocol MenuProvider {
    var menuApiClient: MenuApiClient { get }
    var router: Router { get }
}

class MenuProviderImpl: MenuProvider {
 
    let menuApiClient: MenuApiClient
    var router: Router
    
    init(menuApiClient: MenuApiClientImpl, router: Router) {
        self.menuApiClient = menuApiClient
        self.router = router
    }
}
