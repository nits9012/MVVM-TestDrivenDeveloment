//
//  ContactService.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//

import Foundation

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

    func parseResponse(data: Data, response: HTTPURLResponse) throws -> Contacts {
        return try defaultParseResponse(data: data,response: response)
    }
}


