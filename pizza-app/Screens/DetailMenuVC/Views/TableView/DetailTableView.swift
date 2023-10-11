
import UIKit

enum DetailSection: Int, CaseIterable {
    case product
    case pizzaSize
    case ingredient
}

 final class DetailTableView: UITableView {
     
     private var product: [Product] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        self.allowsSelection = false
        self.separatorStyle = .none
        
        self.delegate = self
        self.dataSource = self
        
        self.register(ProductDetailCell.self, forCellReuseIdentifier: ProductDetailCell.reuseId)
        self.register(DetailPizzaSize.self, forCellReuseIdentifier: DetailPizzaSize.reuseId)
        self.register(CollectionForTableCell.self, forCellReuseIdentifier: CollectionForTableCell.reuseId)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
     func update(_ product: [Product]) {
         self.product = product
     }
}



extension DetailTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let section = DetailSection(rawValue: section)
        
        switch section {
        case .product: return 1
        case .pizzaSize: return 1
        case .ingredient: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = DetailSection(rawValue: indexPath.section)
        
        switch section {
        case .product:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailCell.reuseId, for: indexPath) as! ProductDetailCell
            let product = product[indexPath.row]
            cell.update(product)
            return cell
            
        case .pizzaSize:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailPizzaSize.reuseId , for: indexPath) as! DetailPizzaSize
            return cell
            
        case .ingredient:
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionForTableCell.reuseId, for: indexPath) as! CollectionForTableCell
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

