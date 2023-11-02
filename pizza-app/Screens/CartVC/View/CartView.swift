
import UIKit

final class CartView: UIView {
    
    private var order = Order(products: [])
    
    let emptyView = EmptyView()
    let tableView = CartTableView()
    private let buyButton = CartBuyButtonView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public
    func update(_ order: Order) {
        self.order = order

        tableView.update(order)
        tableView.reloadData()

        swichState()
    }
}



extension CartView {
    
    private func setupViews() {
        self.addSubview(emptyView)
        self.addSubview(tableView)
        self.addSubview(buyButton)
        
    }
    
    private func setupConstraints() {
        
        emptyView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(buyButton.snp.top)
        }
        
        buyButton.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
   private func swichState() {
        if order.products.isEmpty {
            tableView.isHidden = true
            buyButton.isHidden = true
            emptyView.isHidden = false
        } else {
            tableView.isHidden = false
            buyButton.isHidden = false
            emptyView.isHidden = true
        }
    }
}

