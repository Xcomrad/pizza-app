
import UIKit

final class CartProductCell: UITableViewCell {
    
    private var stepper = Stepper()
    
    static var reuseId = "CartProductCell"
    
    private var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private var upperHrizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private var middleVerticalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var lowerHrizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Карри-пицца"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var priceLabel: UILabel = {
       let label = UILabel()
        label.text = "20 руб."
        label.font = UIFont.boldSystemFont(ofSize: 17)
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
}



extension CartProductCell {
    
    private func setupViews() {
        contentView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(upperHrizontalStack)
        upperHrizontalStack.addArrangedSubview(productImageView)
        
        upperHrizontalStack.addArrangedSubview(middleVerticalStack)
        middleVerticalStack.addArrangedSubview(nameLabel)
        
        verticalStackView.addArrangedSubview(lowerHrizontalStack)
        lowerHrizontalStack.addArrangedSubview(priceLabel)
        lowerHrizontalStack.addArrangedSubview(stepper)
     }
     
     private func setupConstraints() {
         verticalStackView.snp.makeConstraints { make in
             make.edges.equalTo(contentView)
         }
     }
}
