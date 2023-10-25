
import UIKit

final class CallCell: UITableViewCell {
    
    static let reuseId = "CallView"
    
    private let container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let callLabel = CreateLabel(style: .largeLabel, text: "Связаться с поддержкой", alignment: .center)
    private let callButton = CreateButton(style: .buyButton, text: "Позвонить")
    
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
