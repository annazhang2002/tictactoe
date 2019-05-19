//
//  File.swift
//  ATown Connect
//
//  Created by Anna Zhang on 2/16/19.
//  Copyright © 2019 Anna Zhang. All rights reserved.
//

import UIKit

class LevelSelectorController: UIViewController {
    
    var level = String()
    var mode = String()
    var direction = "forward"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func levelSelection(_ sender: UIButton) {
        level = (sender.titleLabel?.text)!;
        print("level", level);
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        direction = "back"
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: (Any)?){
        if direction == "forward" {
            let destViewController: ViewController = segue.destination as! ViewController
            destViewController.level = self.level
            destViewController.mode = self.mode
        }
    }
}
