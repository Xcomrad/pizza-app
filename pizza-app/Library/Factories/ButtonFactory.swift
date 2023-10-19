
import UIKit


enum ButtonStyle: Int {
    case priceButton
    case imageButton
    case largeButton
}

class CreateButton: UIButton {
    
    init(style: ButtonStyle, text: String) {
        super.init(frame: .zero)
        
        switch style {
        case .priceButton: self.createPriceButton(text: text)
        case .imageButton: self.createImageButton(text: text)
        case .largeButton: self.createLargeButton(text: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPriceButton(text: String) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(.systemGray, for: .normal)
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func createImageButton(text: String) {
        self.setImage(UIImage(named: text), for: .normal)
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.widthAnchor.constraint(equalToConstant: 45).isActive = true
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createLargeButton(text: String) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemOrange.withAlphaComponent(0.6)
        self.setTitleColor(.brown, for: .normal)
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

