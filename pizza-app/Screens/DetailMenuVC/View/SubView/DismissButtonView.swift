
import UIKit

class DismissButtonView: UIView {
    
    var onCloseDetail: (()->())?
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down.circle.fill"), for: .normal)
        button.tintColor = .systemOrange
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.addShadow(color: .black, opacity: 0.5, radius: 5, offset: CGSize(width: 0, height: 5))
        button.addTarget(self, action: #selector(closeScreen(sender:)), for: .touchUpInside)
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



extension DismissButtonView {
    
    func setupViews() {
        self.addSubview(button)
    }
    
    func setupConstraints() {
        button.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    // MARK: - Action
    @objc func closeScreen(sender: UIButton) {
        self.onCloseDetail?()
    }
}


