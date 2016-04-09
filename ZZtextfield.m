//
//  ZZtextfield.m
//  ZBarScanProj
//
//  Created by ivy.sun on 16/4/9.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "ZZtextfield.h"

@implementation ZZtextfield 


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    [self setup];
        
}
    return self;
    
}


-(void)awakeFromNib
{
     [self setup];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    _lineHeight = 1;
    _line = [[UIView alloc]init];
    _line.backgroundColor = [UIColor grayColor];
    [self addSubview:_line];
    self.delegate = self;
}

-(void)setLineColor:(UIColor *)lineColor
{
    _line.backgroundColor = lineColor;
}

-(void)setLineHeight:(float)lineHeight
{
    CGRect frame = _line.frame;
    frame.size.height = lineHeight;
    _line.frame = frame;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _line.frame = CGRectMake(0, self.frame.size.height - self.lineHeight , self.frame.size.width, self.lineHeight);
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.lineHeight  =  2;
    self.lineColor  = [UIColor greenColor];
    [self setNeedsLayout];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.lineHeight  =  1;
    self.lineColor  = [UIColor grayColor];
    [self setNeedsLayout];
}
@end
