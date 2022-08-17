//
//  ContantAPIClient.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//

import Foundation

protocol ContactAPIClientProtocol {
    func getContacts(completion: @escaping (Data) -> Void)
}

class ContantAPIClient: ContactAPIClientProtocol {
    private let json = """
    {
        "contacts": [
            {
                "first_name": "John",
                "last_name": "Morgan",
                "tag_handle": "dmorgan",
                "image_url": "https://github.com/nits9012/MVVM-TDD/blob/main/Avatar1"
            },
            {
                "first_name": "Chris",
                "last_name": "James",
                "tag_handle": "TheIsland",
                "image_url": "https://github.com/nits9012/MVVM-TDD/blob/main/Avatar2.png"
            },
            {
                "first_name": "Josh",
                "last_name": "Wood",
                "tag_handle": "TheRealSawyer",
                "image_url": "https://github.com/nits9012/MVVM-TDD/blob/main/Avatar3.png"
            },
            {
                "first_name": "Robert",
                "last_name": "Kelly",
                "tag_handle": "Trundle",
                "image_url": "https://github.com/nits9012/MVVM-TDD/blob/main/Avatar1.png"
            },
            {
                "first_name": "Bobby",
                "last_name": "Lisa",
                "tag_handle": "Billions",
                "image_url": "https://github.com/nits9012/MVVM-TDD/blob/main/Avatar1.png"
            },
        ]
    }
    """.data(using: .utf8)!
    
    func getContacts(completion: @escaping ((Data) -> Void)) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.3) {
            completion(self.json)
        }
    }
}
