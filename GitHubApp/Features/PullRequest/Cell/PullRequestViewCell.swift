import SnapKit
import UIKit

final class PullRequestViewCell: UITableViewCell {
    private let containerView: CardView = {
        let cardView = CardView()
        cardView.backgroundColor = .white
        return cardView
    }()
    
    private let titlePullRequest: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.regular)
        label.textColor = .tintColor
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
        label.textColor = .tintColor
        return label
    }()
    
    private lazy var nameAuthor: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.text = "Nome Sobrenome"
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func update(title: String, description: String, overview: String) {
        titlePullRequest.text = title
        descriptionLabel.text = """
        descrição do repo,descrição do repo, descrição do repo, descrição do repo. descrição do repo, descrição do repo.
        """
        posterImageView.image = UIImage(named: "avatar.png")
    }
}
extension PullRequestViewCell: ViewCode {
    func buildHierarchy() {
        containerView.addSubviews(
            posterImageView,
            titlePullRequest,
            descriptionLabel,
            userName,
            
            nameAuthor
        )
        contentView.addSubviews(containerView)
    }
    
    func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(1)
            make.bottom.equalTo(contentView.snp.bottom).offset(-1)
            make.left.equalTo(contentView.snp.left).offset(1)
            make.right.equalTo(contentView.snp.right).offset(-1)
        }
        
        titlePullRequest.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        titlePullRequest.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(8)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.height.lessThanOrEqualTo(42)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titlePullRequest.snp.bottom).offset(8)
            make.right.equalTo(containerView.snp.right).offset(-16)
            make.left.equalTo(titlePullRequest.snp.left)
        }
        
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.left.equalTo(descriptionLabel.snp.left)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.top).offset(5)
            make.left.equalTo(posterImageView.snp.right).offset(16)
            make.width.equalTo(90)
        }
        
        nameAuthor.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(3)
            make.left.equalTo(userName.snp.left)
        }
    }
    
    func configureViews() {
        selectionStyle = .none
    }
}
