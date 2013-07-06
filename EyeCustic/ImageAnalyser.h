//
//  ImageAnalyser.h
//  EyeCustic
//
//  Created by Pascal Rauprecht on 06.07.13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageAnalyser : NSObject

-(int)imageInfoFromImagePart:(UIImage *)image inRect:(CGRect)rect;

@end
