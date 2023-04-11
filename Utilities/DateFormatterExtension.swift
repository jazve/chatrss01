import Foundation

// DateFormatter 扩展
extension DateFormatter {
    // 静态属性，用于获取常用的日期格式化对象
    static let articleDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()
    
    // 静态属性，用于获取更友好的日期格式化对象
    static let friendlyDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()
}
