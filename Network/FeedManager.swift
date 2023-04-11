import Foundation
import FeedKit

// FeedManager 类，用于处理 RSS 源的加载、解析和存储
class FeedManager {
    // 单例模式，以便在整个应用程序中共享 FeedManager 实例
    static let shared = FeedManager()
    
    // RSS 源 URL 示例数组
    private let feedURLs = [
        "https://www.example.com/rss.xml",
        "https://www.anotherexample.com/feed"
    ]
    
    // 获取所有 RSS 源的方法
    func fetchFeeds(completion: @escaping ([Feed]) -> Void) {
        var feeds: [Feed] = []
        
        let group = DispatchGroup()
        
        for urlString in feedURLs {
            guard let url = URL(string: urlString) else { continue }
            
            group.enter()
            
            let parser = FeedParser(URL: url)
            parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { result in
                switch result {
                case .success(let feed):
                    if let rssFeed = feed.rssFeed {
                        let title = rssFeed.title ?? "未知标题"
                        let description = rssFeed.description ?? "无描述"
                        feeds.append(Feed(title: title, description: description))
                    }
                case .failure(let error):
                    print("解析 RSS 源失败: \(error.localizedDescription)")
                }
                group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            completion(feeds)
        }
    }
}

