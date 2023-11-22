
import Foundation

protocol MenuProvider {
    var menuApiClient: MenuApiClient { get }
}

class MenuProviderImpl: MenuProvider {
    
    let menuApiClient: MenuApiClient
    
    init(menuApiClient: MenuApiClientImpl) {
        self.menuApiClient = menuApiClient
    }
}
