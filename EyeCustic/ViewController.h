//
//  ViewController.h
//  EyeCustic
//
//  Created by Adam Musial-Bright on 7/6/13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaptureSessionManager.h"

@interface ViewController : UIViewController <AVCaptureVideoDataOutputSampleBufferDelegate> {

    IBOutlet UILabel *frequencyLabel;
    IBOutlet UIView *captureView;
    IBOutlet UIImageView *imageView;
    
}
@property (retain) CaptureSessionManager *captureManager;

@end
