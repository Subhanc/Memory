//
//  Service.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/**

 This file handles all server requests that communicate with the backend endpoints.

- Author: Subhan Chaudhry
- Date:
*/


class Service {
    
    /// Shared singleton, creates a global instance of service.
    public static let shared = Service()
    
    /// The number that represents the page number Shopify API data (Current API has 3 pages, randomly chooses one)
    public static var pageNumber =  Int.random(in: 1..<4);
    
    /// Access token for to be passed into Shopify endpoint
    public static let ACCESS_TOKEN = "c32313df0d0ef512ca64d5b336a0d7c6"
    
    // Endpoint constant
    public static let API_URL = "https://shopicruit.myshopify.com/admin/products.json"
    
    /** Performs a GET requests from the Shopify API.
     
        - Returns: Array of Card objects wrapped in a Result type. Result type is from the Swifty JSON library
     
     */
    public func getCardData(completion: @escaping (Result<[Card]>) -> Void) {
        print("Getting data from page: \(Service.pageNumber)")
    
        // Parameters being set to perform the GET request
        let parameters: Parameters = [
            "access_token": Service.ACCESS_TOKEN,
            "page": Service.pageNumber
        ]
        // Defaults to .get
        let request = Alamofire.request(Service.API_URL, parameters: parameters)

        request.responseJSON { response in
            DispatchQueue.main.async {
                if let value = response.result.value {
                    
                    // Creates an array of Card objects from the API
                    let cards = JSON(value)["products"].arrayValue.map {
                        Card(withId: $0["id"].intValue, data: Card.CardData(fromJSON: $0))
                    }
                    completion(Result.success(cards))
                } else if let error = response.error {
                    print(error.localizedDescription)
                    completion(Result.failure(error))
                }
            }
        }
    }
}

