//
//  UIView.swift
//  GHUser
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//

import UIKit

extension UIView {
    class func initFromNib<T: UIView>() -> T {
        return UINib(nibName: String(describing: T.self), bundle: nil)
            .instantiate(withOwner: self, options: nil).first as! T
    }
}
