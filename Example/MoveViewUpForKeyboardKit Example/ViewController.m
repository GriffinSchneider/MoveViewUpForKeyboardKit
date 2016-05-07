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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    build_subviews(self.view) {
        MVUFKKView *add_subview(keyboardView) {};
        UITextField *add_subview(textfield) {
            _.text = @"Select me!";
            _.make.left.and.right.equalTo(superview);
        };
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
