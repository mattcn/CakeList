//
//  CLCake.h
//  Cake List
//
//  Cake data model with create factory methods
//
//  Created by Huajie Wang on 08/04/2018.
//  Copyright © 2018 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLCake : NSObject
@property (strong,nonatomic) NSString* title;
@property (strong,nonatomic) NSString* desc;
@property (strong,nonatomic) NSString* imageStr;

+(id) create;

+(id) createWithTitle:(NSString*) _title Description:(NSString*) _desc andImage:(NSString*) _img;
@end
