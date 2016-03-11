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
  @IBOutlet weak var stopButton: UIButton!
  @IBOutlet weak var recordButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    stopButton.hidden = true
    recordButton.enabled = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func recordAudio(sender: UIButton){
    recordButton.enabled = false
    recordingInProgress.hidden = false
    stopButton.hidden = false
  }
  
  @IBAction func stopRecordingAudio(sender: UIButton){
    recordingInProgress.hidden = true
    recordButton.enabled = true
    stopButton.hidden = true
    performSegueWithIdentifier("showPlaySoundsView", sender: nil)
  }
}

