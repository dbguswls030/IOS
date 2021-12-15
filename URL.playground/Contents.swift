import Cocoa


//URL

let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString // == urlString
url?.scheme // 어떤 방식으로 통신하냐 == https
url?.host // 호스트 == itunes.apple.com
url?.path // /search
url?.query //media=music&entity=song&term=Gdragon
url?.baseURL // nil

//baseURL 출력되게 하는 방법
let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL) // Gdragon을 지드래곤으로 쓰면 오류 -> URLComponent

relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host 
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL


//URLComponent

var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
let mediaQuery = URLQueryItem(name: "media", value: "music")

let entityQuery = URLQueryItem(name: "entity", value: "song")

//let termQuery = URLQueryItem(name: "term", value: "Gdragon")
let termQuery = URLQueryItem(name: "term", value: "지드래곤") // 인코딩이 되어서 나옴

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)
urlComponents?.url
urlComponents?.url?.scheme
urlComponents?.string
urlComponents?.queryItems
urlComponents?.queryItems?.last?.value
