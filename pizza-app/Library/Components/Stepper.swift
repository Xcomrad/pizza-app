
import UIKit

final class Stepper: UIControl {
    
    ///Устанавливается значение ConterView
    var countValue = 0 {
        didSet {
            countValue = countValue > 0 ? countValue : 0
            countLabel.text = "\(countValue)"
        }
    }
    
    ///Индекс ячейки
    var index: Int = 0
    
    private let containerStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
       
        return stack
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 12
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()

    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 12
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.layer.cornerRadius = 12
        self.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 247/255, alpha: 1)
        
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupViews() {
        self.addSubview(containerStack)
        
        containerStack.addArrangedSubview(decreaseButton)
        containerStack.addArrangedSubview(countLabel)
        containerStack.addArrangedSubview(increaseButton)
    }
    
    private func setupConstraints() {
        containerStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        switch sender {
        case decreaseButton:
            countValue -= 1
        case increaseButton:
            countValue += 1
        default:
            break
        }
        sendActions(for: .valueChanged)
    }
}
