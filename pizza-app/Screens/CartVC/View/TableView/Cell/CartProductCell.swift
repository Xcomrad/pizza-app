
import UIKit

final class CartProductCell: UITableViewCell {
    
    let stepper = Stepper()
    
    static let reuseId = "CartProductCell"
    
    private let rootVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let upperHrizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private let middleVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let lowerHrizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    private let nameLabel = CreateLabel(style: .largeLabel, text: "", alignment: .left)
    private let detailLabel = CreateLabel(style: .detailLabel, text: "", alignment: .left)
    private let priceLabel = CreateLabel(style: .largeLabel, text: "", alignment: .left)
    
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
        contentView.addSubview(rootVerticalStackView)
        
        rootVerticalStackView.addArrangedSubview(upperHrizontalStackView)
        upperHrizontalStackView.addArrangedSubview(productImageView)
        
        upperHrizontalStackView.addArrangedSubview(middleVerticalStackView)
        middleVerticalStackView.addArrangedSubview(nameLabel)
        middleVerticalStackView.addArrangedSubview(detailLabel)
        
        rootVerticalStackView.addArrangedSubview(lowerHrizontalStackView)
        lowerHrizontalStackView.addArrangedSubview(priceLabel)
        lowerHrizontalStackView.addArrangedSubview(stepper)
    }
    
    private func setupConstraints() {
        rootVerticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    // MARK: - Public
    func update(product: ProductModel, index: Int) {
        productImageView.image = UIImage(named: product.image)
        nameLabel.text = "\(product.name)"
        detailLabel.text = "\(product.detail)"
        priceLabel.text = "\(product.price) руб."
        
        stepper.countValue = product.count ?? 0
        
        stepper.index = index
    }
}
