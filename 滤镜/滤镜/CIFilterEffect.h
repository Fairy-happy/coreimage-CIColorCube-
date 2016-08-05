//
//  CIFilterEffect.h
//  滤镜
//
//  Created by fairy on 16/7/29.
//  Copyright © 2016年 fairy. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CIFilterEffect : NSObject
@property (nonatomic, strong, readonly) UIImage *result;

- (instancetype)initWithImage:(UIImage *)image filterName:(NSString *)name;

@end
