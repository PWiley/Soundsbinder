//
//  URLBuilder.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 21.12.21.
//


import Foundation

protocol URLBuilderType {
    func build(from urlString: String) throws -> SearchUrl
}



final class URLBuilder: URLBuilderType {
    
    // MARK: - Build
    
    func build(from urlString: String) throws -> SearchUrl  {
        guard let url = URL(string: urlString) else {
            throw URLBuilderError.unableToParseURL
        }
        var components = URLComponents(url: url,
                                       resolvingAgainstBaseURL: true)
//        let query = apiQuery()
//        components?.queryItems = query.map { URLQueryItem(name: $0.key,
//                                                          value: $0.value) }
        guard let urlComponent = components?.url else {
            throw URLBuilderError.unableToParseComponents
        }
        
        return SearchUrl(url: urlComponent)
    }

//    private func apiQuery() -> [String: String] {
//        var query: [String: String] = [:]
//        query["app_id"] = valueForAPIKey(named:"app_id")
//        query["app_key"] = valueForAPIKey(named: "app_key")
//        return query
//    }

//    private func valueForAPIKey(named keyname:String) -> String {
//        var value: String = ""
//        if let filePath = Bundle.main.path(forResource: "ApiKey", ofType: "plist") {
//            let plist = NSDictionary(contentsOfFile:filePath)
//            value = plist?.object(forKey: keyname) as! String
//        }
//        return value
//    }
}

final class SearchUrl {

    private let url: URL

    init(url: URL) {
        self.url = url
    }

    func from(artistName: String) -> URL {
        guard !artistName.isEmpty else {
            return url
        }
        let fieldNameList = "q=" + artistName
        guard let request = URL(string: (url.absoluteString + fieldNameList)) else { return url }
        return request
    }
}
enum URLBuilderError: Error {
    case unableToParseURL
    case unableToParseComponents
}

