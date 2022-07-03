//
//  Contact.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//

typealias Contacts = [Contact]


//struct ContactData: Codable {
//    var contacts: [Contact] = [Contact]()
//}


struct Contact: Codable {

    var id:Int
    let userEmail, userGender, userName, userStatus:String
   
        
    enum CodingKeys:String,CodingKey{
       case id
       case userEmail = "email"
       case userGender = "gender"
       case userName = "name"
       case userStatus = "status"
    }
}
