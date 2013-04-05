//
//  DCCustomCell.m
//  MobileConf
//
//  Created by Diego Chohfi on 4/5/13.
//  Copyright (c) 2013 Diego Chohfi. All rights reserved.
//

#import "DCCustomCell.h"
#import "UIImageView+WebCache.h"

@interface DCCustomCell()

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *tweet;


@end

@implementation DCCustomCell
- (void) setTweetData: (NSDictionary *) tweet {
    NSDictionary *user = tweet[@"user"];
    [self.avatar setImageWithURL:[NSURL URLWithString:user[@"profile_image_url"]]];
    
    self.fullName.text = user[@"name"];
    self.userName.text = user[@"screen_name"];
    self.tweet.text = tweet[@"text"];
}
@end
