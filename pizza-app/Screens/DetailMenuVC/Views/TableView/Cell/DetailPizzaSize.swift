
import UIKit

final class DetailPizzaSize: UITableViewCell {
    
    static var reuseId = "DetailPizzaSize"
    
    private var imageArray:[UIImage?] = [UIImage(named: "big"),
                                         UIImage(named: "middle"),
                                         UIImage(named: "small")]
    
    var verticalStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    var pizzaImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "middle")
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 250).isActive = true
        image.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return image
    }()
    
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
        setipViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension DetailPizzaSize {
    
    @objc func nextPizza(target: UISegmentedControl) {
        if target == self.segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            self.pizzaImage.image = self.imageArray[segmentIndex]
        }
    }
    
    private func setipViews() {
        contentView.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(pizzaImage)
        verticalStack.addArrangedSubview(segmentControll)
    }
    
    private func setupConstraints() {
        verticalStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}


