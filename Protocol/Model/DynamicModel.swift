//
//  ProductDataModel.swift
//  Protocol
//
//  Created by My MAC on 4/6/20.
//  Copyright © 2020 Bhavi. All rights reserved.
//

import Foundation

public class DynamicModel : NSObject {
    public var success : Bool?
    public var code : Int?
    public var message : String?
    public var data : Data?

    public class func modelsFromDictionaryArray(dic:NSDictionary) -> [DynamicModel]
    {
        var models:[DynamicModel] = []
        models.append(DynamicModel(dictionary: dic)!)
        return models
    }

    required public init?(dictionary: NSDictionary) {

        success = dictionary["success"] as? Bool
        code = dictionary["code"] as? Int
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = Data(dictionary: dictionary["data"] as! NSDictionary) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.success, forKey: "success")
        dictionary.setValue(self.code, forKey: "code")
        dictionary.setValue(self.message, forKey: "message")
        dictionary.setValue(self.data?.dictionaryRepresentation(), forKey: "data")

        return dictionary
    }
}

public class Data : NSObject
{
    public var building_type : Array<Building_type>?
    // public var image : Array<Image>?

    
     public class func modelsFromDictionaryArray(array:NSArray) -> [Data]
        {
            var models:[Data] = []
            for item in array
            {
                models.append(Data(dictionary: item as! NSDictionary)!)
            }
            return models
        }
        
        required public init?(dictionary: NSDictionary) {
            
           if (dictionary["building_type"] != nil) { building_type = Building_type.modelsFromDictionaryArray(array: dictionary["building_type"] as! NSArray) }
            
           // if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }

        }
        
        public func dictionaryRepresentation() -> NSDictionary {
            
            let dictionary = NSMutableDictionary()
            return dictionary
        }
}


public class Building_type : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Building_type]
    {
        var models:[Building_type] = []
        for item in array
        {
            models.append(Building_type(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class Image {
    public var image : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Image]
    {
        var models:[Image] = []
        for item in array
        {
            models.append(Image(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        image = dictionary["image"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.image, forKey: "image")
        
        return dictionary
    }
    
}

