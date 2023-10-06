
import UIKit

class DetailIngredient: UITableViewCell {
    
    let service = IngredientService()
    var ingredient: [Ingredients] = []
    
    static var reuseId = "DetailIngredient"
    
    var titileLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавить по вкусу"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    var containerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.heightAnchor.constraint(equalToConstant: 1150).isActive = true
        return stack
    }()
    
    lazy var collectionView: UICollectionView = {
        let itemsCount: CGFloat = 3
        let padding: CGFloat = 10
        let paddingCount: CGFloat = itemsCount + 1
        
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        
        let paddingSize = paddingCount * padding
        
        let cellSize = (UIScreen.main.bounds.width - paddingSize) / itemsCount
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        layout.itemSize = CGSize(width: cellSize, height: 180)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(DetailIngredientCell.self, forCellWithReuseIdentifier: DetailIngredientCell.reuseId)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
        ingredient = service.fetchIngredients()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(titileLabel)
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



extension DetailIngredient: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)
            selectedCell?.layer.borderWidth = 2
            selectedCell?.layer.cornerRadius = 15
            selectedCell?.layer.borderColor = UIColor.systemOrange.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredient.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailIngredientCell.reuseId, for: indexPath) as! DetailIngredientCell
       
        let ingredient = ingredient[indexPath.row]
        cell.update(ingredient)
        
        return cell
    }
}
