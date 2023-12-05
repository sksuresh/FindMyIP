//
//  APIManager.swift
//  FindMyIP
//
//  Created by suresh on 12/5/23.
//

import Foundation
import Alamofire

public class APIManager {
    
    public struct APIComponent {
        static let scheme = "https"
        static let host =  "ipapi.co"
        static let path = "/json/"
      
    
        static func urlComponentForIp() -> URLComponents {
            var components = URLComponents()
            components.scheme = APIComponent.scheme
            components.host = APIComponent.host
            components.path = APIComponent.path
            return components
        }
    }
    
    var session = Alamofire.Session.default
    
    func sessionManager() -> Session {
        session.sessionConfiguration.timeoutIntervalForRequest = 120.00
        return session
       }
    
    // `HTTPHeaders` value to be added to the `URLRequest`. Set `["Content-Type": "application/json"]` by default..
        private(set) var headers: HTTPHeaders = ["Content-Type": "application/json"]
            
        /// `URLConvertible` value to be used as the `URLRequest`'s `URL`.
        private(set) var url: String?
        
        /// `HTTPMethod` for the `URLRequest`. `.get` by default..
        private(set) var httpMethod: HTTPMethod = .get
        
        /// `Param` (a.k.a. `[String: Any]`) value to be encoded into the `URLRequest`. `nil` by default..
        private(set) var param: [String: Any]?
        
             
        // MARK: - Initializer
        
        /// Set param
        ///
        /// - Parameter sessionManager: `Session` creates and manages Alamofire's `Request` types during their lifetimes.
        /// - Returns: Self
        public func setSessionManager(_ sessionManager: Session) -> Self {
            self.session = sessionManager
            return self
        }
        
        /// Set param
    /// - Parameter headers: a dictionary of parameters to apply to a `HTTPHeaders`.
    /// - Returns: Self
    public func setHeaders(_ headers: [String: String]) -> Self {
        for param in headers {
            self.headers[param.key] = param.value
        }
        return self
    }
    
    /// Set url
    ///
    /// - Parameter apiUrl: URL to set for api request
    /// - Returns: Self
    public func setURL(_ url: String) -> Self {
        self.url = url
        return self
    }
    
    /// Set httpMethod
    ///
    /// - Parameter httpMethod: to change as get, post, put, delete etc..
    /// - Returns: Self
    public func setHttpMethod(_ httpMethod: HTTPMethod) -> Self {
        self.httpMethod = httpMethod
        return self
    }
    /// Set param
        ///
        /// - Parameter param: a dictionary of parameters to apply to a `URLRequest`.
        /// - Returns: Self
        public func setParameter(_ param: [String:Any]) -> Self {
            self.param = param
            return self
        }
        
        
        /// The parameter encoding. `URLEncoding.default` by default.
        private func encoding(_ httpMethod: HTTPMethod) -> ParameterEncoding {
            var encoding : ParameterEncoding = JSONEncoding.default
            if httpMethod == .get {
                encoding = URLEncoding.default
            }
            return encoding
        }
        
}

