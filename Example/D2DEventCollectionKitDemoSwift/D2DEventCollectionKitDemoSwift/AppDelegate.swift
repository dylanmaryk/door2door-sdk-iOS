//
//  AppDelegate.swift
//  D2DEventCollectionKitDemoSwift
//
//  Created by Elmar Tampe on 11/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import UIKit
import D2DEventCollectionKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        
        
        // Add D2DEventCollectionKit integration
        self.setupTrackingIntegration()
        
        self.testSearchEvent()
        
        return true
    }
    
    // ------------------------------------------------------------------------------------------
    // MARK: D2DEventCollectionKit Functions
    // ------------------------------------------------------------------------------------------
    public func setupTrackingIntegration() {
    
        EventCollectionKit.register(applicationToken: "YOUR_APP_TOKEN_GOES_HERE",
                                    applicationName: "Ally App",
                                    applicationVersion: "1.0.0")
        
        EventCollectionKit.enableLogging(logginEnabled: true)
    }
    
    
    fileprivate func testSearchEvent() {
    
        let searchEvent  = TripEvent.tripSearchEvent(originLatitude: 99.00,
                                                     originLongitude: 99.0,
                                                     originName: "Alexanderplatz",
                                                     originStreet: "Alexanderstrasse 1",
                                                     originCity: "Berlin",
                                                     originPostalCode: "10119",
                                                     originCountry: "Germany",
                                                     destinationLatitude: 99.00,
                                                     destinationLongitude: 99.00,
                                                     destinationName: nil,
                                                     destinationStreet: "Torstrasse 109",
                                                     destinationCity: "Germany",
                                                     destinationPostalCode: "10119",
                                                     destinationCountry: "Germany")
        
        EventCollectionKit.send(event: searchEvent)
    }
    

    // MARK: - Split view
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

