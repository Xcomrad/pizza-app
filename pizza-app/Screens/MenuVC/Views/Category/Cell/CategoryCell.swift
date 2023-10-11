
import UIKit

class CategoryCell: UICollectionViewCell {
    
    static var reuseId = "CategoryCell"
    
    var button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        button.setTitleColor(.systemOrange, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addShadow(color: .black, opacity: 0.5, radius: 5, offset: CGSize(width: 0, height: 5))
        button.directionalLayoutMargins = .init(top: 0, leading: 0, bottom: 0, trailing: 10)
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.addSubview(button)
    }
    
    func setupConstraints() {
        button.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func update(_ category: Category) {
        button.setTitle("\(category.name)", for: .normal)
    }
}
