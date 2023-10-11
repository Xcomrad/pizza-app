
import UIKit

class DetailView: UIView {
    
    private var products: [Product] = []
    private var ingredient: [Ingredient] = []
    
    private var tableView = DetailTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    func update(_ product: [Product], _ ingredient: [Ingredient]) {
        self.products = product
        self.ingredient = ingredient
    }
}



extension DetailView {
    
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
