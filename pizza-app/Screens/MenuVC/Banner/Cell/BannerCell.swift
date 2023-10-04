
import UIKit

final class BannerCell: UICollectionViewCell {
    
    static var reuseId = "BannerCell"
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 15
        image.layer.borderColor = UIColor.systemOrange.cgColor
        image.layer.masksToBounds = true
        return image
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



extension BannerCell {
    
    private func setupViews() {
        contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func update(_ image: Banner) {
        imageView.image = UIImage(named: "\(image.image)")
    }
}
