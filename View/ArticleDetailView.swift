import SwiftUI

// 使用 SwiftUI 定义 ArticleDetailView
struct ArticleDetailView: View {
    // 存储文章数据的属性
    let article: Article
    
    // ArticleDetailView 的主体
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.largeTitle)
                    .bold()
                
                Text("作者：\(article.pubDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(article.description)
                    .font(.body)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 预览 ArticleDetailView
struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: Article(title: "示例文章标题", author: "示例作者", content: "这是一篇示例文章。"))
    }
}

