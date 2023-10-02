
import UIKit

struct Banner {
    var image: String
}

struct BannerService {
    let banner: [Banner] = [
        Banner(image: "01"),
        Banner(image: "02"),
        Banner(image: "03"),
        Banner(image: "04"),
        Banner(image: "05"),
        Banner(image: "06"),
        Banner(image: "07")
    ]
    
    func fetchBanner() -> [Banner] {
        return banner
    }
}
