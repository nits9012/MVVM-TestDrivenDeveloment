//
//  AppTheme+Extensions.swift
//  BigStepAssigment
//
//  Created by Nitin Bhatt on 5/31/22.
//
import UIKit

//MARK: - UIColor Extension
extension UIColor{
    static let lightTextColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.00)
    static let darkTextColor = UIColor.white
    
    class func getTextColor() -> UIColor {
        if #available(iOS 13.0, *) {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                return darkTextColor
            }
        }
        return lightTextColor
    }
}

//MARK: - UIFont Extension
extension UIFont{
    class func getThemeFont(ofSize: CGFloat, weight: Weight) -> UIFont{
        return UIFont.systemFont(ofSize: ofSize, weight: weight)
    }
}

//MARK: - UILable Extension
extension UILabel{
    func setThemeFont(ofSize: CGFloat, weight: UIFont.Weight){
        self.font = UIFont.getThemeFont(ofSize: ofSize, weight: weight)
    }
}

//MARK: - UIView Extension
extension UIView{
    func setBorder(radius: CGFloat, color: UIColor = .clear, width: CGFloat = 0){
        self.layer.cornerRadius = radius
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
