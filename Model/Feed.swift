import Foundation

// 定义 Feed 类，表示一个 RSS 源
struct Feed: Codable {
    // RSS 源标题
    var title: String
    // RSS 源描述
    var description: String
    // RSS 源中的文章列表
    var articles: [Article]
    
    // CodingKeys，用于定义与 JSON 中的字段名称映射
    enum CodingKeys: String, CodingKey {
        case title = "channelTitle"
        case description = "channelDescription"
        case articles = "items"
    }
}

