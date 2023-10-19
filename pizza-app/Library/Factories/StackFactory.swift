
import UIKit


enum StackStyle: Int {
    case simpleHorizontalStack
}


class CreateStack: UIStackView {
    
    init(style: StackStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .simpleHorizontalStack: self.createSimpleHorizontalStack()
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSimpleHorizontalStack() {
        self.axis = .horizontal
        self.distribution = .equalSpacing
    }
}

