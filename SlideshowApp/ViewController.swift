//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山本優也 on 2021/01/21.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet var tapAction: UITapGestureRecognizer!
    
    @IBOutlet weak var img1: UIImageView!
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named:"img01")!,
        UIImage(named:"img02")!,
        UIImage(named:"img03")!,
        UIImage(named:"img04")!,
        UIImage(named:"img05")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        img1.image = imageArray[nowIndex]
        goButton.isEnabled = true
        backButton.isEnabled = true
    }
    //再生・停止ボタン
    @IBAction func slideShowButton(_ sender: Any) {
        if (timer == nil) {
            goButton.isEnabled = false
            backButton.isEnabled = false
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            startButton.setTitle("停止", for: .normal)
        } else {
            goButton.isEnabled = true
            backButton.isEnabled = true
            timer.invalidate()
            timer = nil
            startButton.setTitle("再生", for: .normal)
        }
    }
    
    @objc func changeImage() {
        nowIndex += 1
        
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        img1.image = imageArray[nowIndex]
    }
    
    //進む・戻るボタン
    @IBAction func go(_ sender: Any) {
        
        if (nowIndex != 4) {
            nowIndex += 1
        } else {
            nowIndex = 0
        }
            img1.image = imageArray[nowIndex]
    }
    

    @IBAction func back(_ sender: Any) {
        if (nowIndex != 0) {
            nowIndex -= 1
        } else {
            nowIndex = 4
        }
        img1.image = imageArray[nowIndex]
    }
    
    //segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.img = imageArray[nowIndex]
    }
    
    //戻るためのやつ
    @IBAction func unwind(_segue: UIStoryboardSegue) {
    }
}
