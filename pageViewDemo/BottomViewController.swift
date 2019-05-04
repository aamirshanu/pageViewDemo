//
//  BottomViewController.swift
//  pageViewDemo
//
//  Created by mac on 04/05/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class BottomViewController: UIViewController {

    @IBOutlet weak var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

            bottomView.roundCorners([.topLeft, .topRight], radius: 15)
        // Do any additional setup after loading the view.
    }

    
}
//extension UIView {
//    
//    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
//    }
//    
//}
