//
//  UIImage+ImageCache.m
//  Cake List
//
//  Created by Huajie Wang on 08/04/2018.
//  Copyright © 2018 Stewart Hart. All rights reserved.
//

#import "UIImage+ImageCache.h"

@implementation UIImage (ImageCache)

#define kCacheMemoryCapacity 40
#define kCacheDiskCapacity 10

static NSCache* cachedImages;

+(void) useImageCache{
    // due to time limiation, only for the memory cache by using NSCache, no disk cache etc.
    cachedImages = [[NSCache alloc] init];
    
    NSURLCache *urlCache = [[NSURLCache alloc] initWithMemoryCapacity:kCacheMemoryCapacity
                                                         diskCapacity:kCacheMemoryCapacity
                                                             diskPath:nil];
    [NSURLCache setSharedURLCache:urlCache];
}


+(UIImage*) cachedImageByURLStr:(NSString*) urlStr {
    UIImage* cachedImage = [cachedImages objectForKey:urlStr];
    return cachedImage;
}

+(void) setCacheImage:(UIImage*) img withURLStr:(NSString*) urlStr {
    [cachedImages setObject:img forKey:urlStr];
}

@end
