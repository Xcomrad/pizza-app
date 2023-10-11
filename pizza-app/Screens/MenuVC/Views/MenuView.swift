
import UIKit

class MenuView: UIView {
    
    private var products: [Product] = []
    
    private var tableView = MenuTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    func update(_ products: [Product]) {
        self.products = products
        tableView.update(products)
    }
}



extension MenuView {
    
    private func setupViews() {
        self.backgroundColor = .white
        self.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}