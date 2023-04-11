import SwiftUI

// 使用 SwiftUI 定义 ChatView
struct ChatView: View {
    // 存储聊天消息数据的数组
    @State private var messages: [String] = []
    
    // 当前输入的消息
    @State private var inputMessage: String = ""
    
    // ChatView 的主体
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ScrollViewReader { scrollView in
                        LazyVStack(alignment: .leading, spacing: 8) {
                            ForEach(messages.indices, id: \.self) { index in
                                MessageView(message: messages[index])
                                    .padding(.horizontal, 16)
                            }
                        }
                        .onAppear {
                            scrollView.scrollTo(messages.endIndex - 1, anchor: .bottom)
                        }
                    }
                }
                .padding(.top)
                .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
                
                Divider()
                
                HStack {
                    TextField("输入消息...", text: $inputMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)
                    
                    Button(action: sendMessage) {
                        Text("发送")
                    }
                    .padding(.trailing)
                }
                .padding()
            }
            .navigationBarTitle("聊天")
        }
    }
    
    // 发送消息
    private func sendMessage() {
        guard !inputMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        messages.append(inputMessage)
        inputMessage = ""
    }
}

// 预览 ChatView
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

// 消息视图，用于显示聊天消息
struct MessageView: View {
    let message: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(message)
                .font(.system(size: 16))
                .padding(8)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }
}

