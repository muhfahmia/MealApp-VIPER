//
//  APIManager.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import Alamofire
import RxSwift
import ObjectMapper

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func request<T: Mappable>(_ url: String, response: T.Type) -> Observable<T> {
        return Observable.create { observer in
            let request = AF.request(URL(string: url)!, method: .get)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        let jsonString = String(data: data, encoding: .utf8)
                        let mapper = Mapper<T>().map(JSONString: jsonString!)
                        observer.onNext(mapper!)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
}
