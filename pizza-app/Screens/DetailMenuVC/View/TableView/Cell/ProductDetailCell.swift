
import UIKit

final class ProductDetailCell: UITableViewCell {
    
    static var reuseId = "ProductDetailCell"
    
    private var imageArray:[UIImage?] = [UIImage(named: "1"),
                                         UIImage(named: "2"),
                                         UIImage(named: "3")]
    
    private var container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private var detailImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 250).isActive = true
        image.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return image
    }()
    
    private var namelabel = CreateLabel(style: .largeLabel, text: "", alignment: .left)
    private var detailLabel = CreateLabel(style: .detailLabel, text: "", alignment: .left)
    
    lazy var segmentControll: UISegmentedControl = {
        var controllItem = ["Большая", "Средняя", "Маленькая"]
        var controll = UISegmentedControl(items: controllItem)
        
        controll.selectedSegmentIndex = 1
        controll.selectedSegmentTintColor = .systemOrange.withAlphaComponent(0.6)
        controll.heightAnchor.constraint(equalToConstant: 40).isActive = true
        controll.addTarget(self, action: #selector(nextPizza(target:)), for: .valueChanged)
        return controll
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ProductDetailCell {
    
    private func setupViews() {
        contentView.addSubview(container)
        
        container.addArrangedSubview(detailImageView)
        container.addArrangedSubview(namelabel)
        container.addArrangedSubview(detailLabel)
        container.addArrangedSubview(segmentControll)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(10)
        }
    }
    
    // MARK: - Public
    func update(_ product: Product) {
        detailImageView.image = UIImage(named: "\(product.image)")
        namelabel.text = product.name
        detailLabel.text = product.detail
    }
    
    // MARK: - Action
    @objc func nextPizza(target: UISegmentedControl) {
        if target == self.segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            self.detailImageView.image = self.imageArray[segmentIndex]
        }
    }
}
