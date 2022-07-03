//
//  ContactListViewController.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//

import UIKit

class ContactListViewController: UIViewController {
    
    //MARK: - Outlet and Variable
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactTableViewCell.nib, forCellReuseIdentifier: ContactTableViewCell.identifier)
        return tableView
    }()
    
    lazy var viewModel = {
      ContactListViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        fetchContacts()
    }
    
    func fetchContacts(){
        viewModel.getContacts()
        
        viewModel.reloadTableView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: - UITableview Delegate and Datasource
extension ContactListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contactCellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as? ContactTableViewCell else { return UITableViewCell() }
        cell.cellViewModel = viewModel.getContactFromIndex(indexPath: indexPath)
        return cell
    }
}
