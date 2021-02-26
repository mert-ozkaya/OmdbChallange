//
//  AlamofireClient.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import Alamofire

protocol AlamofireClientProvider {
    func get(queries: [String : String], completion: @escaping(Data?) -> ())
}

final class AlamofireClient: AlamofireClientProvider {
    
    func get(queries: [String : String], completion: @escaping(Data?) -> ())  {
        let url = self.getQueriesLikeString(url: AppConfig.shared.baseDataURL, queries: queries)

        AF.request( url,
           method: .get,
           encoding: JSONEncoding.default)
           .validate()
           .responseJSON { (response) in
               switch response.result{
               case .success:
                    completion(response.data)
               case .failure(let error):
                #if DEBUG
                    print("AlamofireClient::get()::", AlamofireErrorHandler(error).errorFilter())
                #endif
                    completion(nil)
               }
       }
    }
}

extension AlamofireClient {
    func getQueriesLikeString(url: String, queries: [String:String]) -> String {
        var url = URL(string: url)!
        for (key,value) in queries {
            url = url.appending(key, value: value)
        }
        return url.absoluteString
    }
}
