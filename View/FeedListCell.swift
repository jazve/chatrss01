import UIKit

// FeedListCell 类，用于表示 RSS 源列表项
class FeedListCell: UITableViewCell {
    
    // RSS 源标题标签
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    // RSS 源描述标签
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    // 配置 RSS 源列表项
    func configure(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        setupViews()
    }
    
    // 设置视图
    private func setupViews() {
        // 添加标题标签和描述标签
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        // 设置标题标签约束
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        // 设置描述标签约束
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}

