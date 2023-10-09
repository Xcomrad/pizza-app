
import UIKit

enum DetailSection: Int, CaseIterable {
    case product
    case pizzaSize
    case ingredient
}

class DetailMenuVC: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ProductDetailCell.self, forCellReuseIdentifier: ProductDetailCell.reuseId)
        tableView.register(DetailPizzaSize.self, forCellReuseIdentifier: DetailPizzaSize.reuseId)
        tableView.register(IngredientCollectionView.self, forCellReuseIdentifier: IngredientCollectionView.reuseId)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}



extension DetailMenuVC: UITableViewDelegate, UITableViewDataSource {
    
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
            return cell
            
        case .pizzaSize:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailPizzaSize.reuseId , for: indexPath) as! DetailPizzaSize
            return cell
            
        case .ingredient:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCollectionView.reuseId, for: indexPath) as! IngredientCollectionView
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

