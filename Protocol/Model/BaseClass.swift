//
//  BaseClass.swift
//  Protocol
//
//  Created by My MAC on 4/6/20.
//  Copyright © 2020 Bhavi. All rights reserved.
//

import UIKit

class BaseClass: UIViewController {

    var headers : [String:String] = ["":""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func AuthenticationURL()
    {
        let AuthorizarionUser = ""
        let AuthorizationPassword = ""
        let credentialData = "\(AuthorizarionUser):\(AuthorizationPassword)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        headers = ["Authorization": "Basic \(base64Credentials)"]
    }
    
    func MoveToHomeScreen()
    {
      //  let storyboard = UIStoryboard(name: "Main", bundle: nil)
      //  let nextVC = storyboard.instantiateViewController(withIdentifier: Constants.STORYBOARD.CLASS_NAME.HomeScreen) as! HomeScreen
     //   self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func showNormalAlert(tittle: String, Message: String)
     {
        // let alertVC = CPAlertVC(title: tittle, message: Message)
        // alertVC.show(into: self)
     }
     
    
     func setRoundButtonOnView()
     {
         let button:UIButton = UIButton(frame: CGRect(x: self.view.bounds.width - 60.0, y: self.view.bounds.height - 150.0, width: 50.0, height: 50.0))
        // button.setImage(UIImage(named: "add.png"), for: .normal)
         button.setTitle("+", for: .normal)
         button.backgroundColor = UIColor.colorWithHexString(hexStr: "FE8D00")
         button.layer.cornerRadius = button.frame.height / 2
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
         button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
         self.view.addSubview(button)
     }
     
     func setRoundButtonOnView1()
     {
         let button:UIButton = UIButton(frame: CGRect(x: self.view.bounds.width - 65.0, y: self.view.bounds.height - 200.0, width: 50.0, height: 50.0))
         button.backgroundColor = .clear
         // button.setImage(UIImage(named: "plusIcon.png"), for: .normal)
         button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
         self.view.addSubview(button)
     }
     
     @objc func buttonClicked()
     {
       //  let storyboard = UIStoryboard(name: "Main", bundle: nil)
       //  let nextVC = storyboard.instantiateViewController(withIdentifier: Constants.STORYBOARD.CLASS_NAME.AdsCategoryScreen) as! AdsCategoryScreen
       //  navigationController?.pushViewController(nextVC, animated: true)
     }
    
    
    func setCustomView(CustomView : UIView, HeaderTittleColor : UILabel)
       {
           let shadowPath = UIBezierPath()
           shadowPath.move(to: CGPoint(x: CustomView.bounds.origin.x, y: CustomView.frame.size.height))
           shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width / 2, y: CustomView.bounds.height + 7.0))
           shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width, y: CustomView.bounds.height))
           shadowPath.close()

           CustomView.backgroundColor = UIColor.colorWithHexString(hexStr: "F2F2F7")
           CustomView.layer.shadowColor = UIColor.darkGray.cgColor
           CustomView.layer.shadowOpacity = 1
           CustomView.layer.masksToBounds = false
           CustomView.layer.shadowRadius = 5
           
           HeaderTittleColor.textColor = UIColor.colorWithHexString(hexStr: "FE8D00")
           HeaderTittleColor.font = UIFont.boldSystemFont(ofSize: 17)
       }
       
       func setHeaderView(CustomView : UIView)
       {
           let shadowPath = UIBezierPath()
           shadowPath.move(to: CGPoint(x: CustomView.bounds.origin.x, y: CustomView.frame.size.height))
           shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width / 2, y: CustomView.bounds.height + 7.0))
           shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width, y: CustomView.bounds.height))
           shadowPath.close()

          // CustomView.backgroundColor = UIColor.colorWithHexString(hexStr: "F2F2F7")
           CustomView.layer.shadowColor = UIColor.darkGray.cgColor
           CustomView.layer.shadowOpacity = 1
           CustomView.layer.masksToBounds = false
           CustomView.layer.shadowRadius = 5
       }
    
    /*
     func getProductDetail(ID : String, ViewCount : String, DeviceID : String)
     {
         sdLoader.startAnimating(atView: self.view)
         AuthenticationURL()
         
         let parameters: Parameters = ["id": ID, "view_count": ViewCount, "device_id": DeviceID]
         print("VIEW ADS PARMATER",parameters)
         
         Alamofire.request(Constant.API.getPostAdsDetail, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
             
             switch response.result {
                 
             case .success(_):
                 
                 self.sdLoader.stopAnimation()
                 
                 if let dic = response.result.value as? Dictionary<String, AnyObject> {
                     
                     let responseJSON = response.result.value as! [String:AnyObject]
                     
                     guard let responseCode = responseJSON["code"] as? Int else { return }
                     guard let dynamicMessage = responseJSON["message"] as? String else { return }
                     
                     if responseCode == 200
                     {
                         if let arrayData = dic["data"] as? NSArray
                         {
                             let arrCategories : [City] = City.JSONResponse(array: arrayData)
                         }
                     }
                     else
                     {
                         self.sdLoader.stopAnimation()
                         self.showNormalAlert(tittle: Constant.Message.Alert, Message:dynamicMessage)
                     }
                 }
                 
             case .failure(let error):
                 print(error)
                 self.sdLoader.stopAnimation()
             }
         }
         
     }
     */
    
    /*  func callAPI(Parameter : Parameters , API : String)
       {
           Alamofire.upload(multipartFormData: { multipartFormData in
               
               let userData = try? JSONSerialization.data(withJSONObject: Parameter)
               multipartFormData.append(userData!, withName: "data")
               
               for i in 0..<Globals.sharedInstance.arrImagePickerArray.count {
                   if let dataImages = Globals.sharedInstance.arrImagePickerArray[i].jpegData(compressionQuality: 0.7)
                   {
                       multipartFormData.append(dataImages, withName: "images[]", fileName: "\(i).jpg", mimeType: "image/jpg")
                   }
               }
           },
           to: API, method:.post, headers: headers) { (result) in
               
               switch result
               {
                   case .success(let upload, _, _):
                   
                   upload.responseJSON { response in
                       self.sdLoader.stopAnimation()
                       
                       let responseJSON = response.result.value as! [String:AnyObject]
                       print("RESPONSE JSON",responseJSON)
                       
                       guard let responseCode = responseJSON["code"] as? Int else { return }
                       guard let dynamicMessage = responseJSON["message"] as? String else { return }

                       if responseCode == 200
                       {
                          self.showAlertOK(tittle: Constant.Message.successalert, Message: dynamicMessage)
                       }
                       else
                       {
                           self.sdLoader.stopAnimation()
                           self.showNormalAlert(tittle: Constant.Message.Alert, Message:dynamicMessage)
                       }
                   }
                   
                   case .failure(let encodingError):
                   self.sdLoader.stopAnimation()
                   self.showNormalAlert(tittle: Constant.Message.failedAlert, Message: encodingError.localizedDescription)
               }
           }
    }*/
    
}

extension UIColor {

    // custom color methods
    class func colorWithHex(rgbValue: UInt32) -> UIColor {
        return UIColor( red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                       blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: CGFloat(1.0))
    }
    
    class func colorWithHexString(hexStr: String) -> UIColor {
        var cString:String = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (hexStr.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if (cString.isEmpty || (cString.count) != 6) {
            return colorWithHex(rgbValue: 0xFF5300);
        } else {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            return colorWithHex(rgbValue: rgbValue);
        }
    }
    
    func changeImageColor(theImageView: UIImageView, newColor: UIColor) {
        theImageView.image = theImageView.image?.withRenderingMode(.alwaysOriginal)
            theImageView.tintColor = newColor;
    }
}

extension UIImageView {
    
    func setRoundedImageView() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
