//
//  UIButton+Layout.m
//  DDButton
//
//  Created by Think on 2017/9/18.
//  Copyright © 2017年 Think. All rights reserved.
//

#import "UIButton+Layout.h"
#import <objc/runtime.h>

@implementation UIButton (Layout)

#pragma mark 通过运行时动态添加关联

static const char * titleRectKey = "dd_titleRectKey";

static const char * imageRectKey = "dd_imageRectKey";

- (CGRect)titleRect
{
    return [objc_getAssociatedObject(self, titleRectKey) CGRectValue];
}

- (void)setTitleRect:(CGRect)titleRect
{
    objc_setAssociatedObject(self, titleRectKey, [NSValue valueWithCGRect:titleRect], OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)imageRect
{
    return [objc_getAssociatedObject(self, imageRectKey) CGRectValue];
}

- (void)setImageRect:(CGRect)imageRect
{
    objc_setAssociatedObject(self, imageRectKey, [NSValue valueWithCGRect:imageRect], OBJC_ASSOCIATION_RETAIN);
}

#pragma mark 通过运行时更换方法
+ (void)load
{
    MethodSwizzle(self, @selector(titleRectForContentRect:), @selector(dd_titleRectForContentRect:));
    
    MethodSwizzle(self, @selector(imageRectForContentRect:), @selector(dd_imageRectForContentRect:));
}

void MethodSwizzle(Class class,SEL oldSel,SEL newSel)
{
    Method oldMethod = class_getInstanceMethod(class,oldSel);
    Method newMehtod = class_getInstanceMethod(class,newSel);
    method_exchangeImplementations(oldMethod, newMehtod);
}

- (CGRect)dd_titleRectForContentRect:(CGRect)contentRect
{
    if (!CGRectIsEmpty(self.titleRect)) {
        return self.titleRect;
    }
    return [self dd_titleRectForContentRect:contentRect];
}

- (CGRect)dd_imageRectForContentRect:(CGRect)contentRect
{
    if (!CGRectIsEmpty(self.imageRect)) {
        return self.imageRect;
    }
    return [self dd_imageRectForContentRect:contentRect];
}
@end
