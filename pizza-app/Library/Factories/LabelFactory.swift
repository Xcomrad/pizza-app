
import UIKit


enum LabelStyle: Int {
    case nameLabel
    case detailLabel
    case largeDetail
    case largeLabel
}

class CreateLabel: UILabel {
    
    init(style: LabelStyle, text: String, alignment: NSTextAlignment ) {
        super.init(frame: .zero)
        
        switch style {
        case .nameLabel: self.createNameLabel(text: text, alignment: textAlignment)
        case .detailLabel: self.createDetailLabel(text: text, alignment: textAlignment)
        case .largeDetail: self.createLargeDetail(text: text, alignment: textAlignment)
        case .largeLabel: self.createLargeLabel(text: text, alignment: textAlignment)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createNameLabel(text: String, alignment: NSTextAlignment) {
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.numberOfLines = .max
    }
    
    func createDetailLabel(text: String, alignment: NSTextAlignment) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 13)
        self.textColor = .systemGray
        self.numberOfLines = .max
    }
    
    func createLargeDetail(text: String, alignment: NSTextAlignment) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 15)
        self.numberOfLines = .max
    }
    
    func createLargeLabel(text: String, alignment: NSTextAlignment) {
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 18)
    }
}
