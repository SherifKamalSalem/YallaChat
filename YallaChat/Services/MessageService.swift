//
//  MessageService.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/30/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    var channels = [Channel]()
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                    completion(true)
                } catch let error {
                    print(error as Any)
                }
            } else {
                completion(false)
                print(response.result.error as Any)
            }
        }
    }
}
