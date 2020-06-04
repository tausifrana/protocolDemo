//
//  ViewController.swift
//  Protocol
//
//  Created by My MAC on 4/6/20.
//  Copyright © 2020 Bhavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let objParser = Parser()
    var arrSizeDict = [String:Int]()
    var arrSizeID = [Int]()
    var arrSizeName = [String]()
    var SelectedSizeID = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        objParser.downloadDelegate = self
       // Globals.sharedInstance.arrMarketSize.removeAll()
       // objParser.getDynamicArray(CategoryID: String(Globals.globalCategoryID))
    }
}

extension ViewController : DownloadDelegate {
   
    func downloadDynamicArrayCompleted(isCompleted: Bool)
    {
       /* if isCompleted
        {
            if Globals.sharedInstance.arrCategoryData.count > 0
            {
                for i in 0...Globals.sharedInstance.arrCategoryData.count - 1
                {
                    let objClub = Globals.sharedInstance.arrCategoryData[i]
                    self.arrSizeID.append(objClub.id!)
                    self.arrSizeName.append(objClub.name!)
                }
                arrSizeDict = Dictionary(uniqueKeysWithValues: zip(self.arrSizeName, self.arrSizeID))
            }
            sdLoader.stopAnimation()
        }
        else
        {
            // Error
            sdLoader.stopAnimation()
        }*/
    }
}
