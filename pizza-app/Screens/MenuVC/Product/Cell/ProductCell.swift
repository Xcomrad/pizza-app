
import UIKit

final class ProductCell: UITableViewCell {
    
    static var reuseId = "ProductCell"
    
    private var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.numberOfLines = .max
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemOrange
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var bageLabel: UILabelPadding = {
        var label = UILabelPadding()
        label.textColor = .white
        label.text = "New!"
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
}



extension ProductCell {
    
    private func setupViews() {
        contentView.addSubview(horizontalStackView)
        contentView.addSubview(bageLabel)
        
        horizontalStackView.addArrangedSubview(productImageView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(detailLabel)
        verticalStackView.addArrangedSubview(priceLabel)
 
    }
    
    private func setupConstraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}



extension ProductCell {
    
    func update(_ product: Pizza) {
        productImageView.image = UIImage(named: "\(product.image)")
        nameLabel.text = product.name
        detailLabel.text = product.detail
        priceLabel.text = "\(product.price) руб."
        
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
