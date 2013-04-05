//
//  DCViewController.m
//  MobileConf
//
//  Created by Diego Chohfi on 4/4/13.
//  Copyright (c) 2013 Diego Chohfi. All rights reserved.
//

#import "DCViewController.h"
#import "DCCustomCell.h"

@interface  DCViewController()
@property(nonatomic, strong) NSMutableArray *tweets;

@end
@implementation DCViewController

- (void)carregarTweets {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"tweets" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    self.tweets = [NSJSONSerialization JSONObjectWithData:jsonData
                                                  options:NSJSONReadingMutableContainers
                                                    error:nil];
}
- (void)registarTableViewCellCustomizada {
    UINib *customNib = [UINib nibWithNibName:@"DCCustomCell"
                                      bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"DCCustomCell"];
}
- (void)viewDidLoad {
    [self carregarTweets];
    [self registarTableViewCellCustomizada];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DCCustomCell *cell = (DCCustomCell *)[tableView dequeueReusableCellWithIdentifier:@"DCCustomCell"];
    
    NSDictionary *tweet = self.tweets[indexPath.row];
    [cell setTweetData:tweet];
    return cell;
}
@end
