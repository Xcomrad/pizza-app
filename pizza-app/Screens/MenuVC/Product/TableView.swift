
import UIKit
import SnapKit

enum Section: Int, CaseIterable {
    case product
}

final class TableView: UIViewController {
    
    private let headerTableView = HeaderTableView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
    
    private let pizzaService = PizzaService()
    private var product: [Pizza] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView = headerTableView
        
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
}



extension TableView: UITableViewDelegate, UITableViewDataSource {
    
    // show DetailMenuVC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = DetailMenuVC()
        self.present(detail, animated: true)
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



extension TableView {
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
