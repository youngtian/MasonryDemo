//
//  ViewController.m
//  MasonryDemo
//
//  Created by tianyaxu on 16/11/25.
//  Copyright © 2016年 tianyaxu. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "UpdateConstraintsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self method1];
//    [self method2];
//    [self method3];
//    [self method4];
//    [self method5];
//    [self method6];
//    [self method7];
    [self method8];
}

- (void)method8 {
    UpdateConstraintsView *vc = [[UpdateConstraintsView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:vc];
}

- (void)method7 {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(redView);
        make.left.equalTo(redView.mas_right).offset(10);
        make.right.equalTo(yellowView.mas_left).offset(-10);
        make.bottom.equalTo(redView);
    }];
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(redView);
        make.bottom.equalTo(redView);
    }];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(redView);
        make.bottom.equalTo(redView);
        make.left.equalTo(yellowView.mas_right).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
    }];
}

- (void)method6 {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.top.equalTo(self.view.mas_top).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(redView);
        make.width.equalTo(redView.mas_width).multipliedBy(0.5);
        make.top.equalTo(redView.mas_bottom).offset(20);
        make.right.equalTo(redView);
    }];
}

- (void)method5 {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(redView);
        make.bottom.equalTo(redView);
        make.left.equalTo(redView.mas_right).offset(20);
        make.right.equalTo(yellowView.mas_left).offset(-20);
    }];
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(redView);
        make.bottom.equalTo(redView);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
}

- (void)method4 {
    
    UIView *sv = [[UIView alloc] init];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor whiteColor];
    [sv addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UIView *container = [[UIView alloc] init];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    UIView *lastView = nil;
    for (int i = 1; i <= count; i ++) {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0) saturation:(arc4random() % 256 / 256.0) brightness:(arc4random() % 256 / 256.0) alpha:1];
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(20 * i);
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            } else {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        lastView = subv;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}

- (void)method3 {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.tag = 300;
    [self.view addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.2);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.left.equalTo(self.view.mas_left).offset(20);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(redView);
        make.left.equalTo(redView.mas_right).offset(20);
        make.bottom.equalTo(redView);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(redView);
        make.left.equalTo(greenView.mas_right).offset(20);
        make.bottom.equalTo(redView);
        make.left.equalTo(redView.mas_right).offset(20).priority(1);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIView *greenView = [self.view viewWithTag:300];
    [greenView removeFromSuperview];
    [UIView animateWithDuration:2.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)method2 {
    UIView *redView1 = [[UIView alloc] init];
    redView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView1];
    
    UIView *redView2 = [[UIView alloc] init];
    redView2.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView2];
    
    UIView *grayView1 = [[UIView alloc] init];
    grayView1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView1];
    
    UIView *grayView2 = [[UIView alloc] init];
    grayView2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView2];
    
    UIView *grayView3 = [[UIView alloc] init];
    grayView3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView3];
    
    //灰色试图高20，宽不固定，距离底部50
    [grayView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading);//灰色1视图和父视图左边相同
        make.height.mas_equalTo(20);
        make.bottom.equalTo(redView1.mas_bottom);
    }];
    
    //红色视图宽高为100，50，距离底部50
    [redView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        make.left.equalTo(grayView1.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50); //距离底部50
    }];
    
    [grayView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(grayView1);
        make.left.equalTo(redView1.mas_right);
        make.bottom.equalTo(redView1.mas_bottom);
    }];
    
    [redView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(redView1);
        make.bottom.equalTo(redView1);
        make.left.equalTo(grayView2.mas_right);
        make.bottom.equalTo(redView1);
    }];
    
    [grayView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(grayView1);
        make.trailing.equalTo(self.view.mas_trailing);
        make.left.equalTo(redView2.mas_right);
        make.bottom.equalTo(redView1.mas_bottom);
    }];
}

- (void)method1 {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    __weak typeof(self) weakSelf = self;
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(weakSelf.view.mas_width).multipliedBy(0.5); //设置宽度为self.view的宽度的一半
        make.height.mas_equalTo(weakSelf.view.mas_height).multipliedBy(0.5); //设置高度为self.view的高度的一半
        make.left.equalTo(weakSelf.view.mas_left).offset(0); //使左边等于self.view的左边，间距为0
        make.top.equalTo(weakSelf.view.mas_top).offset(0); //使顶部与self.view的间距为0
        
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(redView); //使宽高等于redView
        make.top.equalTo(redView.mas_top); //与redView顶部对齐
        make.leading.equalTo(redView.mas_trailing); //与redView的间距为0
    }];
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(redView);
        make.leading.equalTo(redView);
        make.top.equalTo(redView.mas_bottom);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(redView);
        make.left.equalTo(yellowView.mas_right);
        make.top.equalTo(blueView.mas_bottom);
    }];
    
    NSLog(@"%@", NSStringFromCGRect(redView.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
