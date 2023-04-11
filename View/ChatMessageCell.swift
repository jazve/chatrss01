import UIKit

// 聊天消息类型
enum ChatMessageType {
    case userMessage
    case botMessage
}

// ChatMessageCell 类，用于表示聊天消息
class ChatMessageCell: UITableViewCell {
    
    // 消息类型
    var messageType: ChatMessageType = .userMessage
    
    // 消息气泡视图
    private var bubbleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    // 消息文本标签
    private var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    // 配置聊天消息单元格
    func configure(with message: String, messageType: ChatMessageType) {
        self.messageType = messageType
        messageLabel.text = message
        setupViews()
    }
    
    // 设置视图
    private func setupViews() {
        // 添加气泡视图和消息文本标签
        addSubview(bubbleView)
        addSubview(messageLabel)
        
        // 根据消息类型设置气泡视图背景色和文本标签约束
        if messageType == .userMessage {
            bubbleView.backgroundColor = UIColor.systemBlue
            messageLabel.textColor = .white
            
            NSLayoutConstraint.activate([
                messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
                messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                
                bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -4),
                bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 4),
                bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8),
                bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8),
            ])
        } else {
            bubbleView.backgroundColor = UIColor(white: 0.9, alpha: 1)
            messageLabel.textColor = .black
            
            NSLayoutConstraint.activate([
                messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
                messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                
                bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -4),
                bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 4),
                bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8),
                bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8),
            ])
        }
    }
}

