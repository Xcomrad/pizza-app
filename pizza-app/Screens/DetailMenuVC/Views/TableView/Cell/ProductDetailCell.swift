
import UIKit

final class ProductDetailCell: UITableViewCell {
    
    static var reuseId = "ProductDetailCell"
    
    private var container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    private var namelabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .systemGray4
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


extension ProductDetailCell {
    
    private func setupViews() {
        contentView.addSubview(container)
        
        container.addArrangedSubview(detailImageView)
        container.addArrangedSubview(namelabel)
        container.addArrangedSubview(detailLabel)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func update(_ product: Product) {
        detailImageView.image = UIImage(named: "\(product.image)")
        namelabel.text = product.name
        detailLabel.text = product.detail
    }
}
