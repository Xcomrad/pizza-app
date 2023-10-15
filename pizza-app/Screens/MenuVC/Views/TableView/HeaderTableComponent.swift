
import UIKit

final class HeaderTableComponent: UIView {
    
    private var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        stack.backgroundColor = .systemGray6
        stack.layer.cornerRadius = 10
        stack.addShadow(color: .black, opacity: 0.5, radius: 5, offset: CGSize(width: 0, height: 5))
        stack.directionalLayoutMargins = .init(top: 20, leading: 10, bottom: 10, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private lazy var segmentControll: UISegmentedControl = {
        let segmentArray = ["В пиццерии", "На доставку"]
        let controll = UISegmentedControl(items: segmentArray)
   
        controll.selectedSegmentIndex = 0
        controll.selectedSegmentTintColor = .systemOrange.withAlphaComponent(0.6)
        controll.heightAnchor.constraint(equalToConstant: 40).isActive = true
        controll.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return controll
    }()
    
   private var separator: UIView = {
       let separator = UIView()
        separator.backgroundColor = .systemGray5
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
       separator.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return separator
    }()
    
    private lazy var addressButton: UIButton = {
       let button = UIButton()
        button.setTitle("Указать адрес доставки >", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        //button.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
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



extension HeaderTableComponent {
    
    private func setupViews() {
        self.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(segmentControll)
        verticalStack.addArrangedSubview(separator)
        verticalStack.addArrangedSubview(addressButton)
    }
    
    private func setupConstraints() {
        verticalStack.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.left.right.equalTo(self).inset(20)
        }
    }
}
