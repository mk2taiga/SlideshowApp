//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 宮崎大芽 on 2017/04/04.
//  Copyright © 2017年 taiga.miyazaki. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondImageView: UIImageView!
    
    var imageNum:Int = 0
    
//    画像ほゆ路のメソッド
    func desplayImage() {
        let imageArray = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg" ]
        //        条件分岐
        if imageNum < 0 {
            imageNum = 4
        }
        if imageNum > 4 {
            imageNum = 0
        }
        let name = imageArray[imageNum]
        let image = UIImage(named: name)
        secondImageView.image = image
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desplayImage()
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
