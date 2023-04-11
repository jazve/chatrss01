import UIKit

// FeedListViewController 类，用于显示 RSS 源列表
class FeedListViewController: UIViewController {
    // RSS 源列表数据
    private var feeds: [Feed] = []
    
    // 创建 UITableView 实例
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FeedListCell.self, forCellReuseIdentifier: FeedListCell.identifier)
        return tableView
    }()
    
    // 初始化方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // 设置 UITableView 代理和数据源
        tableView.delegate = self
        tableView.dataSource = self
        
        // 将 UITableView 添加到视图层次结构中
        view.addSubview(tableView)
        
        // 加载 RSS 源
        loadFeeds()
    }
    
    // 设置视图的布局约束
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    // 加载 RSS 源数据
    private func loadFeeds() {
        FeedManager.shared.fetchFeeds { [weak self] feeds in
            self?.feeds = feeds
            self?.tableView.reloadData()
        }
    }
}

// UITableViewDataSource 协议扩展
extension FeedListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedListCell.identifier, for: indexPath) as! FeedListCell
        cell.configure(with: feeds[indexPath.row])
        return cell
    }
}

// UITableViewDelegate 协议扩展
extension FeedListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let articleListViewController = ArticleListViewController(feed: feeds[indexPath.row])
        navigationController?.pushViewController(articleListViewController, animated: true)
    }
}

