//
//  FeedCell.m
//  MoPub native ad test
//
//  Created by Hovhannes Safaryan on 9/15/15.
//  Copyright © 2015 PicsArt. All rights reserved.
//

#import "FeedCell.h"

@implementation FeedCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 150, 60)];
    lbl.text = @"Feed simple cell";
    [self addSubview:lbl];
    return self;
}

@end
