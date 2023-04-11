import Foundation

// 自定义错误类型
enum NetworkError: Error {
    case badURL
    case requestFailed
    case decodingError
}

// NetworkManager 类，用于处理网络请求
class NetworkManager {
    // 单例模式，以便在整个应用程序中共享 NetworkManager 实例
    static let shared = NetworkManager()
    
    private init() {}
    
    // 通用的 GET 请求方法
    func get<T: Decodable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        // 创建 URL
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        // 创建 URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // 发送网络请求
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // 检查请求是否成功
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.requestFailed))
                }
                return
            }
            
            // 解码响应数据
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
            }
        }
        
        task.resume()
    }
}

