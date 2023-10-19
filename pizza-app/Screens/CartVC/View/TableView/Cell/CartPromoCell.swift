
import UIKit

final class CartPromoCell: UITableViewCell {
    
    static var reuseId = "CartPromoCell"
    
    private var verticalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.directionalLayoutMargins = .init(top: 20, leading: 10, bottom: 20, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private var promoButton = CreateButton(style: .largeButton, text: "Ввести промокод")
    
    private var upperHorizontalStack = CreateStack(style: .simpleHorizontalStack)
    private var itemCount = CreateLabel(style: .nameLabel, text: "1")
    private var priceCount = CreateLabel(style: .nameLabel, text: "20 руб.")
    
    private var middleHorizontalStack = CreateStack(style: .simpleHorizontalStack)
    private var coinLabel = CreateLabel(style: .nameLabel, text: "Начислим бонусов")
    private var coinCount = CreateLabel(style: .nameLabel, text: "219")
    
    private var lowerHorizontalStack = CreateStack(style: .simpleHorizontalStack)
    private var deliverylabel = CreateLabel(style: .nameLabel, text: "Доставка")
    private var finalDelivery = CreateLabel(style: .nameLabel, text: "Бесплатно")
    
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
}
