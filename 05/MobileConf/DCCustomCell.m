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

@property (nonatomic, strong) NSDictionary *twitterData;
@property (nonatomic, weak) UIImageView *avatar;

@end

@implementation DCCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *avatar = [[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 55, 55)];
        [self.contentView addSubview:avatar];
        self.avatar = avatar;
        self.contentView.opaque = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void) setTweetData: (NSDictionary *) tweet {
    self.twitterData = tweet;
    NSURL *userAvatarUrl = [NSURL URLWithString:self.twitterData[@"user"][@"profile_image_url"]];
    [self.avatar setImageWithURL:userAvatarUrl];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    NSDictionary *user = self.twitterData[@"user"];
    
    [user[@"name"] drawAtPoint:CGPointMake(72, 7)
                      forWidth:111
                      withFont:[UIFont boldSystemFontOfSize:17]
                 lineBreakMode:NSLineBreakByTruncatingTail];
    
    [user[@"screen_name"] drawAtPoint:CGPointMake(186, 7)
                             forWidth:114
                             withFont:[UIFont systemFontOfSize:14]
                        lineBreakMode:NSLineBreakByTruncatingTail];
    
    CGSize textSize = [self.twitterData[@"text"] sizeWithFont:[UIFont systemFontOfSize:17]
                                 constrainedToSize:CGSizeMake(228, 9999)];
    [self.twitterData[@"text"] drawInRect:CGRectMake(72, 41, textSize.width, textSize.height)
                                 withFont:[UIFont systemFontOfSize:17]];
}
@end
