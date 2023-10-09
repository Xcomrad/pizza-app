
import UIKit

final class BannerCollectionView: UITableViewCell {
    
    var reuseId = "BannerCollectionView"
    
    private let bannerService = BannerService()
    private var banner: [Banner] = []
    
    private var containerStack: UIStackView = {
        let stack = UIStackView()
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return stack
    }()
    
    private lazy var collectionView: UICollectionView = {
        let padding: CGFloat = 20
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: 120, height: 150)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseId)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
        banner = bannerService.fetchBanner()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension BannerCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseId, for: indexPath) as! BannerCell
        let banner = banner[indexPath.row]
        cell.update(banner)
        return cell
    }
}



extension BannerCollectionView {
    
    private func setupViews() {
        contentView.addSubview(containerStack)
        containerStack.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        containerStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(containerStack)
        }
    }
}
