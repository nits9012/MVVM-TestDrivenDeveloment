//
//  ContactTableViewCell.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//

import UIKit
//import SDWebImage

class ContactTableViewCell: UITableViewCell{
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    class var identifier:String{String(describing: self)}
    class var nib:UINib{UINib(nibName: identifier, bundle: nil)}
    
    var cellViewModel:ContactListCellViewModel?{
        didSet{
            nameLabel.text = (cellViewModel?.userName ?? "")
            emailLabel.text = cellViewModel?.userEmail ?? ""
            genderLabel.text = cellViewModel?.userGender ?? ""
//            if let imageURL = cellViewModel?.imageURL, let url = URL(string: imageURL) {
//                profilePictureImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "profile_load"))
//            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setThemeUI()
    }
    
    private func setThemeUI(){
        profilePictureImageView.setBorder(radius: 20.0)
        nameLabel.setThemeFont(ofSize: 16.5, weight: .medium)
        emailLabel.setThemeFont(ofSize: 16, weight: .light)
        genderLabel.setThemeFont(ofSize: 16, weight: .light)
    }
}



