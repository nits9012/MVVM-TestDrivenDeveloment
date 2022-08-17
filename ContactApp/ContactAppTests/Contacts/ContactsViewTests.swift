//
//  ContactsViewTests.swift
//  ContactAppTests
//
//  Created by Nitin Bhatt on 7/3/22.
//

import XCTest
@testable import ContactApp

class ContactsViewTests: XCTestCase {
    
    var tableView = UITableView()
    var emptyTableView = UITableView()
    var controller = ContactListViewController()
    
    override func setUp() {
        controller.loadViewIfNeeded()
        tableView.dataSource = self
    }

    override func tearDown() {
    }
    
    // Mark: UI elements tests
    
    func test_WhenCreated_HasTableView(){
        XCTAssertNotNil(controller.tableView)
    }
    
    func test_WhenCreated_TableViewHasDelegate(){
        XCTAssertNotNil(controller.tableView.delegate)
    }
    
    func test_WhenCreated_TableViewHasDataSource(){
        XCTAssertNotNil(controller.tableView.dataSource)
    }
    
    func test_TableViewConformsTableViewDataSourceProtocol(){
        XCTAssertTrue(controller.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(controller.responds(to: #selector(controller.tableView(_ : numberOfRowsInSection:))))
        XCTAssertTrue(controller.responds(to: #selector(controller.tableView(_ : cellForRowAt:))))
    }
    
    func test_RegisterCellWithClassAndNib(){
        tableView.register(ContactTableViewCell.nib, forCellReuseIdentifier: ContactTableViewCell.identifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier)
        XCTAssertNotNil(cell)
    }
    
    func test_TableCellHasCorrectDefaultLabelText(){
        tableView.register(ContactTableViewCell.nib, forCellReuseIdentifier: ContactTableViewCell.identifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier) as?  ContactTableViewCell
        XCTAssertEqual(cell?.nameLabel.text, "Label")
        XCTAssertEqual(cell?.emailLabel.text, "Label")

    }
    
    // Mark: API Test
 //   func test_getContactDetails_APIResponse() {
//        let expectation = XCTestExpectation(description: "ValidRequst_Returns_ContactsDetails")
//
//        let contantAPIClient = ContactService()
//
//        contantAPIClient.getContacts { contacts in
//            if contacts.count > 0{
//                expectation.fulfill()
//            }else{
//                XCTFail("Data is nil")
//            }
//        }
//        wait(for: [expectation], timeout: 1.0)
//    }
}


extension ContactsViewTests:UITableViewDataSource{
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView == emptyTableView ? 0 : 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == emptyTableView{
            return 0
        }else{
            return section == 0 ? 1 : 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
