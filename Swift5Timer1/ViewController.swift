//
//  ViewController.swift
//  Swift5Timer1
//
//  Created by 西谷恭紀 on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    //UIKitに入っているTimerクラスをインスタンスした
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Stopボタンを押せなくする
        stopButton.isEnabled = true
        
        //配列にAssert.xcassetsに格納した画像ファイルを入れている
        //画像名[0,1,2,3,4]
        for i in 0..<5{
            print(i)
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        //画面起動時に表示される画像を指定
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer(){
        //Timerを回す｡0.2秒ごとにあるメソッドを渡す｡
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    //0.2秒ごとに呼ばれる
    @objc func timerUpdate(){
        count = count + 1
        
        //imageArrayが配列の外に出た場合､countが0にリセットされる
        if count > 4{
            count = 0
        }
        
        imageView.image = imageArray[count]
        
        
        
    }

    @IBAction func start(_ sender: Any) {
        
        //imageViewのイメージに画像を反映していく
        startTimer()
        //Startボタンを押したら､Startボタンを押せなくする
        startButton.isEnabled = false
        startButton.isEnabled = true
        
        
    }
    
    @IBAction func stop(_ sender: Any) {
        
        
        //imageViewのimageに反映されている画像の流れをStopする
        
        
        //Startボタンを押せるようにする
        startButton.isEnabled = true
        
        //timerを止める
        timer.invalidate()
        
        count = 0

    }
    
    
    
}

