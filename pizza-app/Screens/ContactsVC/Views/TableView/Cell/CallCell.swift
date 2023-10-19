
import UIKit

final class CallCell: UITableViewCell {
    
    static var reuseId = "CallView"
    
    private var container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var callLabel = CreateLabel(style: .largeLabel, text: "Связаться с поддержкой")
    
    private var callButton: UIButton = {
        let button = UIButton()
        button.setTitle("Позвонить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 15
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
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



extension CallCell {
    
    private func setupViews() {
        contentView.addSubview(container)
        
        container.addArrangedSubview(callLabel)
        container.addArrangedSubview(callButton)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(20)
        }
    }
}
