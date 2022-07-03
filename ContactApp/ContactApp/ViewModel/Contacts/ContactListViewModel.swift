//
//  ContactListViewModel.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//

import Foundation

class ContactListViewModel:NSObject{
    
    func getAPIData(param: [String: Any], completion: @escaping (Contacts?, ServiceError?) -> ()){

        let request = ContactService()
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}
