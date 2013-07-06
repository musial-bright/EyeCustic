//
//  ViewController.m
//  EyeCustic
//
//  Created by Adam Musial-Bright on 7/6/13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property UIView *testView;
@end

@implementation ViewController

@synthesize captureManager;


- (void)hideLabel:(UILabel *)label {
	[label setHidden:YES];
}
- (IBAction)scan:(id)sender {
    UIImage *captureImage = captureManager.image;
    imageView.image = [UIImage imageWithCGImage:captureImage.CGImage scale:0 orientation:UIImageOrientationRight];
}

- (void)captureImage {
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scan:) userInfo:nil repeats:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setCaptureManager:[[CaptureSessionManager alloc] init]];
    
	[[self captureManager] addVideoInput];
    
	[[self captureManager] addVideoPreviewLayer];
	CGRect layerRect = [captureView.layer bounds];
	[[self.captureManager previewLayer] setBounds:layerRect];
	[[self.captureManager previewLayer] setPosition:CGPointMake(CGRectGetMidX(layerRect),  CGRectGetMidY(layerRect))];
	[captureView.layer addSublayer:[[self captureManager] previewLayer]];

	[[captureManager captureSession] startRunning];
    
    [self captureImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
