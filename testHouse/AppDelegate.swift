
//
//  AppDelegate.swift
//  testHouse
//
//  Created by Ivan Alekseev on 19.07.16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        print(UIFont.fontNamesForFamilyName("Circe"))
        //print(UIFont.familyNames())
        return true
    }

}

