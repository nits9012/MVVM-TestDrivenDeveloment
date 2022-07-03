//
//  ContactService.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//

import Foundation

//protocol ContactRepositoryProtocol {
//    func getContacts(completion: @escaping (_ contacts:(Contacts)) -> Void)
//}
//
//
//class ContactService:ContactRepositoryProtocol{
//    var client:ContantAPIClient? = nil
//
//    init(_client: ContantAPIClient){
//        self.client = _client
//    }
//
//    //MARK: - Get contacts
//    func getContacts(completion: @escaping (_ contacts:(Contacts)) -> Void) {
//        client?.getContacts { data in
//            do{
//                let contactData = try JSONDecoder().decode(ContactData.self, from: data)
//                completion(contactData.contacts)
//            }catch{
//                print(error.localizedDescription)
//                completion([])
//            }
//        }
//    }
//
//
//}

class ContactService:APIHandler{
   
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let urlString =  APIPath().users
        
        if var url = URL(string: urlString) {
            if param.count > 0 {
                url = setQueryParams(parameters: param, url: url)
            }
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> ContactData {
        return try defaultParseResponse(data: data,response: response)
    }
}
