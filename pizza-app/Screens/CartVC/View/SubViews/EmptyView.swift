
import UIKit

final class EmptyView: UIView {
    
    var onEnterMenuVC: (()->())?

    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    private let dogImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dog")
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let headerLabel = CreateLabel(style: .largeLabel, text: "Ой, пусто!", alignment: .center)
    private let middleLabel = CreateLabel(style: .largeDetail, text: "Ваша корзина пуста, откройте «Меню» и выберите понравившейся товар.", alignment: .center)
    private let footerLabel = CreateLabel(style: .detailLabel, text: "Мы доставим ваш заказ от 20 руб.", alignment: .center)
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти в Меню", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 15
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.addTarget(self, action: #selector (enterMenuVC(sender:)), for: .touchUpInside)
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
}



extension EmptyView {
    
    private func setupViews() {
        self.addSubview(dogImage)
        self.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(headerLabel)
        verticalStack.addArrangedSubview(middleLabel)
        verticalStack.addArrangedSubview(footerLabel)
        
        self.addSubview(menuButton)
    }
    
    
    private func setupConstraints() {
        dogImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(50)
            make.left.right.equalTo(self).inset(30)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.top.equalTo(dogImage.snp.bottom).inset(-30)
            make.left.right.equalTo(dogImage)
        }
        
        menuButton.snp.makeConstraints { make in
            make.left.right.equalTo(dogImage).inset(30)
            make.top.equalTo(verticalStack.snp.bottom).offset(30)
        }
    }
    
    // MARK: - Action
    @objc func enterMenuVC(sender: UIButton) {
        self.onEnterMenuVC?()
    }
}

