
import UIKit

final class DetailBuyButtonView: UIView {
    
    var onAddProductInCart: (()->())?
    
    private lazy var buyButton: UIButton = {
        let button = CreateButton(style: .buyButton, text: "В корзину")
        button.addTarget(self, action: #selector(addProductInCart(sender:)), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension DetailBuyButtonView {
    
    private func setupViews() {
        self.backgroundColor = .white
        self.addSubview(buyButton)
    }
    
    private func setupConstraints() {
        buyButton.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(20)
        }
    }
    
    //MARK: - Action
    @objc func addProductInCart(sender: UIButton) {
        onAddProductInCart?()
    }
}
