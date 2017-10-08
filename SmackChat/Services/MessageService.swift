//
//  MessageService.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 10/7/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findALLChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else  { return }
                if let json = JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    
                    print(self.channels[0].channelTitle)
                    completion(true) 
                }
                
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}

