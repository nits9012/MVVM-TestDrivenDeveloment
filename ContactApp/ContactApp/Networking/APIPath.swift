//
//  APIPath.swift
//  ContactApp
//
//  Created by Nitin Bhatt on 7/2/22.
//

import Foundation


#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()

struct APIPath {
    var users: String { return "\(baseURL)/users"}
}


