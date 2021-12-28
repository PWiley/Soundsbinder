//
//  HTTPClient.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 21.12.21.
//


import Foundation

enum RequestType: String {
    case GET = "GET"
    case POST = "POST"
}

final class HTTPClient {

    // MARK: - Properties

    private let engine: HTTPEngineType

    private let decoder: JSONDecoder

    // MARK: - Init

    init(engine: HTTPEngineType) {
        self.engine = engine
        self.decoder = JSONDecoder()
    }

    // MARK: - Request
    
    /// This func allows to make HTTP requests.
    /// It returns a Result which contains an Error or Codable object.
    /// - Parameters:
    ///   - type: The Codable Type attended to be returned
    ///   - requestType: The type of the request
    ///   - url: The called url
    ///   - token: The token to make the cancellation of the request
    ///   - callback: The asynchronous result
    
    func request<T>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    token: RequestCancellationToken,
                    callback: @escaping (Result<T, Error>) -> Void) where T: Codable {

        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue

        engine.send(request: request,
                    cancelledBy: token) { (data, _, error) in
                        if let error = error {
                            callback(.failure(error))
                            return
                        }
                        guard let data = data else {
                            callback(.failure(NetworkError.dataAbsent))
                            return
                        }
                        self.decodeJSON(type: T.self,
                                        data: data,
                                        completion: callback)
        }
    }

    
    /// This func allows to make HTTP requests.
    /// It returns a Result which contains an Error or Codable object.
    /// - Parameters:
    ///   - url: The called url
    ///   - token: The token to make the cancellation of the request
    ///   - callback: The asynchronous result
    
    func requestDataImage(from url: URL,
                     token: RequestCancellationToken,
                     callback: @escaping ((Result<Data, Error>) -> Void)) {
        let request = URLRequest(url: url)
        engine.send(request: request,
                    cancelledBy: token,
                    callback: { (data, _, error) in
                        if let error = error {
                            callback(.failure(error))
                        } else if let data = data {
                            callback(.success(data))
                        } else {
                            callback(.failure(NetworkError.dataAbsent))
                        }
        })
    }
    
    /// This func allows to decode the Json answer.
    /// It returns a Result which contains an Error or Codable object.
    /// - Parameters:
    ///   - type: Generic
    ///   - data: Json
    ///   - completion: The asynchronous result
    
    private func decodeJSON<T>(type: T.Type,
                                 data: Data,
                                 completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
          guard let decodedData = try? decoder.decode(type.self, from: data) else {
              print("Unable to decode: \(type.self)")
              completion(.failure(NetworkError.unableToDecodeData))
              return
          }
          completion(.success(decodedData))
      }

}

enum NetworkError: Error {
    case unableToDecodeData
    case dataAbsent
}



