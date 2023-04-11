import Foundation

// 文章数据结构体
struct ArticleData {
    var title: String = ""
    var author: String = ""
    var content: String = ""
}

// 自定义的 XMLParserDelegate 类
class CustomXMLParserDelegate: NSObject, XMLParserDelegate {
    private var currentElement: String = ""
    private var currentArticleData: ArticleData?
    private var articles: [ArticleData] = []
    
    // 当解析器找到一个元素的开始标签时调用
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        currentElement = elementName
        if elementName == "item" {
            currentArticleData = ArticleData()
        }
    }
    
    // 当解析器找到元素中的字符时调用
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title":
            currentArticleData?.title += string
        case "author":
            currentArticleData?.author += string
        case "content":
            currentArticleData?.content += string
        default:
            break
        }
    }
    
    // 当解析器找到一个元素的结束标签时调用
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            if let articleData = currentArticleData {
                articles.append(articleData)
            }
            currentArticleData = nil
        }
    }
    
    // 解析 XML 数据并返回文章数组
    func parseXML(data: Data) -> [ArticleData] {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
        return articles
    }
}

