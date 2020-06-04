//
//  Parser.swift
//  Protocol
//
//  Created by My MAC on 4/6/20.
//  Copyright © 2020 Bhavi. All rights reserved.
//

import Foundation
//import Alamofire

typealias DownloadComplete = () -> ()
typealias CompletionHandler<T> = (_ Success: Bool, _ data: T) -> ()

@objc protocol DownloadDelegate {
    @objc optional func downloadCompleted(isCompleted : Bool)
    @objc optional func downloadCategoriesData(isCompleted : Bool)
    @objc optional func downloadSubCategoriesData(isCompleted : Bool)
    @objc optional func downloadChildSubCategoriesData(isCompleted : Bool)
    @objc optional func downloadDynamicArrayCompleted(isCompleted : Bool) // -->>>>> Implemented
    @objc optional func downloadCityArrayCompleted(isCompleted : Bool)
    @objc optional func downloadKidsClothSizeArrayCompleted(isCompleted : Bool)
    @objc optional func downloadCarSubModelArrayCompleted(isCompleted : Bool)
    @objc optional func postAdsDataCompleted(isCompleted : Bool)
}


class Parser: NSObject
{
    var downloadDelegate : DownloadDelegate!
    static var shared = Parser()

    var isSuccess = true
    
    override init(){}
    
    
    /*

     func getDynamicArraData(CategoryID : String, completed: @escaping DownloadComplete)
     {
         AuthenticationURL()
         
         let parameters: Parameters = ["category_id": CategoryID]
         
         sessionManager.request(Constant.API.getDynamicArray, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
             
             switch response.result {

             case .success(_):
                 
                 if let dic = response.result.value as? Dictionary<String, AnyObject> {
                     
                     let jsonResponse = DynamicModel.modelsFromDictionaryArray(dic: response.result.value as! NSDictionary)
                     let jsonData = jsonResponse[0].data
                     
                     if jsonResponse[0].code == 200
                     {
                         if Globals.globalCategoryID == 1
                         {
     
                            // Globals.sharedInstance.arrCategoryData.append(contentsOf: jsonData!.category_data!)

     
                             Globals.sharedInstance.arrBuildingType.append(contentsOf: jsonData!.building_type!)
                             Globals.sharedInstance.arrFloorType.append(contentsOf: jsonData!.floor!)
                             Globals.sharedInstance.arrRepairType.append(contentsOf: jsonData!.repair!)
                         }
                     }
                     else
                     {
                         print("ELSE 200")
                     }
                 }
                 
             case .failure(let error):
                 print(error)
                 self.isSuccess = false
             }
             completed()
         }
     }
     
     */
 

    /* func getKidsClothSize(CategoryID : String)
      {
          self.getKidsClothSize(CategoryID: CategoryID ,completed: {
              
              if self.isSuccess
              {
                  self.downloadDelegate.downloadKidsClothSizeArrayCompleted!(isCompleted: true)
              }
              else
              {
                  self.downloadDelegate.downloadKidsClothSizeArrayCompleted!(isCompleted: false)
              }
          })
      }
      
      func getKidsClothSize(CategoryID : String, completed: @escaping DownloadComplete)
         {
             // AuthenticationURL()
             
             sessionManager.request(Constant.API.getCity, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
                 
                 switch response.result {

                 case .success(_):
                     
                     if let dic = response.result.value as? Dictionary<String, AnyObject> {
                         
                         let responseCode = dic["code"] as? Int
                         if responseCode == 200
                         {
                             if let arrayData = dic["data"] as? NSArray
                             {
                                 let arrCategories : [City] = City.JSONResponse(array: arrayData)
                                 Globals.sharedInstance.arrCityData.append(contentsOf:arrCategories)
                                
                                 Globals.sharedInstance.cityID.removeAll()
                                 Globals.sharedInstance.cityName.removeAll()
                                 Globals.sharedInstance.cityDict.removeAll()
                                 
                                 for i in 0...Globals.sharedInstance.arrCityData.count - 1
                                 {
                                     let objClub = Globals.sharedInstance.arrCityData[i]
                                     Globals.sharedInstance.cityID.append(objClub.id!)
                                     Globals.sharedInstance.cityName.append(objClub.name!)
                                 }
     
                                 Globals.sharedInstance.cityDict = Dictionary(uniqueKeysWithValues: zip(Globals.sharedInstance.cityName, Globals.sharedInstance.cityID))
                                 self.isSuccess = true
     
                             }
                         }
                         else
                         {
                             print("ELSE 200")
                         }
                     }
                     
                 case .failure(let error):
                     print(error)
                     self.isSuccess = false
                 }
                 completed()
             }
         }*/
    
}



/*

let sessionManager: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 60
    
    return SessionManager(configuration: configuration)
}()

*/

