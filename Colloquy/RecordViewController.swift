//
//  FirstViewController.swift
//  Colloquy
//
//  Created by Josiah Gaskin on 5/25/15.
//  Copyright (c) 2015 Colloquy. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, EZMicrophoneDelegate {

    @IBOutlet weak var dummyPositioningView: UIView!
    @IBInspectable var backgroundColor : UIColor = UIColor.clearColor()
    @IBInspectable var waveformColor : UIColor = UIColor.redColor()
    @IBOutlet weak var waveformPlot: EZAudioPlotGL!
    @IBOutlet weak var recordButton: UIButton!
    
    var microphone : EZMicrophone!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.microphone = EZMicrophone(microphoneDelegate: self)

        self.waveformPlot.plotType = EZPlotType.Rolling
        self.waveformPlot.shouldFill = true
        self.waveformPlot.shouldMirror = true
        self.waveformPlot.backgroundColor = backgroundColor
        self.waveformPlot.color = waveformColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.waveformPlot.transform = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(M_PI/2))
        self.waveformPlot.bounds = CGRect(x: 0, y: 0, width: dummyPositioningView.bounds.size.height, height: dummyPositioningView.bounds.size.width)
        self.waveformPlot.center = dummyPositioningView.center
        self.microphone.startFetchingAudio()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // WARNING THIS WILL BE CALLED ON A BACKGROUND THREAD THAT MAY NOT BE BLOCKED
    func microphone(microphone: EZMicrophone!, hasAudioReceived buffer: UnsafeMutablePointer<UnsafeMutablePointer<Float>>, withBufferSize bufferSize: UInt32, withNumberOfChannels numberOfChannels: UInt32) {
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.waveformPlot.updateBuffer(buffer[0], withBufferSize: bufferSize)
        })
    }
}

