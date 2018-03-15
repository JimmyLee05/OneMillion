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

    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加手势到View
        let tapToStop = UITapGestureRecognizer()
        tapToStop.addTarget(self, action: #selector(PomodoroViewController.stopPomo(_:)))
        let pressToStart = UILongPressGestureRecognizer()
        pressToStart.addTarget(self, action: #selector(PomodoroViewController.startPomo(_:)))

        timerViewController.addGestureRecognizer(tapToStop)
        timerViewController.addGestureRecognizer(pressToStart)
        updateUI()

        if getDefaults("main.isFirst") != nil {
            //默认存储设置
            isFirst = getDefaults("main.isFirst") as? Bool ?? true
            isDisableLockScreen = getDefaults("main.isDisableLockScreen") as? Bool ?? true
            withTask = getDefaults("main.withTask") as? Bool ?? false
            task = getDefaults("main.task") as? [[String]] ?? [[String]]()
        } else {
            setDefaults ("main.isFirst", value: true as AnyObject)
            setDefaults ("main.isDisableLockScreen", value: isDisableLockScreen as AnyObject)
            setDefaults ("main.withTask", value: withTask as AnyObject)
            setDefaults ("main.task", value: task as AnyObject)
        }

        let app = UIApplication.shared
        app.isIdleTimerDisabled = isDisableLockScreen
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.delegate = self

        //在有任务的情况下显示并设置当前任务
        if withTask {
            if task.count > 0 {
                for i in 0...task.count - 1 {
                    where task[i][3] == "1" {
                        taskLabel.text = task[i][1]
                    }
                }
            } else {
                withTask = false
                setDefaults("main.withTask", value: withTask as AnyObject)
                taskLabel.text = NSLocalizedString("Start with a task", comment: "Start with a task")
            }
        } else {
            taskLabel.text = NSLocalizedString("Start with a task", comment: "Start with a task")
        }
    }

    func updateUI() {
        timerView.setNeedsDisplay()
        timeLabel.text = pomodoroClass.timerLabel
    }

    @objc func stopPomo(_ sender: UITapGestureRecognizer) {
        pomodoroClass.stop()
        stopTimer()
        process = 0
        taskLabel.textColor = taskColor
    }

    @objc func startPomo(_ sender: UILongPressGestureRecognizer) {
        readme.isHidden = true
        if pomodoroClass.pomoMode == 0 {
            if sender.state == UIGestureRecognizerState.ended {
                pomodoroClass.playSound(5)
                if process < 100 {
                    stopTimer()
                    processToZero()
                } else {
                    pomodoroClass.start()
                    stopTimer()
                    timer = Timer.scheduledTimer(timeInterval: 1,
                                                 target: self,
                                                 selector: #selector(PomodoroViewController.pomoing(_:)),
                                                 userInfo: nil,
                                                 repeats: true)
                }
            } else if sender.state == UIGestureRecognizerState.began {
                if pomodoroClass.pomoMode == 0 {
                    taskLabel.textColor = taskColor
                    needStop = false
                    pomodoroClass.playSound(1)
                    stopTimer()
                    processToFull()
                }
            }
        }
    }

    @objc func pomoing(_ timer: Timer) { //调整进度条

    }

    //动画部分Start－－－－－－－－－－
    func processToZero() {
        aniDirection = true
        needStop = true
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(PomodoroViewController.processAnimation(_:)),
                                     userInfo: nil,
                                     repeats: true)
    }

    func processToFull() {
        aniDirection = false
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(PomodoroViewController.processAnimation(_:)),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc func processAnimation(_ timer: Timer) {
        if aniDirection {
            if process >= 0 {
                process -= 1
            } else {
                stopTimer()
            }
        } else {
            if process <= 100 {
                process += 1
            } else {
                stopTimer()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    //动画部分End－－－－－－－－－－

    func getDefaults (_ key: String) -> AnyObject? {
        if key != "" {
            return defaults.object(forKey: key) as AnyObject
        } else {
            return nil
        }
    }

    func setDefaults (_ key: String, value: AnyObject) {
        if key != "" {
            defaults.set(value, forKey: key)
        }
    }
}
