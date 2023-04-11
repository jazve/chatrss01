import UIKit

// UIApplication 代理类，负责管理应用的生命周期
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // 应用的主窗口
    var window: UIWindow?
    
    // 当应用启动时调用，进行一些初始化操作
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 初始化主窗口
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // 初始化 FeedListViewController
        let feedListViewController = FeedListViewController()
        
        // 创建 UINavigationController，并将 FeedListViewController 设为根视图控制器
        let navigationController = UINavigationController(rootViewController: feedListViewController)
        
        // 设置窗口的根视图控制器为 UINavigationController
        window?.rootViewController = navigationController
        
        // 显示窗口
        window?.makeKeyAndVisible()
        
        return true
    }
}

