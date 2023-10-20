
import UIKit

private enum CartSection: Int, CaseIterable {
    case totalPrice
    case product
    case promo
}

final class TableView: UITableView {
    
    private let service = OrderService()
    private let order = OrderService().order
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        
        self.allowsSelection = false
        self.separatorStyle = .none
        self.showsVerticalScrollIndicator = false
        
        self.dataSource = self
        self.delegate = self
        
        self.register(CartTotalPriceCell.self, forCellReuseIdentifier: CartTotalPriceCell.reuseId)
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
        case .totalPrice: return 1
        case .product: return service.order.products.count
        case .promo: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = CartSection(rawValue: indexPath.section)
        
        switch section {
        case .totalPrice:
            let cell = dequeueReusableCell(withIdentifier: CartTotalPriceCell.reuseId, for: indexPath) as! CartTotalPriceCell
            cell.update(service.order.totalCount, service.order.totalPrice)
            return cell
            
        case .product:
            let cell = dequeueReusableCell(withIdentifier: CartProductCell.reuseId, for: indexPath) as! CartProductCell
            let product = service.order.products[indexPath.row]
            cell.update(product: product, index: indexPath.row)
            
            cell.stepper.addTarget(self, action: #selector(productCountChanged(stepper:)), for: .valueChanged)
            
            return cell
            
        case .promo:
            let cell = dequeueReusableCell(withIdentifier: CartPromoCell.reuseId, for: indexPath) as! CartPromoCell
            cell.update(service.order.totalPrice, service.order.totalCoin)
            return cell
            
        default:
            return UITableViewCell()
            
        }
    }
    
    @objc func productCountChanged(stepper: Stepper) {
        service.order.products[stepper.index].count = stepper.countValue
        self.reloadData()
        
        if stepper.countValue == 0 {
            service.order.products.remove(at: stepper.index)
            self.reloadData()
        }
    }
}
