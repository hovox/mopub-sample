//
//  AdCell.m
//  MoPub native ad test
//
//  Created by Hovhannes Safaryan on 9/15/15.
//  Copyright © 2015 PicsArt. All rights reserved.
//

#import "AdCell.h"

@implementation AdCell {
    UIImageView *_imageView;
    
    UILabel *_loadingLbl;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_imageView];
    
    
    _loadingLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 150, 60)];
    _loadingLbl.text = @"Loading ad";
    [self addSubview:_loadingLbl];
    return self;
}

-(void)setLoading:(BOOL)loading {
    _loading = loading;
    
    if (loading) {
        _loadingLbl.hidden = NO;
        _imageView.hidden = YES;
    }else {
        _loadingLbl.hidden = YES;
        _imageView.hidden = NO;
    }
}

- (void)layoutAdAssets:(MPNativeAd *)adObject {
    
    [adObject loadImageIntoImageView:_imageView];
    
    [self setNeedsLayout];
}

@end
