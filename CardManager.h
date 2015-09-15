//
//  CardManager.h
//  MoPub native ad test
//
//  Created by Hovhannes Safaryan on 9/15/15.
//  Copyright © 2015 PicsArt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardData.h"
@import UIKit;

@interface CardManager : NSObject

@property(nonatomic) CardData *cardData;
@property(nonatomic) UIView *view;

@property(nonatomic) CGFloat cardHeight;

@end
