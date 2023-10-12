
import UIKit

enum Section: Int, CaseIterable {
    case product
}

class MenuTableView: UITableView {
    
    private var product: [Product] = []
    
    private let headerTableView = HeaderTableView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
    
    init() {
        super.init(frame: .zero, style: .plain)
        
        self.showsVerticalScrollIndicator = false
        self.separatorStyle = .none
        
        self.delegate = self
        self.dataSource = self
        
        self.tableHeaderView = headerTableView
        
        self.register(CategoryCollectionView.self, forCellReuseIdentifier: CategoryCollectionView.reuseId)
        self.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: [Product]) {
        self.product = product
    }
}



extension MenuTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return CategoryCollectionView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = Section.init(rawValue: section)
        
        switch section {
        case .product: return product.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)
        
        switch section {
        case .product:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
            cell.selectionStyle = .none
            
            let pizza = product[indexPath.row]
            cell.update(pizza)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
