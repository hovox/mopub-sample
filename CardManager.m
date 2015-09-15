//
//  CardManager.m
//  MoPub native ad test
//
//  Created by Hovhannes Safaryan on 9/15/15.
//  Copyright © 2015 PicsArt. All rights reserved.
//

#import "CardManager.h"
#import "UIColor+Additions.h"

@interface CardManager()
@property(nonatomic) UIColor *bgColor;
@end

@implementation CardManager

-(UIColor *)bgColor {
    if (_bgColor == nil) {
        _bgColor = [UIColor randomColor];
    }
    return _bgColor;
}

-(CGFloat)cardHeight {
    return 400;
}

-(void)setView:(UIView *)view {
    _view = view;
    if (_view != nil) {
        //setup view
    }
    _view.backgroundColor = self.bgColor;
}

@end
