//
//  AdCardManager.m
//  MoPub native ad test
//
//  Created by Hovhannes Safaryan on 9/15/15.
//  Copyright © 2015 PicsArt. All rights reserved.
//

#import "AdCardManager.h"
#import "MPNativeAd.h"
#import "MPNativeAdRequest.h"
#import "AdCell.h"
#import "MPNativeAdRequestTargeting.h"
#import "MPNativeAdConstants.h"
#import "MPNativeAdError.h"
#import "MPNativeAdRequest.h"
#import "MPNativeAdRequest+MPNativeAdSource.h"
#import "MPNativeAdDelegate.h"

static NSTimeInterval const kCacheInterval = 300;

static int sequence = 1;


@interface AdCardManager ()

@property (nonatomic) MPNativeAd *nativeAd;
@property (nonatomic) BOOL loadingAd;
@property (nonatomic) NSDate *lastUpdateTime;

@end

@implementation AdCardManager

-(CGFloat)cardHeight {
    return 250;
}

-(void)setView:(UIView *)view {
    [super setView:view];
    if (view == nil) {
        //resource cleanup here
    } else {
        [self setupAd];
    }
}

- (void)setNativeAd:(MPNativeAd *)nativeAd {
    _nativeAd = nativeAd;
//    _nativeAd.delegate = self;
    
    if (nativeAd != nil) {
        self.lastUpdateTime = [NSDate date];
    }
    
    [self setupAd];
}

-(BOOL)adIsTooOld {
    if (self.lastUpdateTime == nil) {
        return YES;
    }
    
    NSDate *now = [NSDate date];
    
    return fabs([now timeIntervalSinceDate:self.lastUpdateTime]) > kCacheInterval;
}

-(void)setupAd {
    if (self.nativeAd == nil || [self adIsTooOld]) {
        _nativeAd = nil;
        //reseting ad view
        AdCell *adCardView = (AdCell *)self.view;
        adCardView.loading = YES;
        
        
        __weak AdCardManager *weakSelf = self;
        [self loadAdWithCompletion:^(MPNativeAd *nativeAd) {
            weakSelf.nativeAd = nativeAd;
        }];
        
    }else {
        [self showAd];
    }
}

-(void)loadAdWithCompletion:(void (^)(MPNativeAd *nativeAd))loadCompletion {
    
    if (self.loadingAd) {
        return;
    }
    
    self.loadingAd = YES;
    
    MPNativeAdRequest *adRequest = [MPNativeAdRequest requestWithAdUnitIdentifier:@"76a3fefaced247959582d2d2df6f4757"];
    MPNativeAdRequestTargeting *targeting = [MPNativeAdRequestTargeting targeting];
    targeting.desiredAssets = [NSSet setWithObjects:kAdIconImageKey, kAdMainImageKey, kAdCTATextKey, kAdTextKey, kAdTitleKey, nil];
    adRequest.targeting = targeting;
    __weak AdCardManager *weakSelf = self;
    [adRequest startForAdSequence:sequence
            withCompletionHandler:^(MPNativeAdRequest *request, MPNativeAd *response, NSError *error) {
                weakSelf.loadingAd = NO;
                if (response && !error) {
                    sequence++;
                    loadCompletion(response);
                } else {
                    NSLog(@"ERROR while loading native ad %@", error);
                    //increment in this failure case to prevent retrying a request that wasn't bid on.
                    //currently under discussion on whether we do this or not.
                    if (error.code == MPNativeAdErrorNoInventory) {
                        sequence++;

                    }
                }
            }];
}

-(void)showAd {
    if (self.view != nil) {
        AdCell *adCardView = (AdCell *)self.view;
        adCardView.loading = NO;
        [self.nativeAd prepareForDisplayInView:adCardView];
    }
}


@end
