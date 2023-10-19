
import UIKit


enum LabelStyle: Int {
    case nameLabel
    case detailLabel
    case largeDetail
    case largeLabel
}

class CreateLabel: UILabel {
    
    init(style: LabelStyle, text: String) {
        super.init(frame: .zero)
        
        switch style {
        case .nameLabel: self.createNameLabel(text: text)
        case .detailLabel: self.createDetailLabel(text: text)
        case .largeDetail: self.createLargeDetail(text: text)
        case .largeLabel: self.createLargeLabel(text: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createNameLabel(text: String) {
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    func createDetailLabel(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 13)
        self.textColor = .systemGray
        self.textAlignment = .left
        self.numberOfLines = .max
    }
    
    func createLargeDetail(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 20)
        self.textAlignment = .left
    }
    
    func createLargeLabel(text: String) {
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 17)
        self.textAlignment = .left
    }
}
