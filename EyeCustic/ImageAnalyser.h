//
//  ImageAnalyser.h
//  EyeCustic
//
//  Created by Pascal Rauprecht on 06.07.13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageAnalyser : NSObject

- (int)areaValueFor: (UIImage *)image topLeftPoint:(CGPoint)tlPoint andBottomRightPoint:(CGPoint)brPoint;

- (NSArray*)pixelValueFor: (UIImage *)image AtXLocation: (int) x andYLocation:(int) y;

@end
