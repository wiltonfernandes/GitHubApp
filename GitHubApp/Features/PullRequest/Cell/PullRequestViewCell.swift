import SnapKit
import UIKit

final class PullRequestViewCell: UITableViewCell {
    
    private let titlePullRequestLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .tintColor
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let perfilImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.textColor = .tintColor
        return label
    }()
    
    private lazy var nameAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.text = "Nome Sobrenome"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(title: String, description: String, imageName: String) {
        titlePullRequestLabel.text = title
        descriptionLabel.text = description
        perfilImageView.image = UIImage(named: imageName)
    }
}

extension PullRequestViewCell: ViewCode {
    func buildHierarchy() {
        let subviews = [
            perfilImageView,
            titlePullRequestLabel,
            descriptionLabel,
            userNameLabel,
            nameAuthorLabel,
        ]
        subviews.forEach(contentView.addSubview)
    }
    
    func setupConstraints() {
        titlePullRequestLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.left.equalTo(contentView.snp.left).offset(16)
            make.height.lessThanOrEqualTo(42)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titlePullRequestLabel.snp.bottom).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.left.equalTo(titlePullRequestLabel.snp.left)
        }
        
        perfilImageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.left.equalTo(descriptionLabel.snp.left)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(perfilImageView.snp.top).offset(4)
            make.left.equalTo(perfilImageView.snp.right).offset(16)
            make.width.equalTo(90)
        }
        
        nameAuthorLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(4)
            make.left.equalTo(userNameLabel.snp.left)
        }
    }
    
    func configureViews() {
        selectionStyle = .none
    }
}
