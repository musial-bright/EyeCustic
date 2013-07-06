//
//  ViewController.m
//  EyeCustic
//
//  Created by Adam Musial-Bright on 7/6/13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ToneGenerator.h"

@interface ViewController ()
@property UIView *testView;
@property (nonatomic, strong) ToneGenerator *toneGenerator;
@end

@implementation ViewController

@synthesize captureManager;


- (void)hideLabel:(UILabel *)label {
	[label setHidden:YES];
}
- (IBAction)scan:(id)sender {
    UIImage *captureImage = captureManager.image;
    imageView.image = [UIImage imageWithCGImage:captureImage.CGImage scale:0 orientation:UIImageOrientationRight];
    [self.toneGenerator play:2000];
}

- (void)captureImage {
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scan:) userInfo:nil repeats:YES];
}

- (ToneGenerator *)toneGenerator {
    if (!_toneGenerator) _toneGenerator = [[ToneGenerator alloc] init];
    return _toneGenerator;
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
