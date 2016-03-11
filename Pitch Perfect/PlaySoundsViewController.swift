import UIKit
import AVFoundation

class PlaySoundsViewController:UIViewController {
  var recordingUrl:NSURL?
  var recording:AVAudioPlayer?
  
  @IBAction func playSlowSound(){
    playRecording(.Slow)
  }
  
  func playRecording(speed:SoundSpeed){
    guard let recordingUrl = recordingUrl else {
      return
    }
    
    do {
      recording = try AVAudioPlayer(contentsOfURL: recordingUrl)
      recording?.enableRate = true
      recording?.rate = speed.rate
      recording?.play()
    } catch {
      return
    }
  }
  
  enum SoundSpeed {
    case Slow
    
    var rate:Float {
      switch self {
      case .Slow:
        return 0.5
      }
    }
  }
}
