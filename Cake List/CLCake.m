//
//  CLCake.m
//  Cake List
//
//  Created by Huajie Wang on 08/04/2018.
//  Copyright © 2018 Stewart Hart. All rights reserved.
//

#import "CLCake.h"

@implementation CLCake

+(id) create {
    return [[CLCake alloc] init];
}
+(id) createWithTitle:(NSString*) _title Description:(NSString*) _desc andImage:(NSString*) _img {
    CLCake* instance = [CLCake create];
    instance.title = _title;
    instance.desc = _desc;
    instance.imageStr = _img;
    return instance;
}

@end
