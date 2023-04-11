import SwiftUI

// 使用 SwiftUI 定义 FeedListView
struct FeedListView: View {
    // 存储 RSS 源数据的数组
    @State private var feeds: [Feed] = []
    
    // FeedListView 的主体
    var body: some View {
        NavigationView {
            List(feeds) { feed in
                VStack(alignment: .leading, spacing: 4) {
                    Text(feed.title)
                        .font(.headline)
                    Text(feed.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationBarTitle("RSS 源")
            .onAppear(perform: loadFeeds)
        }
    }
    
    // 加载 RSS 源数据
    private func loadFeeds() {
        // 在这里实现加载 RSS 源的逻辑，获取数据后更新 feeds 数组
    }
}

// 预览 FeedListView
struct FeedListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedListView()
    }
}

