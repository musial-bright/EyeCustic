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
#import "ImageAnalyser.h"

@interface ViewController ()
@property UIView *testView;
@property (nonatomic, strong) ToneGenerator *toneGenerator;
@property (nonatomic, strong) ImageAnalyser *imageAnalyser;
@end

@implementation ViewController

@synthesize captureManager;


- (void)hideLabel:(UILabel *)label {
	[label setHidden:YES];
}
- (IBAction)scan:(id)sender {
    UIImage *captureImage = captureManager.image;
    imageView.image = [UIImage imageWithCGImage:captureImage.CGImage scale:0 orientation:UIImageOrientationRight];
    
  
    float frequency = [self.imageAnalyser imageInfoFromImagePart:captureImage inRect:CGRectMake(110, 200, 100, 100)] * 200;
    [self.toneGenerator play:frequency];
    frequencyLabel.text = [NSString stringWithFormat:@"%f", frequency];
}

- (void)captureImage {
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scan:) userInfo:nil repeats:YES];
}

- (ToneGenerator *)toneGenerator {
    if (!_toneGenerator) _toneGenerator = [[ToneGenerator alloc] init];
    return _toneGenerator;
}

- (ImageAnalyser *)imageAnalyser {
    if (!_imageAnalyser) _imageAnalyser = [[ImageAnalyser alloc] init];
    return _imageAnalyser;
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
