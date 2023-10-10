
import UIKit

final class ButtonsView: UITableViewCell {
    
    static var reuseId = "ButtonsView"
    
    private var container: UIStackView = {
        let stack = UIStackView()
        stack.directionalLayoutMargins = .init(top: 10, leading: 0, bottom: 10, trailing: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.heightAnchor.constraint(equalToConstant: 90).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var horizontalStack: UIStackView = {
        var stackView = UIStackView.init()
        stackView.spacing = 30
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets (top: 0, leading: 50, bottom: 0, trailing: 50)
        return stackView
    }()
    
    private var fbButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "fb"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var instButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "inst"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var youtubButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "you"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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



extension ButtonsView {
    
    private func setupViews() {
        contentView.addSubview(container)
        
        container.addArrangedSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(fbButton)
        horizontalStack.addArrangedSubview(instButton)
        horizontalStack.addArrangedSubview(youtubButton)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        horizontalStack.snp.makeConstraints { make in
            make.edges.equalTo(container).inset(20)
        }
    }
}
