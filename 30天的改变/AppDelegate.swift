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

//Colors
let colorGray   = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
let colorRed    = UIColor(red: 255/255, green: 121/255, blue: 100/255, alpha: 1)
let colorYellow = UIColor(red: 255/255, green: 188/255, blue: 103/255, alpha: 1)
let colorBlue   = UIColor(red: 155/255, green: 193/255, blue: 224/255, alpha: 1)
let colorPink   = UIColor(red: 226/255, green: 128/255, blue: 228/255, alpha: 1)
let taskColor   = UIColor(red: 202/255, green: 105/255, blue: 105/255, alpha: 1)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}
