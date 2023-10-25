
import UIKit

//enum CartState {
//    case loaded
//    case noData
//}

final class CartView: UIView {
    
    private var service = OrderService()
    
    let emptyView = EmptyView()
    let tableView = CartTableView()
    private let buyButton = BuyButtonView()
    
    //    private var state: CartState {
    //        didSet {
    //            switch state {
    //            case .loaded:
    //                emptyView.isHidden = true
    //               tableView.isHidden = false
    //                buyButton.isHidden = false
    //                tableView.reloadData()
    //
    //            case .noData:
    //                emptyView.isHidden = false
    //                tableView.isHidden = true
    //                buyButton.isHidden = true
    //            }
    //        }
    //    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
        
        tableView.onProductIsChange = {
            self.swichState()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func swichState() {
        if service.order.products.isEmpty {
            emptyView.isHidden = true
            tableView.isHidden = false
            buyButton.isHidden = false
        } else {
            emptyView.isHidden = false
            tableView.isHidden = true
            buyButton.isHidden = true
        }
    }
}

