//
//  ViewController.m
//  MoveViewUpForKeyboardKit Example
//
//  Created by Griffin Schneider on 5/7/16.
//  Copyright © 2016 Griffin Schneider. All rights reserved.
//

#import "ViewController.h"

#import <MoveViewUpForKeyboardKit/MVUFKKView.h>
#import <DRYUI/DRYUI.h>

@interface ViewController ()

@property (nonatomic, strong) MVUFKKView *keyboardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    build_subviews(self.view) {
        add_subview(self.keyboardView){};
        UITextField *add_subview(textfield) {
            _.text = @"Select me!";
            _.make.left.and.right.equalTo(superview);
            _.make.bottom.equalTo(self.keyboardView);
        };
    };
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.keyboardView.enabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.keyboardView.enabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
