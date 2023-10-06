
import UIKit

final class DetailIngredientCell: UICollectionViewCell {
    
    static var reuseId = "DetailIngredientCell"
    
    private var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 15
        stack.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private var ingredientImage: UIImageView = {
        let image = UIImageView()
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension DetailIngredientCell {
    
    private func setupViews() {
        contentView.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(ingredientImage)
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(priceLabel)
    }
    
    private func setupConstraints() {
        verticalStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func update(_ ingredient: Ingredients) {
        ingredientImage.image = UIImage(named: "\(ingredient.image)")
        nameLabel.text = ingredient.name
        priceLabel.text = "\(ingredient.price) руб."
    }
    
    private func setupShadow() {
        self.addShadow(color: .black, opacity: 0.5, radius: 8, offset: CGSize(width: 0, height: 5))
    }
}
