
import UIKit

final class HeaderTableView: UIView {
    
    private let component = HeaderTableComponent()
    private let bannerCollection = BannerCollectionView()
    
    private var containerStack: UIStackView = {
        let container = UIStackView()
        container.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return container
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



extension HeaderTableView {
    
    private func setupViews() {
        self.addSubview(component)
        self.addSubview(containerStack)
        
        containerStack.addSubview(bannerCollection)
    }
    
    private func setupConstraints() {
        component.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
        }
        containerStack.snp.makeConstraints { make in
            make.top.equalTo(component).inset(150)
            make.left.right.equalTo(self)
        }
        bannerCollection.snp.makeConstraints { make in
            make.edges.equalTo(containerStack)
        }
    }
}
