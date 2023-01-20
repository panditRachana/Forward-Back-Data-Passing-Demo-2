//
//  ViewController.swift
//  Forward & Back Data Passing Demo 2
//
//  Created by Rachana Pandit on 04/11/22.
//

import UIKit

class ViewController: UIViewController,BackDataPassingProtocol{

    @IBOutlet weak var txtFieldFirst: UITextField!
    @IBOutlet weak var txtFieldSecond: UITextField!
    @IBOutlet weak var txtFieldThird: UITextField!
    @IBOutlet weak var lblFirstVC1:UILabel!
    @IBOutlet weak var lblSecondVC1:UILabel!
    @IBOutlet weak var lblThirdVC1:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldFirst.text = ""
        txtFieldSecond.text = ""
        txtFieldThird.text = ""
    }
    
    @IBAction func btnToNavigateForward(_ sender: Any)
    {
        let SecondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        SecondVC.dataFromFirstTxtField = txtFieldFirst.text
        SecondVC.dataFromSecondTxtField = txtFieldSecond.text
        SecondVC.dataFromThirdTxtField = txtFieldThird.text
        
// Calling Protocol from VC2
        SecondVC.delegateOnSecondVC = self
        self.navigationController?.pushViewController(SecondVC, animated: true)
    }
    func passDataToFirstViewController(text1: String, text2: String, text3: String)
    {
        lblFirstVC1.text = text1
        lblSecondVC1.text = text2
        lblThirdVC1.text = text3
    }
}

