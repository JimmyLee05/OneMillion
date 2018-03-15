//
//  AppDelegate.swift
//  30天的改变
//
//  Created by 李南君 on 2018/3/12.
//  Copyright © 2018年 JimmyLee. All rights reserved.
//  swiftlint:disable line_length

import UIKit
import CoreData

var isFirst = true
var isDisableLockScreen = false
var needStop = false
var pomodoroClass = pomodoro()

//数据存储方式，直接存一个数组
var withTask = false
var task = [[String]]()
var taskChanged = false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}
