//
//  UIImage+ImageCache.h
//  Cake List
//
//  Created by Huajie Wang on 08/04/2018.
//  Copyright © 2018 Stewart Hart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageCache)

/**
 init the image cache before using
 */
+(void) useImageCache;

/**
 get a cached UIImage by string of URL, return nil if not found.
 */
+(UIImage*) cachedImageByURLStr:(NSString*) urlStr;

/**
 put the existing image into cache with url string as a key
 
 @param img UIImage data
 @param urlStr string of the image url
 */
+(void) setCacheImage:(UIImage*) img withURLStr:(NSString*) urlStr;

@end
