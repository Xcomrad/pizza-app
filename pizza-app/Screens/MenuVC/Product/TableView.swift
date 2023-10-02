
import UIKit
import SnapKit

enum Section: Int, CaseIterable {
    case banner
    case ingredient
    case product
}

class TableView: UIViewController {
    
    var pizzaService = PizzaService()
    var product: [Pizza] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CategoryCollectionView.self, forCellReuseIdentifier: CategoryCollectionView.reuseId)
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        product = pizzaService.fetchPizza()
    }
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}



extension TableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = Section.init(rawValue: section)
        
        switch section {
        case .banner: return 1
        case .ingredient: return 1
        case .product: return product.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = Section(rawValue: indexPath.section)
        
        switch section {
        case .ingredient:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCollectionView.reuseId, for: indexPath) as! CategoryCollectionView
            return cell
            
        case .product:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
            let pizza = product[indexPath.row]
            cell.update(pizza)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
