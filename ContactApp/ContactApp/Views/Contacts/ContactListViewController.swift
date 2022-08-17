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
    
    private var dataSource: [Contact]?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        fetchContacts()
    }
    
    func fetchContacts(){
        
        viewModel.getAPIData(param: [:], completion: { (model, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error?.message, preferredStyle: UIAlertController.Style.alert)
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                if let modelUW = model {
                    self.dataSource = modelUW
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        })
    }
        
        
//        viewModel.getContacts()
//
//        viewModel.reloadTableView = {
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    }
//}

//MARK: - UITableview Delegate and Datasource
extension ContactListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as? ContactTableViewCell else { return UITableViewCell() }
        let result = self.dataSource?[indexPath.row]
        cell.nameLabel.text = result?.userName
        cell.emailLabel.text = result?.userEmail
        cell.genderLabel.text = result?.userGender.uppercased()
        return cell
    }
}
