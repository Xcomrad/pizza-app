
import UIKit

final class EmptyView: UIView {
    
    private var verticalStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private var dogImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "dog")
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private var emtyLabel: UILabel = {
       let label = UILabel()
        label.text = "ОЙ, пусто!"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private var cartLabel: UILabel = {
       let label = UILabel()
        label.text = "Ваша корзина пуста, откройте «Меню» \n и выберите понравившейся товар."
        return label
    }()
    
    private var deliveryLabel: UILabel = {
       let label = UILabel()
        label.text = "Мы доставим ваш заказ от 20 руб."
        return label
    }()
    
    private var menuButton: UIButton = {
       let button = UIButton()
        button.setTitle("Перейти в Меню", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension EmptyView {
    
    private func setupViews() {
        self.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(dogImage)
        verticalStack.addArrangedSubview(emtyLabel)
        verticalStack.addArrangedSubview(cartLabel)
        verticalStack.addArrangedSubview(deliveryLabel)
        verticalStack.addArrangedSubview(menuButton)
    }
    
    private func setupConstraints() {
        dogImage.snp.makeConstraints { make in
            make.top.equalTo(self).inset(50)
            make.right.left.equalTo(self).inset(20)
        }
        verticalStack.snp.makeConstraints { make in
            make.top.equalTo(verticalStack.snp.bottom).inset(30)
            make.left.right.equalTo(self).inset(30)
        }
    }
}
