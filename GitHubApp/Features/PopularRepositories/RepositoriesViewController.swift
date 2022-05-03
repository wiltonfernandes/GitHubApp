import SnapKit
import UIKit

final class RepositoriesViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .darkGray
        tableView.backgroundColor = .clear
        tableView.rowHeight = 160
        tableView.register(RepositoryViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
    }
}

extension RepositoriesViewController: ViewCode {
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
        title = "Popular Repositories"
        view.backgroundColor = .white
        
    }
}

extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.update(
            title: "Nome Repositório",
            description: "16/12/2021 (BR)",
            overview: "Descrição do repo, Descrição do repo, Descrição do repo"
        )
        return cell
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var pullRequestDetailViewController = UIViewController()
       
        pullRequestDetailViewController = PullRequestViewController()
        navigationController?.pushViewController(pullRequestDetailViewController, animated: true)
    }
}
