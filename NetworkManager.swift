//
//  NetworkManager.swift
//  Axxess-Code-Challenge
//
//  Created by Vikram Sahu on 04/07/20.
//  Copyright © 2020 Vikram Sahu. All rights reserved.
//

import UIKit
import Alamofire


class NetworkManager: NSObject {

//    static let url = "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json"
        static let url = "https://raw.githubusercontent.com/vikram-sahu-asurion/HostJson/master/config.json"
    
    class func fetchData(completion: @escaping ResponseCompletion<ViewModel>){
        
        AF.request(url).response { response in
            debugPrint(response)
            
            guard let data = response.data else{
                completion(.failure(error: ServiceError(type: .notFound)))
                return
            }
            
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(ConfigModel.self, from: data){
                print(json)
//                completion(.success(domainModel: ViewModel(dataArray: json)))
                
            }else{
                completion(.failure(error: ServiceError(type: .decodingError)))
            }
        }
    }
    
}
