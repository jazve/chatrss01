import Foundation

// 定义 Article 类，表示一篇 RSS 文章
struct Article: Codable {
    // 文章标题
    var title: String
    // 文章链接
    var link: String
    // 文章发布日期
    var pubDate: Date
    // 文章摘要
    var description: String
    
    // CodingKeys，用于定义与 JSON 中的字段名称映射
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case pubDate = "pubDate"
        case description
    }
    
    // 使用 init(from decoder: Decoder) 方法自定义解码过程
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // 解码字符串类型的字段
        title = try container.decode(String.self, forKey: .title)
        link = try container.decode(String.self, forKey: .link)
        description = try container.decode(String.self, forKey: .description)
        
        // 解码日期字段，首先尝试解码为原始字符串
        let dateString = try container.decode(String.self, forKey: .pubDate)
        
        // 使用 DateFormatterExtension 中定义的解析方法解析日期字符串
        if let date = dateString.rfc822Date {
            pubDate = date
        } else {
            // 如果解析失败，使用当前日期作为默认值
            pubDate = Date()
        }
    }
}

