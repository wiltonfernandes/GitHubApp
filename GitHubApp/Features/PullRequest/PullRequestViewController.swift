import SnapKit
import UIKit

final class PullRequestViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .darkGray
        tableView.backgroundColor = .clear
        tableView.rowHeight = 180
        tableView.register(PullRequestViewCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
    }
}

extension PullRequestViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
    
    func configureViews() {
        title = "Lista Pull Request"
        view.backgroundColor = .white
        
    }
}

extension PullRequestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PullRequestViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.update(
            title: "Título do Pull Request",
            description: """
            descrição do repo,descrição do repo, descrição do repo, descrição do repo. descrição do repo, descrição do repo.
            """,
            imageName: "avatar.png"
        )
        return cell
    }
}

extension PullRequestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.popViewController(animated: true)
    }
}
