//
//  UpdateConstraintsView.m
//  MasonryDemo
//
//  Created by tianyaxu on 16/11/25.
//  Copyright © 2016年 tianyaxu. All rights reserved.
//

#import "UpdateConstraintsView.h"
#import <Masonry.h>

@interface UpdateConstraintsView()

@property (nonatomic, strong) UIButton *myButton;
@property (nonatomic, assign) CGSize buttonSize;

@end

@implementation UpdateConstraintsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _myButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_myButton setTitle:@"更新约束" forState:UIControlStateNormal];
        _myButton.layer.borderColor = [UIColor blackColor].CGColor;
        _myButton.layer.borderWidth = 2;
        _myButton.backgroundColor = [UIColor brownColor];
        [_myButton addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_myButton];
        self.buttonSize = CGSizeMake(100, 100);
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    [self.myButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(self.buttonSize.width)).priorityHigh();
        make.height.equalTo(@(self.buttonSize.height)).priorityHigh();
        make.width.lessThanOrEqualTo(self);
        make.height.lessThanOrEqualTo(self);
    }];
    [super updateConstraints];
}

- (void)changeAction:(UIButton *)btn {
    self.buttonSize = CGSizeMake(self.buttonSize.width * 1.2, self.buttonSize.height * 1.2);
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
