//
//  AppDelegate.swift
//  OurToDoList
//
//  Created by Tran Duc Tien on 19/08/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // khi khởi tạo ứng dụng thì func này được gọi
        // là điểm đầu cua ứng dụng, cấu hình 1 Uiwindow, gán 1 UiViewController cho window để nó xuất hiện iOs 12 trở xuống
        // nếu dùng scenes thì không cần nữa, vì app có thể có nhiều UISeceneSesions
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // được gọi khi ứng dụng tạo 1 scene mới
        // không được gọi khi app khởi tạo ban đầu
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // khi người dùng loại bỏ 1 scene
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

