
import UIKit

final class CartPromoCell: UITableViewCell {
    
    static let reuseId = "CartPromoCell"
    
    private let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.directionalLayoutMargins = .init(top: 20, leading: 10, bottom: 20, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let promoButton = CreateButton(style: .largeButton, text: "Ввести промокод")
    
    private let upperHorizontalStack = CreateStack(style: .simpleHorizontalStack)
    private let itemCount = CreateLabel(style: .nameLabel, text: "Вкусняшек на сумму", alignment: .left)
    private lazy var priceCount = CreateLabel(style: .nameLabel, text: "", alignment: .left )
    
    private let middleHorizontalStack = CreateStack(style: .simpleHorizontalStack)
    private let coinLabel = CreateLabel(style: .nameLabel, text: "Начислим бонусов", alignment: .left)
    private lazy var coinCount = CreateLabel(style: .nameLabel, text: "", alignment: .left )
    
    private let lowerHorizontalStack = CreateStack(style: .simpleHorizontalStack)
    private let deliverylabel = CreateLabel(style: .nameLabel, text: "Доставка", alignment: .left)
    private let finalDelivery = CreateLabel(style: .nameLabel, text: "Бесплатно", alignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension CartPromoCell {
    
    private func setupViews() {
        contentView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(promoButton)
        
        verticalStack.addArrangedSubview(upperHorizontalStack)
        upperHorizontalStack.addArrangedSubview(itemCount)
        upperHorizontalStack.addArrangedSubview(priceCount)
        
        verticalStack.addArrangedSubview(middleHorizontalStack)
        middleHorizontalStack.addArrangedSubview(coinLabel)
        middleHorizontalStack.addArrangedSubview(coinCount)
        
        verticalStack.addArrangedSubview(lowerHorizontalStack)
        lowerHorizontalStack.addArrangedSubview(deliverylabel)
        lowerHorizontalStack.addArrangedSubview(finalDelivery)
    }
    
    private  func setupConstraints() {
        verticalStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    // MARK: - Public
    func update(_ price: Int, _ coin: Int) {
        priceCount.text = "\(price) руб."
        coinCount.text = "+\(coin)"
    }
}
