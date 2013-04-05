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
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?screen_name=dchohfi"];
//        NSData *jsonData = [NSData dataWithContentsOfURL:url];
//        self.tweets = [NSJSONSerialization JSONObjectWithData:jsonData
//                                                      options:NSJSONReadingMutableContainers
//                                                        error:nil];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    });
}
- (void)registarTableViewCellCustomizada {
    [self.tableView registerClass:[DCCustomCell class]
           forCellReuseIdentifier:@"DCCustomCell"];
}
- (void)viewDidLoad {
    [self carregarTweets];
    [self registarTableViewCellCustomizada];
    self.tableView.rowHeight = 70;
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
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *tweet = self.tweets[indexPath.row];
    
    CGFloat heigth = [tweet[@"text"] sizeWithFont:[UIFont systemFontOfSize:17]
                                constrainedToSize:CGSizeMake(228, 9999)].height;
    
    heigth += 41;
    return heigth > 70 ? heigth : 70;
}
@end
