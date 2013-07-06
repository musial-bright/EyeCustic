//
//  ToneGenerator.h
//  EyeCustic
//
//  Created by Adam Musial-Bright on 7/6/13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ToneGenerator : NSObject {

    AudioComponentInstance toneUnit;
    
@public
    double frequency;
    double sampleRate;
    double theta;
}

- (void)play;
- (void)stop;

@end
