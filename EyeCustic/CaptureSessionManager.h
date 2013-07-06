//
//  CaptureSessionManager.h
//  EyeCustic
//
//  Created by Adam Musial-Bright on 7/6/13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>

@interface CaptureSessionManager : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate>

@property (retain) AVCaptureVideoPreviewLayer *previewLayer;
@property (retain) AVCaptureSession *captureSession;
@property (nonatomic, strong) UIImage *image;

- (void)addVideoPreviewLayer;
- (void)addVideoInput;

@end
