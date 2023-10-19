
import UIKit

 private enum CartSection: Int, CaseIterable {
    case product
    case promo
}

final class TableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        
        self.allowsSelection = false
        self.showsVerticalScrollIndicator = false
        
        self.dataSource = self
        self.delegate = self
        
        self.register(CartProductCell.self, forCellReuseIdentifier: CartProductCell.reuseId)
        self.register(CartPromoCell.self, forCellReuseIdentifier: CartPromoCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension TableView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return CartSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = CartSection(rawValue: section)
        
        switch section {
        case .product: return 3
        case .promo: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = CartSection(rawValue: indexPath.section)
        
        switch section {
        case .product:
            let cell = dequeueReusableCell(withIdentifier: CartProductCell.reuseId, for: indexPath) as! CartProductCell
            return cell
            
        case .promo:
            let cell = dequeueReusableCell(withIdentifier: CartPromoCell.reuseId, for: indexPath) as! CartPromoCell
            return cell
        default:
            return UITableViewCell()
            
        }
    }
}
