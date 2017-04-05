//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 宮崎大芽 on 2017/04/04.
//  Copyright © 2017年 taiga.miyazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    imageviewのOutlet
    @IBOutlet weak var imageView: UIImageView!
    var timer: Timer!
    var image_num:Int = 0
//    他のページからsegue出戻って来た時に呼ばれる
    @IBAction func unwind(segue: UIStoryboardSegue){
    }
    
//    表示する画像のメソッド
    func desplayImage() {
        let imageArray = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg" ]
//        条件分岐
        if image_num < 0 {
            image_num = 4
        }
        if image_num > 4 {
            image_num = 0
        }
        let name = imageArray[image_num]
        let image = UIImage(named: name)
        imageView.image = image
        
    }

//    最初の画像表示
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "1.jpg")
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//    スライドを進める
    @IBAction func slideUp(_ sender: Any) {
        image_num += 1
        desplayImage()
    }
    
// 　スライドを戻す
    @IBAction func slideBack(_ sender: Any) {
        image_num -= 1
        desplayImage()
        
    }
    
//    再生と停止
    @IBAction func startStop(_ sender: Any) {
//        条件分岐でnilの時再生
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(nextImage), userInfo: nil, repeats: true)
        }else{
//            それ以外の時は停止
            self.timer.invalidate()
            self.timer = nil
        }
        
    }
//    更新のたびに呼ばれるメソッド
    func nextImage(timer: Timer){
        image_num += 1
        desplayImage()
    }
    
//    画像を押した時に次のページに遷移する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のSecondViewControllerを取得する
        let vcSecond:SecondViewController = segue.destination as! SecondViewController
        vcSecond.imageNum = image_num
    }
}

