//
//  LauchdViewController.swift
//  LuckNum8
//
//  Created by zj on 2018/9/16.
//  Copyright © 2018年 zls. All rights reserved.
//

import UIKit

class LauchdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
         let storsdId = UIStoryboard.init(name: "Main", bundle: nil)
                   let vsds = storsdId.instantiateViewController(withIdentifier: "viewStoryId")
                   self.present(vsds, animated: false, completion: nil)
        
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
