import UIKit
import WebKit

// ArticleDetailViewController 类，用于显示文章详情
class ArticleDetailViewController: UIViewController {
    
    // 文章链接
    private var articleURL: URL
    
    // 网页视图，用于显示文章内容
    private var webView: WKWebView = {
        let webViewConfig = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webViewConfig)
        return webView
    }()
    
    // 初始化方法，接收一个 URL 参数
    init(url: URL) {
        self.articleURL = url
        super.init(nibName: nil, bundle: nil)
    }
    
    // required，用于支持 Storyboard 和 Xib
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 当视图加载时调用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置视图背景色
        view.backgroundColor = .white
        
        // 设置导航栏标题
        title = "文章详情"
        
        // 添加 webView 到视图层级
        view.addSubview(webView)
        
        // 设置 webView 的约束
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        // 加载文章链接
        let request = URLRequest(url: articleURL)
        webView.load(request)
    }
}

