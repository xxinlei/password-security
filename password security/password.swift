//
//  password.swift
//  password security
//
//  Created by 楊昕蕾 on 2021/12/13.
//

import Foundation

class passwordPolicy{
    
    static let digits = "0123456789"
    static let punctuation = "!@#$%^&*(),.<>;'`~[]{}\\|/?_-+="

}


enum warning:String, CaseIterable{
    
    case count = "密碼至少須包含16個字元"
    case digit = "密碼至少須包含一個數字"
    case punctuation = "密碼至少須包含一個標點符號"
    case lowercase = "密碼至少須包含一個小寫字母"
    case uppercase = "密碼至少須包含一個大寫字母"
    case username = "密碼不可包含使用者名稱"

}

enum inputStatus{
    case usernameisEmpty
    case passwordisEmpty
 
    var alert: String{
        switch self {
        case .usernameisEmpty:
            return "請輸入使用者名稱"
        case .passwordisEmpty:
            return "請輸入密碼"
            
        }
    }
}
