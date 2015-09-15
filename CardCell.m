//
//  CardCell.m
//  MoPub native ad test
//
//  Created by Hovhannes Safaryan on 9/15/15.
//  Copyright © 2015 PicsArt. All rights reserved.
//

#import "CardCell.h"
#import "CardManager.h"

@implementation CardCell

-(void)setCardManager:(CardManager *)cardManager {
    _cardManager.view = nil;
    _cardManager = cardManager;
    _cardManager.view = self;
}

@end
