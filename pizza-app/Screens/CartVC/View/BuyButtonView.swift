
import UIKit

class BuyButtonView: UIView {
    
    let buyButton = CreateButton(style: .buyButton, text: "" )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension BuyButtonView {
    
    func setupViews() {
        self.addSubview(buyButton)
    }
    
    func setupConstraints() {
        buyButton.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(20)
        }
    }
    
    func update(_ price: Int) {
        buyButton.setTitle("Оформить заказ на \(price) руб.", for: .normal)
    }
}
