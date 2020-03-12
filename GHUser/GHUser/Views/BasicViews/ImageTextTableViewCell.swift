//
//  ImageTextTableViewCell.swift
//  GHUser
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//

import UIKit

class ImageTextTableViewCell: UITableViewCell {

    lazy var imageTextView: ImageTextView = {
        let view: ImageTextView = UIView.initFromNib()
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(image: UIImage, labelText: String) {
        imageTextView.set(image: image, labelText: labelText)
    }
    
    private func addConstraint() {
        
    }

}
