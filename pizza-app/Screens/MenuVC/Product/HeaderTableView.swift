
import UIKit

class HeaderTableView: UIView {
    
    let bannerCollection = BannerCollectionView()
    
    var containerStack: UIStackView = {
       let container = UIStackView()
        container.heightAnchor.constraint(equalToConstant: 150).isActive = true
        container.isLayoutMarginsRelativeArrangement = false
        return container
    }()
    
    var verticalStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.backgroundColor = .systemGray6
        stack.layer.cornerRadius = 10
        stack.alignment = .center
        stack.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 20, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    var horizontalStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemGray5
        stack.layer.cornerRadius = 10
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    var deliveryButton: UIButton = {
       let button = UIButton()
        button.setTitle("На доставку", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 160).isActive = true
        return button
    }()
    
    var hallButton: UIButton = {
       let button = UIButton()
        button.setTitle("В залле", for: .normal)
        button.backgroundColor = .systemGray5
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 180).isActive = true
        return button
    }()
    
    var addressLabel: UILabel = {
       let label = UILabel()
        label.text = "Укажите ваш адрес >"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .systemOrange
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension HeaderTableView {
    
    func setupViews() {
        self.addSubview(verticalStack)
        verticalStack.addArrangedSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(deliveryButton)
        horizontalStack.addArrangedSubview(hallButton)

        verticalStack.addArrangedSubview(addressLabel)
        
        self.addSubview(containerStack)
        containerStack.addSubview(bannerCollection)
    }
    
    func setupContraints() {
        verticalStack.snp.makeConstraints { make in
            make.top.left.right.equalTo(self).inset(20)
        }
        containerStack.snp.makeConstraints { make in
            make.top.equalTo(verticalStack).inset(150)
            make.left.right.equalTo(self)
        }
        bannerCollection.snp.makeConstraints { make in
            make.edges.equalTo(containerStack)
        }
    }
}
