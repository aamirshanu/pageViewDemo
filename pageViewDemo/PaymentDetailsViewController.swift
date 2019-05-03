//
//  PaymentDetailsViewController.swift
//  pageViewDemo
//
//  Created by mac on 03/05/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class PaymentDetailsViewController: UIViewController {

    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var constrantViewBottom: NSLayoutConstraint!
    @IBOutlet weak var viewBlack: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblChooseCountry: UILabel!
    @IBOutlet weak var tblCountry: UITableView!
    @IBOutlet weak var lblCreditDebit: UILabel!
    @IBOutlet weak var tblCardDetail: UITableView!
    var arrCardInfo = ["Debit", "Credit"]
    var arrCountry = ["Albania", "America", "Arsenal","Belgium", "Behrain", "India"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewBlack.isHidden = true
        viewBottom.isHidden = true
        scrollView.isScrollEnabled = true
        tblCardDetail.isHidden = true
        tblCountry.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnAddNewPayment(_ sender: UIButton) {
        
        viewBlack.isHidden = false
        viewBottom.isHidden = false
    }
    @IBAction func btnCreditDebit(_ sender: UIButton) {
        
        if tblCardDetail.isHidden{
            animate(toggle: true)
        }else{
            animate(toggle: false)
        }
    }
    @IBAction func btnChooseCountry(_ sender: UIButton) {
        
        if tblCountry.isHidden{
            animateTableTwo(toggle: true)
            
        }else{
           animateTableTwo(toggle: false)
            
        }
    }
    
    @IBAction func btnCrossBottomView(_ sender: UIButton) {
        viewBlack.isHidden = true
        viewBottom.isHidden = true
    }
    func animate(toggle: Bool){
        if toggle{
            UIView.animate(withDuration: 0.3) {
                self.tblCardDetail.isHidden = false
            }
        }else{
            UIView.animate(withDuration: 0.3) {
                self.tblCardDetail.isHidden = true
            }
            }
        }
    
    func animateTableTwo(toggle: Bool){
        if toggle{
            UIView.animate(withDuration: 0.3) {
                self.tblCountry.isHidden = false
            }
        }else{
            UIView.animate(withDuration: 0.3) {
                self.tblCountry.isHidden = true
            }
        }
    }
    }


extension PaymentDetailsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tblCardDetail{
             return arrCardInfo.count
        }else if tableView == tblCountry{
            return arrCountry.count
        }
        return 1
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if tableView == tblCardDetail{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                cell?.textLabel?.text = arrCardInfo[indexPath.row]
            return cell!
        }else if tableView == tblCountry{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            cell?.textLabel?.text = arrCountry[indexPath.row]
            return cell!
        }
        return UITableViewCell()
    }
}
extension PaymentDetailsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblCardDetail{
        lblCreditDebit.text = arrCardInfo[indexPath.row]
        animate(toggle: false)
        }else if tableView == tblCountry{
            lblChooseCountry.text = arrCountry[indexPath.row]
            animateTableTwo(toggle: false)
        }
       
    }
}
