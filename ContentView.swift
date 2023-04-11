import SwiftUI

// ContentView 类，用于显示应用程序主界面
struct ContentView: View {
    // 视图主体
    var body: some View {
        // 使用 TabView 实现主界面的选项卡布局
        TabView {
            // 第一个选项卡：RSS 源列表
            FeedListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("RSS 源")
                    }
                }
                .tag(0)
            
            // 第二个选项卡：聊天界面
            ChatView()
                .tabItem {
                    VStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("聊天")
                    }
                }
                .tag(1)
        }
    }
}

// 预览
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

