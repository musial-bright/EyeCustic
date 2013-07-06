//
//  ViewController.h
//  EyeCustic
//
//  Created by Adam Musial-Bright on 7/6/13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaptureSessionManager.h"

@interface ViewController : UIViewController <AVCaptureVideoDataOutputSampleBufferDelegate>

@property (retain) CaptureSessionManager *captureManager;

@property (nonatomic, strong) UIImageView *imageView;

@end
