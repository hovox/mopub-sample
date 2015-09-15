//
//  AdCell.h
//  MoPub native ad test
//
//  Created by Hovhannes Safaryan on 9/15/15.
//  Copyright © 2015 PicsArt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardCell.h"
#import "MPNativeAdRendering.h"

@import UIKit;

@interface AdCell : CardCell<MPNativeAdRendering>

@property(nonatomic) BOOL loading;

@end
