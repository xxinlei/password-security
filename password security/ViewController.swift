//
//  ViewController.swift
//  password security
//
//  Created by 楊昕蕾 on 2021/12/9.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var countingLbl: UILabel!
 
    var checkMsg:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
                
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.hexToRGB(hex: "B7A9A4")])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.hexToRGB(hex: "B7A9A4")])
       
        passwordTxt.addTarget(self, action: #selector(check), for: .allEditingEvents)
        passwordTxt.addTarget(self, action: #selector(countPassword), for: .allEditingEvents)
        
        usernameTxt.delegate = self
        passwordTxt.delegate = self
                
    }
 
    @objc func countPassword(_ sender: UITextField) {
        if let passwordCounting = passwordTxt.text?.count{
        if passwordCounting != 0{
            countingLbl.text = String(passwordCounting)
            }
            else {
                countingLbl.text = ""
            }
        }
        guard passwordTxt.isEditing == true else{
            countingLbl.isHidden = true
            passwordTxt.isSecureTextEntry = true
            return
        }
        countingLbl.isHidden = false
        passwordTxt.isSecureTextEntry = false
    }
    
    
    @objc func check() {
        let usernameTxt = usernameTxt.text ?? ""
        let password = passwordTxt.text ?? ""
        
        guard usernameTxt != "" else{
            resultLbl.text = inputStatus.usernameisEmpty.alert
            return
        }
        guard password != "" else{
            resultLbl.text = inputStatus.passwordisEmpty.alert
            return
        }

        checkMsg = []
        for i in warning.allCases{
        checkMsg.append(i.rawValue)
        }

        //檢查字數
        if password.count >= 16{
            removeWarning(warning.count.rawValue)
        }
        
        //檢查數字
        for digit in passwordPolicy.digits{
            if password.contains(digit) == true{
                removeWarning(warning.digit.rawValue)
                break
            }
        }

        //檢查標點符號
        for i in passwordPolicy.punctuation{
            if password.contains(i) == true{
                removeWarning(warning.punctuation.rawValue)
                break
            }
        }
        
        //檢查使用者名稱
        if password.contains(usernameTxt) == false{
            removeWarning(warning.username.rawValue)
        }
        
        //檢查大寫
        for character in password{
            if character.isUppercase == true{
                removeWarning(warning.uppercase.rawValue)
            }
        }
        
        //檢查小寫
        for character in password{
            if character.isLowercase == true{
                removeWarning(warning.lowercase.rawValue)
            }
        }
                  
        let checkResult = checkMsg.map {$0}.joined(separator: "\n")
        resultLbl.text = checkResult

        guard usernameTxt != "", checkMsg == [] else{
            sendBtn.isEnabled = false
            return
        }
        sendBtn.isEnabled = true
    }
    
    func removeWarning(_ warningString: String){
        checkMsg.removeAll { (removeMessage) -> Bool in
            let removeMessage = removeMessage == warningString
            return removeMessage
    }
}
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.contains(" ") == true{
            return false
        }else{
            return true
        }
    }
    
    @IBAction func closeKeyboard(_ sender: Any) {
    }
    
    @IBSegueAction func nextPage(_ coder: NSCoder) -> infoConfirmVC? {
        let infoConfirmViewController = infoConfirmVC(coder: coder)
        let usernameTxt = usernameTxt.text ?? ""
        let password = passwordTxt.text ?? ""
        infoConfirmViewController?.confirmUsername = usernameTxt
        infoConfirmViewController?.confirmPassword = password
        return infoConfirmViewController
    }
    
    @IBAction func unwindSegueBack(segue: UIStoryboardSegue){
    }
}




