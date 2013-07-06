//
//  ImageAnalyser.m
//  EyeCustic
//
//  Created by Pascal Rauprecht on 06.07.13.
//  Copyright (c) 2013 iOS Meetup. All rights reserved.
//

#import "ImageAnalyser.h"

@implementation ImageAnalyser

-(int)imageInfoFromImagePart:(UIImage *)image inRect:(CGRect)rect{
    
    CFDataRef pixelData = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage));
    
    const UInt8* data = CFDataGetBytePtr(pixelData);
    
    int alphaSum = 0;
    
    NSMutableArray *intCarrierSource = [[NSMutableArray alloc] init];
    
    for(int i = rect.origin.y * image.size.width;i <= (rect.origin.y + rect.size.height) * image.size.width;i++){
        
        [intCarrierSource addObject:@(i)];
        
    };
    
    
    
    NSMutableArray *targetPixels = [[NSMutableArray alloc] init];
    
    
    
    for (int i=0; i<rect.size.height; i++) {
        
        NSRange tmpRange = NSMakeRange(i*image.size.width + rect.origin.x , rect.size.width);
        
        NSLog(@"range %i: %@",i,NSStringFromRange(tmpRange));
        
        NSArray *tmpArray = [intCarrierSource subarrayWithRange:tmpRange];
        
        [targetPixels addObjectsFromArray:tmpArray];
        
    }
    
    
    
    NSLog(@"NSARRAY: %@",targetPixels);
    
    for (NSNumber* pixel in targetPixels) {
        
         //NSLog(@"alpha: %i",data[([pixel intValue] *4 + 3)]);
        
        alphaSum += data[([pixel intValue] *4 + 2)];
        
    }
    
    
    
    int averageAlpha = alphaSum/[targetPixels count];
    
    
    
    return averageAlpha;
    
}




@end
