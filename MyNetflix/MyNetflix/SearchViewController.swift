//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/02.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        searchBar.resignFirstResponder()
    }
    
}

extension SearchViewController: UISearchBarDelegate{
    
    private func dismissKeyboard(){
        searchBar.resignFirstResponder()
    }
    
    // 다른 곳 클릭 시 키보드 내리기
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       // 키보드 내리기
        dismissKeyboard()
        
        // 공백 입력 후 클릭 시 네트워킹을 굳이 할 필요 없음
        // 검색어가 없을 경우 -> return
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else{
            return
        }
        // 검색 시작
        
        // 네트워킹을 통한 검색
        // 목표 : searchTerm을 가지고 네트워킹을 통해 영화 검색
        // 검색 API 필요
        // 결과 받아올 Movie, Response 필요
        // 결과 받아와서 collectionView에 표현해보자
        
        SearchAPI.search(searchTerm) { movies in
            //collectionView에 표현하기
        }
        print("--> \(searchTerm)")
        
    }
    
}

class SearchAPI{
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void){
        // 1. URLSessionConfiguration
        // 2. URLSession
        // 3. URLSessionTask 를 이용해서 서버와 네트워킹
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        //URL
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
        
        let mediaQuery = URLQueryItem(name: "media", value: "movie")
        let entityQuery = URLQueryItem(name: "entity", value: "movie")
        let termQuery = URLQueryItem(name: "term", value: term)
        
        urlComponents.queryItems?.append(mediaQuery)
        urlComponents.queryItems?.append(entityQuery)
        urlComponents.queryItems?.append(termQuery)
        let requestURL = urlComponents.url!
        
        
        
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode, successRange.contains(statusCode) else {
                completion([])
                return
            }
            guard let resultData = data else{
                completion([])
                return
            }
  
            // data -> [Movie]
            let string = String(data: resultData, encoding: .utf8)
            print(string)
            
            
            let movies = SearchAPI.parseMovies(resultData)
            completion(movies)
            print(movies.count)
            
        }
        dataTask.resume()
    }
    static func parseMovies(_ data: Data) -> [Movie]{
        let decoder = JSONDecoder()
        do{
            let response = try decoder.decode(Response.self, from: data)
            let movies = response.movies
            return movies
        }catch let error {
            print("--> error : \(error)")
            return []
        }
    }
}

//struct Response: Codable{
//    let resultCount: Int
//    let movies: [Movie]
//
//    enum CodingKeys: String, CodingKey{
//        case resultCount
//        case movies = "results"
//    }
//}
//
//struct Movie: Codable {
//    let title: String
//    let director: String
//    let thumbnailPath: String
//    let previewURL: String
//
//    enum CodigKeys: String, CodingKey{
//        case title = "trackName"
//        case director = "artistName"
//        case thumbnailPath = "artworkUrl100"
//        case previewURL = "previewUrl"
//    }
//}

struct Response: Codable {
    let resultCount: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}
struct Movie: Codable {
    let title: String
    let director: String
    let thumbnailPath: String
    let previewURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case director = "artistName"
        case thumbnailPath = "artworkUrl100"
        case previewURL = "previewUrl"
    }
}
