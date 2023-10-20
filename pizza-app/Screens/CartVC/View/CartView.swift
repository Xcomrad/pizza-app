
import UIKit

final class CartView: UIView {
    
   private let service = OrderService()
    
    private let tableView = TableView()
    private let buyView = BuyButtonView(frame: (CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30)))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
        updateButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func setupViews() {
       self.addSubview(tableView)
       self.addSubview(buyView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(buyView.snp.top)
        }
        buyView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func updateButton() {
        buyView.update(service.order.totalPrice)
    }
}
