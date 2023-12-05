//
//  IPDetailsFetchable.swift
//  Demo
//
//  Created by suresh on 12/5/23.
//

import Foundation
import Combine
import Alamofire

public protocol IPDetailsFetchable {
    func fetchIPDetails<T>(type:T.Type) -> AnyPublisher<T, Error> where T: Decodable
}

protocol IPFetchable {
    func fetch<T>() -> AnyPublisher<T, Error> where T: Decodable
}

extension IPDetailsFetchable {
    public func fetchIPDetails<T>(type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        guard let urlString = APIManager.APIComponent.urlComponentForIp().string else {
            return Fail(error: APIError.request(message: "Invalid URL")).eraseToAnyPublisher()
        }
        return APIManager().sessionManager().request(urlString, method: .get)
          .validate()
          .publishDecodable(type: type)
          .mapError { error in
             APIError.network(message: error.localizedDescription)
          }
          .map(\.data)
          .tryMap({ data in
              do {
                  if data == nil  {
                      throw APIError.network(message: "Api Error")
                      }
                  let result = try JSONDecoder().decode(type, from: data!)
                  print("json parsing Success \(result)")
                  return result
              } catch {
                  print("json parsing failed \(error)")
                  throw APIError.map(error)
              }
          })
        .eraseToAnyPublisher()

        /// url session based testing
            //        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: URL(string: "https://ipapi.co/json")!))
            //              .mapError { error in
            //                 APIError.network(message: error.localizedDescription)
            //              }
            //              .map(\.data)
            //              .tryMap({ dataObj in
            //                  do {
            //                      let result = try JSONDecoder().decode(type, from: dataObj)
            //                      print("json parsing Success \(result)")
            //                      return result
            //                  } catch {
            //                      print("json parsing failed \(error)")
            //                      throw APIError.map(error)
            //                  }
            //              })
            //            .eraseToAnyPublisher()
    }
}
