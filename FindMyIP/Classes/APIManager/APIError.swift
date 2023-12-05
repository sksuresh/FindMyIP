//
//  APIError.swift
//  Demo
//
//  Created by suresh on 12/5/23.
//

import Foundation

enum APIError: Error {
    case request(message: String)
    case network(message: String)
    case status(message: String)
    case parsing(message: String)
    case other(message: String)
    
    static func map(_ error: Error) -> APIError {
        return (error as? APIError) ?? .other(message: error.localizedDescription)
    }

    func message() -> String {
        switch self {
        case .request(let msg),.network(let msg),.status(let msg),.parsing(let msg),.other(let msg):
            return msg
        }
    }
}
