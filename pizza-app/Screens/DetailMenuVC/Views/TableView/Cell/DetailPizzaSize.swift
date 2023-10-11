
import UIKit

final class DetailPizzaSize: UITableViewCell {
    
    static var reuseId = "DetailPizzaSize"
    
    private var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemGray5
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.layer.cornerRadius = 10
        stack.addShadow(color: .black, opacity: 0.5, radius: 5, offset: CGSize(width: 0, height: 5))
        stack.directionalLayoutMargins = .init(top: 10, leading: 20, bottom: 10, trailing: 20)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private var littleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Маленькая", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return button
    }()
    
    private var midleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Средняя", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return button
    }()
    
    private var hightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Большая", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        setupSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension DetailPizzaSize {
    
    private func setupViews() {
        self.addSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(littleButton)
        horizontalStack.addArrangedSubview(midleButton)
        horizontalStack.addArrangedSubview(hightButton)
    }
    
    private func setupConstraints() {
        horizontalStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(20)
            make.left.right.equalTo(self).inset(10)
        }
    }
    
    private func setupSize() {
        if midleButton.isSelected == true {
            midleButton.backgroundColor = .white
            littleButton.backgroundColor = .systemGray5
            hightButton.backgroundColor = .systemGray5
        } else if
            littleButton.isSelected == true {
            littleButton.backgroundColor = .white
            midleButton.backgroundColor = .systemGray5
            hightButton.backgroundColor = .systemGray5
        } else if
            hightButton.isSelected == true {
            hightButton.backgroundColor = .white
            midleButton.backgroundColor = .systemGray5
            littleButton.backgroundColor = .systemGray5
        }
    }
}
