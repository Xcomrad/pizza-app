
import UIKit

final class DocumentsCell: UITableViewCell {
    
    static var reuseId = "DocumentsView"
    
    private var container: UIStackView = {
        let stack = UIStackView()
        stack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var horizontalStack = CreateStack(style: .simpleHorizontalStack)
    private var docLabel = CreateLabel(style: .largeDetail, text: "Правовые документы", alignment: .left)
    
    private var docButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .systemOrange
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



extension DocumentsCell {
    
    private func setupViews() {
        contentView.addSubview(container)
        
        container.addArrangedSubview(horizontalStack)
        horizontalStack.addArrangedSubview(docLabel)
        horizontalStack.addArrangedSubview(docButton)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(20)
        }
    }
}
