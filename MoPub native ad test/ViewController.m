//
//  ViewController.m
//  MoPub native ad test
//
//  Created by Hovhannes Safaryan on 9/15/15.
//  Copyright © 2015 PicsArt. All rights reserved.
//

#import "ViewController.h"
#import "FeedCell.h"
#import "AdCell.h"
#import "CardManager.h"
#import "AdCardManager.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic) NSArray<CardManager *> *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *feedTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    feedTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    feedTableView.dataSource = self;
    feedTableView.delegate = self;
    
    [feedTableView registerClass:[FeedCell class] forCellReuseIdentifier:@"feed"];
    [feedTableView registerClass:[AdCell class] forCellReuseIdentifier:@"ad"];
    
    [self.view addSubview:feedTableView];
    
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:100];
    //add ad in every 5 item
    for (int i = 0; i < 100; i++) {
        if (i % 5 == 0) {
            //ad cell here
            [data addObject:[[AdCardManager alloc] init]];
        } else {
            [data addObject:[[CardManager alloc] init] ];
        }
    }
    self.data = [data copy];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.data[indexPath.row].cardHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *resultCell = nil;
    if ([self.data[indexPath.row] isKindOfClass:[AdCardManager class]]) {
        AdCardManager *adCardManager = (AdCardManager *)self.data[indexPath.row];
        AdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ad" forIndexPath:indexPath];
        ((CardCell *)adCardManager.view).cardManager = nil;
        cell.cardManager = adCardManager;
        resultCell = cell;
    } else {
        CardManager *feedCardManager = self.data[indexPath.row];
        FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feed" forIndexPath:indexPath];
        ((CardCell *)feedCardManager.view).cardManager = nil;
        cell.cardManager = feedCardManager;
        resultCell = cell;
    }
    
    return resultCell;
}

@end
