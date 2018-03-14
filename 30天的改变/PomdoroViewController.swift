//
//  PomdoroViewController.swift
//  30天的改变
//
//  Created by 李南君 on 2018/3/13.
//  Copyright © 2018年 JimmyLee. All rights reserved.
//

import UIKit

class PomodoroViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var timerView: CProgressView!
    @IBOutlet var readme: UILabel!
    @IBOutlet var round: UIImageView!
    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var timerViewController: UIView!

    var starbreak = false
    var aniDirection = false
    var timer: Timer?

    fileprivate let defaults = UserDefaults.standard

    var process: Float {
        get {
            return timerView.valueProgress / 66.7 * 100
        }
        set {
            timerView.valueProgress = newValue / 100 * 66.7
            updateUI()
        }
    }

    func updateUI() {
        timerView.setNeedsDisplay()
        timeLabel.text = pomodoroClass.timerLabel
    }

}
