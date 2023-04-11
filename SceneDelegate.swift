import UIKit

// 场景代理类，负责处理场景的生命周期
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // 场景对应的窗口
    var window: UIWindow?
    
    // 当场景与应用关联时调用，进行一些初始化操作
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 判断场景是否为 UIWindowScene 类型
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 初始化窗口，并设置窗口的场景
        window = UIWindow(windowScene: windowScene)
        
        // 初始化 FeedListViewController
        let feedListViewController = FeedListViewController()
        
        // 创建 UINavigationController，并将 FeedListViewController 设为根视图控制器
        let navigationController = UINavigationController(rootViewController: feedListViewController)
        
        // 设置窗口的根视图控制器为 UINavigationController
        window?.rootViewController = navigationController
        
        // 显示窗口
        window?.makeKeyAndVisible()
    }
}

