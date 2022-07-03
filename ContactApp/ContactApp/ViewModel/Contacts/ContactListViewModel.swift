//
//  ContactListViewModel.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//

import Foundation

class ContactListViewModel:NSObject{
   
    private var contactService:ContactRepositoryProtocol
    
    var reloadTableView:(()->())?
    
    var contactCellViewModel = [ContactListCellViewModel](){
        didSet{
            reloadTableView?()
        }
    }
    
    init(contactService: ContactRepositoryProtocol = ContactService(_client: ContantAPIClient())) {
        self.contactService = contactService
    }
    
    func getContacts(){
        self.contactService.getContacts {contacts in
            for value in contacts{
                self.contactCellViewModel.append( ContactListCellViewModel(firstName:value.firstName, lastName:value.lastName, tagHandle:value.tagHandle,imageURL:value.imageURL))
            }
        }
    }
    
    func getContactFromIndex(indexPath:IndexPath)->ContactListCellViewModel{
        return self.contactCellViewModel[indexPath.row]
    }
}
