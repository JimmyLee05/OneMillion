//
//  AppDelegate.swift
//  30天的改变
//
//  Created by 李南君 on 2018/3/12.
//  Copyright © 2018年 JimmyLee. All rights reserved.
//  swiftlint:disable line_length

import UIKit
import CoreData

var pomodoroClass = pomodoro()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}
