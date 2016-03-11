//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Brenton Currie on 24/02/2016.
//  Copyright © 2016 Brenton Currie. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController, AVAudioRecorderDelegate {
  @IBOutlet weak var recordingInProgress: UILabel!
  @IBOutlet weak var stopButton: UIButton!
  @IBOutlet weak var recordButton: UIButton!
  
  var audioRecorder:AVAudioRecorder!
  let playSoundsSegueID = "showPlaySoundsView"
  
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
    record()
  }
  
  @IBAction func stopRecordingAudio(sender: UIButton){
    recordingInProgress.hidden = true
    recordButton.enabled = true
    stopButton.hidden = true
    stopRecording()
    performSegueWithIdentifier(playSoundsSegueID, sender: nil)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == playSoundsSegueID {
      let destinationVC = segue.destinationViewController as? PlaySoundsViewController
      destinationVC?.recordingUrl = audioRecorder.url
    }
  }
  
  func record(){
    let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    let currentDateTime = NSDate()
    let formatter = NSDateFormatter()
    formatter.dateFormat = "ddMMyyyy-HHmmss"
    let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
    let pathArray = [dirPath, recordingName]
    let filePath = NSURL.fileURLWithPathComponents(pathArray)
    
    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
    try! session.setActive(true)
    
    audioRecorder = try! AVAudioRecorder(URL: filePath!, settings: [:])
    audioRecorder.delegate = self
    audioRecorder.record()
  }
  
  func stopRecording(){
    audioRecorder.stop()
  }
  
  func pauseRecording(){
    audioRecorder.pause()
  }
}

