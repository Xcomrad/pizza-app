
import UIKit

enum ButtonStyle: Int {
    case priceButton
    case imageButton
    case largeButton
}

class Buttons: UIButton {
    
    init(style: ButtonStyle, text: String) {
        super.init(frame: .zero)
        
        switch style {
        case .priceButton: priceButton(text: text)
        case .imageButton: imageButton(text: text)
        case .largeButton: createLargeButton(text: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func priceButton(text: String) {
        self.setTitle(text, for: .normal)
        self.backgroundColor = .systemOrange.withAlphaComponent(0.6)
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func imageButton(text: String) {
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
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.backgroundColor = .orange.withAlphaComponent(0.7)
        self.layer.cornerRadius = 25
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

