//
//  ViewController.swift
//  LuckNum8
//
//  Created by zj on 2018/9/16.
//  Copyright © 2018年 zls. All rights reserved.
//

import UIKit
import Toast_Swift
import PMAlertController


class ViewController: UIViewController {

    @IBOutlet weak var _backBtn: UIButton!
    
    @IBOutlet weak var _maxFiled: UITextField!
    
    @IBOutlet weak var _numberLable: UILabel!
    @IBOutlet weak var _yuceField: UITextField!
    @IBOutlet weak var _backView: UIView!
    
    @IBOutlet weak var _wucaField: UITextField!
    
    @IBOutlet weak var _beginOrStopLabel: UILabel!
    var isBegin = true
    
    var timer:Timer?
    var gradsLayer:CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _backView.backgroundColor = UIColor.clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.CreatdsdfsLayer()
        
        self.view.bringSubviewToFront(_backView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeColorssdf(_ sender: Any) {
        
        self._maxFiled.resignFirstResponder()
        self._yuceField.resignFirstResponder()
        self._wucaField.resignFirstResponder()
        
        if (self._maxFiled.text == nil || self._maxFiled.text == "")
        {
            self.view.makeToast("请填写最大值", duration: 1, position: .center)
            
            return
        }
        else if (self._wucaField.text == nil || self._wucaField.text == "")
        {
            self.view.makeToast("请填写预测值", duration: 1, position: .center)
            return
        }
        else if (self._yuceField.text == nil || self._yuceField.text == ""){
            self.view.makeToast("请填写误差值", duration: 1, position: .center)
            return
        }
        gradsLayer.colors = [GetChangeColor().cgColor,GetChangeColor().cgColor]
        
        if (isBegin){
            let maxNum = _maxFiled.text
            if (maxNum == nil || maxNum == "") {
                return
            }
            self._beginOrStopLabel.text = "点击屏幕结束"
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.Gocahsdsfs), userInfo: nil, repeats: true)

        }
        else{
            if (timer != nil){
                timer?.invalidate()
                timer = nil
            }
            self._beginOrStopLabel.text = "点击屏幕开始"
            
            let wuca = self._wucaField.text
            let yuce = self._yuceField.text
            let realValue = self._numberLable.text
            let w = (Int)(wuca!)!
            let y = (Int)(yuce!)!
            let r = (Double)(realValue!)!
            
            let donwNum = Double(y) * (1.0 + (Double)(w) / 100.0)
            let upNum = Double(y) * (1.0 - (Double)(w) / 100.0)
      
            if (r >= upNum && r <= donwNum){
                let pgAlert = PMAlertController(title: "恭喜预测成功", description: "", image: nil, style: PMAlertControllerStyle.alert)
                let acton = PMAlertAction(title: "ok", style: .default)
                pgAlert.addAction(acton)
                self.present(pgAlert, animated: false, completion: nil)
            }
            else{
                let pgAlert = PMAlertController(title: "很遗憾预测失败", description: "", image: nil, style: PMAlertControllerStyle.alert)
                let acton = PMAlertAction(title: "ok", style: .default)
                pgAlert.addAction(acton)
                self.present(pgAlert, animated: false, completion: nil)
            }
            
        }
        
        isBegin = !isBegin
    }
    
    
    @objc func Gocahsdsfs()  {
        let MaxNumber:Int = (Int)(self._maxFiled.text!)!
        let randomNumber = arc4random_uniform((UInt32)(MaxNumber))
        self._numberLable.text = randomNumber.description
    }
    
    func CreatdsdfsLayer()  {
        
    let _dsfdsLayer = CAGradientLayer()
        gradsLayer = _dsfdsLayer
        gradsLayer.frame = self.view.bounds
        gradsLayer.colors = [UIColor.red.cgColor,UIColor.yellow.cgColor]
        
        self.view.alpha = 0.8
        self.view.layer.addSublayer(gradsLayer)
    }
    
    
    
    private func GetChangeColor()->UIColor{
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255.0, green: CGFloat(arc4random_uniform(256)) / 255.0, blue: CGFloat(arc4random_uniform(256)) / 255.0, alpha: 1)
    }


}

