//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Brenton Currie on 24/02/2016.
//  Copyright © 2016 Brenton Currie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recordingInProgress: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton){
        recordingInProgress.hidden = false
    }
}

