//
//  ContactTableViewCell.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//

import UIKit
import SDWebImage

class ContactTableViewCell: UITableViewCell{
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
    class var identifier:String{String(describing: self)}
    class var nib:UINib{UINib(nibName: identifier, bundle: nil)}
    
    var cellViewModel:ContactListCellViewModel?{
        didSet{
            nameLabel.text = (cellViewModel?.firstName ?? "") + " " + (cellViewModel?.lastName ?? "")
            tagLabel.text = cellViewModel?.tagHandle ?? ""
            
            if let imageURL = cellViewModel?.imageURL, let url = URL(string: imageURL) {
                profilePictureImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "profile_load"))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setThemeUI()
    }
    
    private func setThemeUI(){
        profilePictureImageView.setBorder(radius: 20.0)
        nameLabel.setThemeFont(ofSize: 17, weight: .medium)
        tagLabel.setThemeFont(ofSize: 14, weight: .light)
    }
}



