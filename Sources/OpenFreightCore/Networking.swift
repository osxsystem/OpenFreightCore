//
//  File.swift
//  
//
//  Created by Hung Viet Do on 7/17/23.
//

import Foundation


protocol NetworkSession {
  func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession{
  func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
    let task = dataTask(with: url) { data, _, error in
      completionHandler(data, error)
    }
    
    task.resume()
  }
  
}

extension OpenFreightCore {
  public class Networking {
    /// Responsible for handling all networking calls
    /// - Warning: Must create before using any public APIs
    public class Manager {
      public init() {}
      
      internal var session: NetworkSession = URLSession.shared
      
      
      /// Calls to the network to retrieve data
      /// - Parameters:
      ///   - url: URL location from which to get data
      ///   - completetionHandler: call back in result
      public func loadData(from url: URL, completetionHandler: @escaping (NetworkResult<Data>) -> Void) {
        session.get(from: url) { data, error in
          let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
          completetionHandler(result)
        }

      }
    }
    
    public enum NetworkResult<V> {
      case success(V)
      case failure(Error?)
    }
  }
}
