
import UIKit

enum Views: Int, CaseIterable {
    case call
    case buttons
    case documents
}

final class ContactsVC: UIViewController {
    
    let header = MapHeaderView.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 350))
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        tableView.tableHeaderView = header
        
        tableView.register(CallView.self, forCellReuseIdentifier: CallView.reuseId)
        tableView.register(ButtonsView.self, forCellReuseIdentifier: ButtonsView.reuseId)
        tableView.register(DocumentsView.self, forCellReuseIdentifier: DocumentsView.reuseId)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
}



extension ContactsVC {
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}



extension ContactsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Views.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = Views(rawValue: section)
        
        switch section {
        case .call: return 1
        case .buttons: return 1
        case .documents: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = Views.init(rawValue: indexPath.section)
        
        switch section {
        case .call:
            let cell = tableView.dequeueReusableCell(withIdentifier: CallView.reuseId, for: indexPath) as! CallView
            return cell
            
        case .buttons:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonsView.reuseId, for: indexPath) as! ButtonsView
            return cell
            
        case.documents:
            let cell = tableView.dequeueReusableCell(withIdentifier: DocumentsView.reuseId, for: indexPath) as! DocumentsView
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
