
import UIKit

enum SetupViews: Int, CaseIterable {
    case call
    case buttons
    case documents
}

class ContactsTableView: UITableView {
    
    let header = MapHeaderView.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 350))
    
    init() {
        super.init(frame: .zero, style: .plain)
            
            self.delegate = self
            self.dataSource = self
            self.allowsSelection = false
            self.separatorStyle = .none
            
            self.tableHeaderView = header
            
            self.register(CallCell.self, forCellReuseIdentifier: CallCell.reuseId)
            self.register(ButtonsCell.self, forCellReuseIdentifier: ButtonsCell.reuseId)
            self.register(DocumentsCell.self, forCellReuseIdentifier: DocumentsCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension ContactsTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SetupViews.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = SetupViews(rawValue: section)
        
        switch section {
        case .call: return 1
        case .buttons: return 1
        case .documents: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = SetupViews.init(rawValue: indexPath.section)
        
        switch section {
        case .call:
            let cell = tableView.dequeueReusableCell(withIdentifier: CallCell.reuseId, for: indexPath) as! CallCell
            return cell
            
        case .buttons:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonsCell.reuseId, for: indexPath) as! ButtonsCell
            return cell
            
        case.documents:
            let cell = tableView.dequeueReusableCell(withIdentifier: DocumentsCell.reuseId, for: indexPath) as! DocumentsCell
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
