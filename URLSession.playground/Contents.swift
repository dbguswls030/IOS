import Cocoa
import Foundation

// URLSession

// 1. URLSessionConfiguration
// 2. URLSession
// 3. URLSessionTask 를 이용해서 서버와 네트워킹

// URLSessionTask
// - dataTask
// - uploadTask
// - downloadTask

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

//URL
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
//let termQuery = URLQueryItem(name: "term", value: "Gdragon")
let termQuery = URLQueryItem(name: "term", value: "지드래곤") // 인코딩이 되어서 나옴

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)
let requestURL = urlComponents?.url


struct Response: Codable{
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey{
        case resultCount
        case tracks = "results"
    }
}

struct Track: Codable{
    let title: String
    let artistName: String
    let thumbnailPath: String
    
    enum CodingKeys: String, CodingKey{
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl30"
    }
}











let dataTask = session.dataTask(with: requestURL!) { (data, response, error) in
    guard error == nil else { return }
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    
    let successRange = 200..<300 //HTTP status code
    guard successRange.contains(statusCode) else {
        //handle response error
        return
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    //print("result \(resultString)")
    
    // 목표 : 트랙리스트 오브젝트로 가져오기
        
    // to do list
    // - Data -> Track 목록으로 가져오고 싶다 [Track]
    // - Track 오브젝트를 만들어야겠다.
    // - Data에서 struct로 파싱하고 싶다. > Codable 이용해서 만들자
    //   - Json 형태 파일, 데이터 > 오브젝트로 만들 때 Codable을 이용하면 편하다.
    //   - Response와  이 안에 Track  두 개의 오브젝트를 만들자
    
    // 해야할거
    // - Response,  Track struct
    // - struct의 프로파티 이름과 실제 데이터의 키와 맞추기 (Codable 디코딩 가능하게 하기 위해서)
    // - 파싱하기 (Decoding)
    // - 트랙리스트 가져오기
    
    // 파싱 및 트랙 가져오기
    // 디코더 만들기
    do{
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        print("-----> tracks: \(tracks.count) - \(tracks.first?.title)")
    } catch let error{
        print("-----> error: \(error.localizedDescription)")
    }

}

dataTask.resume()
