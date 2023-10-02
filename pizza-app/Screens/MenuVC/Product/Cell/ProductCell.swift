
import UIKit

class ProductCell: UITableViewCell {
    
    static var reuseId = "ProductCell"
    
    // Stacks
    var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    //Views
    var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.numberOfLines = 3
        return label
    }()
    
    var priceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange.withAlphaComponent(0.5)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.systemBrown, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return button
    }()
    
    var bageLabel: UILabelPadding = {
        var label = UILabelPadding()
        label.textColor = .white
        label.text = "New"
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
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
        contentView.addSubview(horizontalStackView)
        contentView.addSubview(bageLabel)
        
        horizontalStackView.addArrangedSubview(productImageView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(detailLabel)
        verticalStackView.addArrangedSubview(priceButton)
    }
    
    func setupConstraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func update(_ product: Pizza) {
        productImageView.image = UIImage(named: "\(product.image)")
        nameLabel.text = product.name
        detailLabel.text = product.detail
        priceButton.setTitle("\(product.price) p.", for: .normal)
        
        if product.isNew == true {
            bageLabel.snp.makeConstraints { make in
                make.right.equalTo(productImageView).inset(10)
                make.top.equalTo(productImageView).offset(15)
            }
        }
    }
}


extension ProductCell {
    
    class UILabelPadding: UILabel {
        
        let padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: padding))
        }
        
        override var intrinsicContentSize : CGSize {
            let superContentSize = super.intrinsicContentSize
            let width = superContentSize.width + padding.left + padding.right
            let heigth = superContentSize.height + padding.top + padding.bottom
            return CGSize(width: width, height: heigth)
        }
    }
}
