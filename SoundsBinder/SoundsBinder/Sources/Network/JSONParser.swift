//
//  JSONParser.swift
//  SoundsBinder
//
//  Created by Patrick Wiley on 21.12.21.
//

import Foundation

enum ParserError: Error {
    case badParsing(Error)
}

protocol JSONParserType {
    func processCodableResponse<C: Codable>(from data: Data) throws -> Result<C, ParserError>
}

final class JSONParser: JSONParserType {
    func processCodableResponse<C: Codable>(from data: Data) throws -> Result<C, ParserError> {
        do {
            let object = try JSONDecoder().decode(C.self, from: data)
            return .success(object)
        } catch let error {
            return .failure(ParserError.badParsing(error))
        }
    }
}
