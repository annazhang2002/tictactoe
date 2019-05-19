//
//  ModeViewController.swift
//  ATown Connect
//
//  Created by Anna Zhang on 2/16/19.
//  Copyright © 2019 Anna Zhang. All rights reserved.
//

import UIKit

class ModeViewController: UIViewController {
    
    var mode = String();
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func modeSelection(_ sender: UIButton) {
        mode = (sender.titleLabel?.text)!;
        print("mode", mode);
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        if mode == "Multiplayer" {
            let destViewController: ViewController = segue.destination as! ViewController
            destViewController.mode = self.mode
        }
        else {
            let destViewController: LevelSelectorController = segue.destination as! LevelSelectorController
            destViewController.mode = self.mode
        }
    }
    
}
