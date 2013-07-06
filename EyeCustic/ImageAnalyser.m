//
//  ImageAnalyser.m
//  EyeCustic
//
//  Created by Pascal Rauprecht on 06.07.13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import "ImageAnalyser.h"

@implementation ImageAnalyser

- (NSArray*)pixelValueFor: (UIImage *)image AtXLocation: (int) x andYLocation:(int) y {
    CFDataRef pixelData = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage));
    const UInt8* data = CFDataGetBytePtr(pixelData);
    
    int pixelInfo = ((image.size.width  * y) + x ) * 4; // The image is png
    
    UInt8 red = data[pixelInfo];         // If you need this info, enable it
    UInt8 green = data[(pixelInfo + 1)]; // If you need this info, enable it
    UInt8 blue = data[pixelInfo + 2];    // If you need this info, enable it
    UInt8 alpha = data[pixelInfo + 3];     // I need only this info for my maze game
    
    //UIColor* color = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha/255.0f]; // The pixel color info
    
    NSArray *pixelInts = [[NSArray alloc] initWithObjects:@(red),@(green),@(blue),@(alpha), nil];
    
    
    if (alpha) return pixelInts;
    else return 0;
    
}



- (int)areaValueFor: (UIImage *)image topLeftPoint:(CGPoint)tlPoint andBottomRightPoint:(CGPoint)brPoint
{
    int alpha = 0;
    int scalFactor = 10;
    int loopCount = 0;
    for (int yScan = tlPoint.y; yScan <= brPoint.y; yScan = yScan + scalFactor) {
        for (int xScan = tlPoint.x; xScan <= brPoint.x; xScan =  xScan + scalFactor) {
            NSArray *pixelInfo = [self pixelValueFor:image AtXLocation:xScan andYLocation:yScan];
            alpha += [pixelInfo[3] integerValue];
            loopCount++;
        }
    }
    //int pixelCount = (brPoint.x - tlPoint.x) * (brPoint.y - tlPoint.y);
    return alpha/loopCount;
}


@end
