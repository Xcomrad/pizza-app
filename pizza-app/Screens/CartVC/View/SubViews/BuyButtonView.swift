
import UIKit

final class BuyButtonView: UIView {
    
    private let buyButton = CreateButton(style: .buyButton, text: "Оформить заказ")
    
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
    
    private func setupViews() {
        self.addSubview(buyButton)
    }
    
    private func setupConstraints() {
        buyButton.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(20)
        }
    }
}
