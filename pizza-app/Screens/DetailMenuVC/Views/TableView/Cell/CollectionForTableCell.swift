
import UIKit

final class CollectionForTableCell: UITableViewCell {
    
    static var reuseId = "CollectionForTableCell"
    
    private let collectionView = DetailCollectionView()
    
    private var ingredient: [Ingredient] = []
    private let service = IngredientService()
    
    private var containerView: UIStackView = {
        let stack = UIStackView()
        stack.heightAnchor.constraint(equalToConstant: 1350).isActive = true
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupContraints()
        
        ingredient = service.fetchIngredient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(containerView)
        containerView.addArrangedSubview(collectionView)
    }
    
    private func setupContraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(containerView)
        }
    }
}



