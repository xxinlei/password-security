//
//  infoConfirmVC.swift
//  password security
//
//  Created by 楊昕蕾 on 2021/12/11.
//

import UIKit

class infoConfirmVC: UIViewController {
    
   
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    
    var confirmUsername = ""
    var confirmPassword = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLbl.text = confirmUsername
        passwordLbl.text = confirmPassword
        

    }
    


}
