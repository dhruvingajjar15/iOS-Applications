//
//  AppDelegate.swift
//  Beacon Demo
//
//  Created by Dhruvin on 6/7/17.
//  Copyright © 2017 Dhruvin. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var locationManager: CLLocationManager?
    var lastProximity: CLProximity?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let uuidString = "4F52093B-18DA-4E81-B512-1FBF5ED4626F"
        let beaconRegionIdentifier = "dhruvins.iBeacon"
        //convert uuid string to real uuid
        let beaconUUID: NSUUID = NSUUID(uuidString: uuidString)!
        let beaconRegion: CLBeaconRegion = CLBeaconRegion(proximityUUID: beaconUUID as UUID, identifier: beaconRegionIdentifier)
        
        print(beaconRegion)
        
        locationManager = CLLocationManager()
        
        if(locationManager!.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization))) {
            locationManager!.requestAlwaysAuthorization()
        }
        
        locationManager!.delegate = self
        locationManager!.pausesLocationUpdatesAutomatically = false
        
        locationManager!.startMonitoring(for: beaconRegion)
        
        //Start monitoring incase we have beacon in our region
        locationManager!.startRangingBeacons(in: beaconRegion)
        locationManager!.startUpdatingLocation();
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        manager.startRangingBeacons(in: region as! CLBeaconRegion)
        manager.startUpdatingLocation()
        
        print("You entered the region")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        manager.stopRangingBeacons(in: region as! CLBeaconRegion)
        manager.stopUpdatingLocation()
        
        print("You exited a region")
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print("didRangeBeacon number of beacons found = \(beacons.count)")
        
        for aBeacon in beacons {
            
            switch aBeacon.proximity {
                
            case CLProximity.unknown :
                print("Unknown Major = \(aBeacon.major) Minor = \(aBeacon.minor) Accuracy = \(aBeacon.accuracy) RSSI = \(aBeacon.rssi)")
                break
                
            case CLProximity.far :
                print("Far Major = \(aBeacon.major) Minor = \(aBeacon.minor) Accuracy = \(aBeacon.accuracy) RSSI = \(aBeacon.rssi)")
                break
                
            case CLProximity.near :
                print("Near Major = \(aBeacon.major) Minor = \(aBeacon.minor) Accuracy = \(aBeacon.accuracy) RSSI = \(aBeacon.rssi)")
                break
                
            case CLProximity.immediate :
                print("Immediate Major = \(aBeacon.major) Minor = \(aBeacon.minor) Accuracy = \(aBeacon.accuracy) RSSI = \(aBeacon.rssi)")
                break;
            }
        }
        
        //Get the first beacon in the list
        let currentBeacon = beacons.first!
        
        
        //If the proximity is the same as before don't do anything
        if lastProximity != nil && currentBeacon.proximity == lastProximity {
            return
        }
        
        
        //Set the last proximity
        lastProximity = currentBeacon.proximity
        
        
        //If we are Immediate, send notification to anyone interested
        if currentBeacon.proximity == CLProximity.immediate {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "iBeaconFoundReceivedNotification"), object: nil, userInfo: ["major" : currentBeacon.major, "minor" : currentBeacon.minor])
        }
        
        
        
    }

}
















