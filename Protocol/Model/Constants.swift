//
//  Constants.swift
//  Protocol
//
//  Created by My MAC on 4/6/20.
//  Copyright © 2020 Bhavi. All rights reserved.
//

import Foundation
import UIKit

struct AppURL
{
    static var globalURL = "http://....../"
}

struct Constants
{
    
    struct url_authorization
    {
        static let userName =  "developer"
        static let password =  "developer"
    }

    struct API
    {
        static var getAllCategory: String
        {
            return AppURL.globalURL + "get-category"
        }
   }
    
    
    struct STORYBOARD
    {
        static let Main =  "Main"
        
        struct CLASS_NAME
        {
            static let LoginScreen =  "LoginScreen"
            static let OTPVerifiedScreen =  "OTPVerifiedScreen"
            static let HomeScreen =  "HomeScreen"
        }
    }
    
    
}
