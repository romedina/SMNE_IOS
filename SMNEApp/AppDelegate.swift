//
//  AppDelegate.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 20/01/21.
//

import UIKit
import Firebase
import GoogleSignIn
import IQKeyboardManagerSwift
import FBSDKCoreKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        //Configure IQKeyboard
        IQKeyboardManager.shared.enable = true
        
        //Configure GoogleLogin
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return GIDSignIn.sharedInstance()?.handle(url) ??  false ||
            ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }
//    #warning("cambios")
//    FlagFetcher.fetchFlags { result in
//        if case let .success(flags) = result,
//          flags.contains("use_facebook") {
//            // Initialize the SDK
//            ApplicationDelegate.shared.application(
//                application,
//                didFinishLaunchingWithOptions: launchOptions
//            )
//        }
//    }
//    
//    
//    
//    // Swift
//    //
//    // AppDelegate.swift
//    import UIKit
//    import FBSDKCoreKit
//
//    @UIApplicationMain
//    class AppDelegate: UIResponder, UIApplicationDelegate {
//        
//        func application(
//            _ application: UIApplication,
//            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//        ) -> Bool {
//              
//            
//
//            return true
//        }
//        
//        / Swift
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            if let token = AccessToken.current,
//                !token.isExpired {
//                // User is logged in, do work such as go to next view controller.
//            }
//        }
//        
//        / Swift
//        //
//        // Extend the code sample from 6a. Add Facebook Login to Your Code
//        // Add to your viewDidLoad method:
//        loginButton.permissions = ["public_profile", "email"]
     
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }

//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

