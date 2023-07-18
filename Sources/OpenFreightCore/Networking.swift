//
//  File.swift
//  
//
//  Created by Hung Viet Do on 7/17/23.
//

import Foundation


extension OpenFreightCore {
  public class Networking {
    
    
    /// Responsible for handling all networking calls
    /// - Warning: Must create before using any public APIs
    public class Manager {
      public init() {}
      
      private let session = URLSession.shared
      
      public func loadData(from url: URL, completetionHandler: @escaping (NetworkResult<Data>) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
          let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
          completetionHandler(result)
        }
        task.resume()
      }
    }
    
    public enum NetworkResult<V> {
      case success(V)
      case failure(Error?)
    }
  }
}
