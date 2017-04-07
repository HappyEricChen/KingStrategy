//
//  HeroInfoTableViewCell.m
//  TheKingOfHero
//
//  Created by jamesczy on 2017/4/7.
//  Copyright © 2017年 jamesczy. All rights reserved.
//

#import "HeroInfoTableViewCell.h"

@interface HeroInfoTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *breviaryImage;
@property (weak, nonatomic) IBOutlet UILabel *dataTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *leaveBtn;
@property (weak, nonatomic) IBOutlet UIButton *attentionBtn;

@end

@implementation HeroInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.leaveBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:5];
    [self.attentionBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:5];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
