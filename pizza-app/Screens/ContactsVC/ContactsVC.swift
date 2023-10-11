
import UIKit

final class ContactsVC: UIViewController {
    
    private var contactsView: ContactsView { return self.view as! ContactsView }
    
    override func loadView() {
        super.loadView()
        self.view = ContactsView.init(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}




