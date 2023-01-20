//
//  SecondVC.swift
//  Forward & Back Data Passing Demo 2
//
//  Created by Rachana Pandit on 04/11/22.
//

import UIKit

protocol BackDataPassingProtocol{
    func passDataToFirstViewController(text1:String,text2:String,text3:String)
}
class SecondVC: UIViewController {

    var dataFromFirstTxtField:String?
    var dataFromSecondTxtField:String?
    var dataFromThirdTxtField:String?
    var delegateOnSecondVC:BackDataPassingProtocol!
    
    @IBOutlet weak var lblFirstVC2: UILabel!
    @IBOutlet weak var lblSecondVC2: UILabel!
    @IBOutlet weak var lblThirdVC2: UILabel!
    @IBOutlet weak var textFieldFirstVC2:UITextField!
    @IBOutlet weak var textFieldSecondVC2:UITextField!
    @IBOutlet weak var textFieldThirdVC2:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        textFieldFirstVC2.text = ""
        textFieldSecondVC2.text = ""
        textFieldThirdVC2.text = ""
        lblFirstVC2.text = dataFromFirstTxtField
        lblSecondVC2.text = dataFromSecondTxtField
        lblThirdVC2.text = dataFromThirdTxtField
    }
    
    @IBAction func btnToNavigateFirstVC(_ sender : Any)
    {
        guard let delegateOnSecondVC = delegateOnSecondVC else{
        print("delegate not found")
        return
        }
        let sendOnFirstVCLbl1 = self.textFieldFirstVC2.text
        let sendOnFirstVCLbl2 = self.textFieldSecondVC2.text
        let sendOnFirstVCLbl3 = self.textFieldThirdVC2.text

        delegateOnSecondVC.passDataToFirstViewController(text1:sendOnFirstVCLbl1!, text2:sendOnFirstVCLbl2!, text3:sendOnFirstVCLbl3!)
        navigationController?.popViewController(animated: true)
    }

}
