import UIKit

// ChatViewController 类，用于显示文章内容的聊天界面
class ChatViewController: UIViewController {
    // 聊天消息数据
    private var messages: [ChatMessage] = []
    
    // 创建 UITableView 实例
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
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
        
        // 加载聊天消息
        loadMessages()
    }
    
    // 设置视图的布局约束
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    // 加载聊天消息数据
    private func loadMessages() {
        // 从 FeedManager 或其他地方获取聊天消息数据
        // 在这里，我们使用一个简单的示例数据
        messages = [
            ChatMessage(author: "User", content: "Hello, how can I help you today?"),
            ChatMessage(author: "Bot", content: "You can help me by showing me the latest news.")
        ]
        
        tableView.reloadData()
    }
}

// UITableViewDataSource 协议扩展
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageCell.identifier, for: indexPath) as! ChatMessageCell
        cell.configure(with: messages[indexPath.row])
        return cell
    }
}

// UITableViewDelegate 协议扩展
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ChatMessageCell.height(for: messages[indexPath.row])
    }
}

