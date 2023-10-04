
import UIKit

final class HeaderTableComponent: UIView {
    
    private var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.backgroundColor = .systemGray6
        stack.layer.cornerRadius = 10
        stack.alignment = .center
        stack.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 20, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.addShadow(color: .black, opacity: 0.5, radius: 3, offset: CGSize(width: 0, height: 3))
        return stack
    }()
    
    private var horizontalStack: UIStackView = {
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
    
    private var deliveryButton: UIButton = {
        let button = UIButton()
        button.setTitle("На доставку", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 160).isActive = true
        return button
    }()
    
    private var hallButton: UIButton = {
        let button = UIButton()
        button.setTitle("В залле", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 160).isActive = true
        return button
    }()
    
    private var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Укажите ваш адрес >"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .systemOrange
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupButtonCollor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension HeaderTableComponent {
    
    private func setupViews() {
        self.addSubview(verticalStack)
        verticalStack.addArrangedSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(hallButton)
        horizontalStack.addArrangedSubview(deliveryButton)
        
        verticalStack.addArrangedSubview(addressLabel)
    }
    
    private func setupConstraints() {
        verticalStack.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.right.equalTo(self).inset(20)
        }
    }
    
   private func setupButtonCollor() {
        if deliveryButton.isSelected == true {
            deliveryButton.backgroundColor = .white
            hallButton.backgroundColor = .systemGray5
        } else {
            hallButton.backgroundColor = .white
            deliveryButton.backgroundColor = .systemGray5
        }
    }
}
