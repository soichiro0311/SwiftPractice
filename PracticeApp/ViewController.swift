//
//  ViewController.swift
//  PracticeApp
//
//  Created by 清家蒼一朗 on 2018/10/29.
//  Copyright © 2018年 清家蒼一朗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tappedLabelString = "タップされたよ"
    let tappedButtonString = "恐竜が消えるよ"
    var beforeTappedLabelString=""
    var beforeTappedButtonString=""
    
    let imageView = UIImageView(image: UIImage(named: "dinosaur.jpg"))
    
    // 画面タップ時にラベルの内容を書き換える
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        if(label.text != tappedLabelString){
          beforeTappedLabelString=label.text!
          label.text=tappedLabelString
        }else{
          label.text=beforeTappedLabelString
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    
    // ボタンタップ時にイメージを画面表示する
    @IBAction func imageButtonTapped() {
        // 画面イメージを作成
        self.imageView.frame = CGRect(x:100, y:200, width:200, height:200)
        self.imageView.tag = 1
        
        // 画面イメージがすでに表示されている場合は、それを消す
        if(self.view.viewWithTag(1) != nil){
          self.view.viewWithTag(1)?.removeFromSuperview()
          imageButton.setTitle(beforeTappedButtonString, for: .normal)
        // 画面イメージがまだ表示されていない場合は、画面イメージを表示する
        }else{
          self.view.addSubview(imageView)
          // アニメーションを使ってフェードインさせる
          self.view.viewWithTag(1)?.alpha = 0.0
          UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseIn], animations: {
            self.view.viewWithTag(1)?.alpha = 1.0
          }, completion: nil)
          beforeTappedButtonString=imageButton.currentTitle!
          imageButton.setTitle(tappedButtonString,for: .normal)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

