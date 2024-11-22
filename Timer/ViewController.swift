//
//  ViewController.swift
//  Timer
//
//  Created by 柘植俊之介 on 2024/09/09.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    var countdown: Int = 0
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func startTimer(time: Int){
        countdown = time
        if timer != nil{
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerCalled), userInfo: nil, repeats: true)
        timer.fire()
    }
    @IBAction func select30seconds(){
        startTimer(time: 30)
    }
    @IBAction func select60seconds(){
        startTimer(time: 60)
    }
    @IBAction func select5min(){
        startTimer(time: 300)
    }
    @IBAction func select10min(){
        startTimer(time: 600)
    }
    func updateLabel(){
        let remainingMinutes: Int = countdown / 60
        let remainingSeconds: Int = countdown % 60
        label.text = String(format: "%02d:%02d", remainingMinutes,
                            remainingSeconds)
    }
    func showStopAlert(){
        let stopAlert = UIAlertController(title: "タイマーが終了しました", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        stopAlert.addAction (okAction)
        present(stopAlert, animated: true)
    }
    @objc func onTimerCalled(){
        updateLabel()
        countdown -= 1
        if countdown < 0 {
            showStopAlert()
            timer.invalidate()
        }
    }
}
