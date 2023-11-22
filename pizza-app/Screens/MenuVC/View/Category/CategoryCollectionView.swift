
import UIKit

final class CategoryCollectionView: UITableViewCell {
    
    static var reuseId = "CategoryCollectionView"
    
    private let categoryService = CategoryAPI()
    private var category: [Category] = []
    
    private var containerView: UIView = {
        let container = UIView()
        container.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return container
    }()
    
    private lazy var collectionView: UICollectionView = {
        let padding: CGFloat = 20
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: 120, height: 35)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
        category = categoryService.fetchCategories()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension CategoryCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        let category = category[indexPath.row]
        cell.update(category)
        return cell
    }
}



extension CategoryCollectionView {
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(containerView)
        }
    }
}
