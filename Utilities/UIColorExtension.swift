import UIKit

// UIColor 扩展
extension UIColor {
    // 自定义颜色
    static let customGreen = UIColor(red: 76 / 255, green: 217 / 255, blue: 100 / 255, alpha: 1)
    
    // 从十六进制颜色代码创建 UIColor 的便捷方法
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xFF) / 255.0
        let green = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
