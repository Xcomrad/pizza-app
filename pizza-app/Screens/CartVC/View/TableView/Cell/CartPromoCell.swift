
import UIKit

class CartPromoCell: UITableViewCell {
    
    static var reuseId = "CartPromoCell"
    
    private var verticalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.directionalLayoutMargins = .init(top: 20, leading: 10, bottom: 20, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private var promoButton: UIButton = {
       let button = UIButton()
        button.setTitle("Ввести промокод", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemOrange.withAlphaComponent(0.6)
        button.setTitleColor(.brown, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    private var upperHorizontalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var itemCount: UILabel = {
        let label = UILabel()
        label.text = "1 товар"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var priceCount: UILabel = {
        let label = UILabel()
        label.text = "20 руб."
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var middleHorizontalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var coinLabel: UILabel = {
        let label = UILabel()
        label.text = "Начислим бонусов"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var coinCount: UILabel = {
        let label = UILabel()
        label.text = "219"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var lowerHorizontalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var deliverylabel: UILabel = {
        let label = UILabel()
        label.text = "Доставка"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var finalDelivery: UILabel = {
        let label = UILabel()
        label.text = "Бесплатно"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
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
    
    func setupConstraints() {
        verticalStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
