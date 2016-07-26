//
//  MVUFKKView.m
//  MoveViewUpForKeyboardKit
//
//  Created by Griffin Schneider on 5/7/16.
//  Copyright © 2016 Griffin Schneider. All rights reserved.
//

#import "MVUFKKView.h"



////////////////////////////////////////////////////////////////////////////////////////////////////
@protocol MVUFKKKeyboardListener <NSObject>
- (void)keyboardFrameWillChangeToFrame:(CGRect)frame withAnimationDuration:(NSTimeInterval)duration andAnimationCurve:(UIViewAnimationCurve)curve;
@end



////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MVUFKKKeyboardManager: NSObject
@property (nonatomic) CGRect keyboardFrame;
@property (nonatomic, strong) NSHashTable<id<MVUFKKKeyboardListener>> *listeners;
@end

static MVUFKKKeyboardManager *managerInstance;

@implementation MVUFKKKeyboardManager
+ (void)load {
    managerInstance = [self new];
    managerInstance.listeners = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    managerInstance.keyboardFrame = CGRectMake(0, 99999, 0, 0);
    [[NSNotificationCenter defaultCenter] addObserver:managerInstance selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)keyboardFrameWillChange:(NSNotification *)notification {
    self.keyboardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue];
    for (id<MVUFKKKeyboardListener> listener in self.listeners) {
        [listener keyboardFrameWillChangeToFrame:self.keyboardFrame withAnimationDuration:animationDuration andAnimationCurve:animationCurve];
    }
}
- (void)addListener:(id<MVUFKKKeyboardListener>)listener {
    if (![self.listeners containsObject:listener]) {
        [self.listeners addObject:listener];
        [listener keyboardFrameWillChangeToFrame:self.keyboardFrame withAnimationDuration:0 andAnimationCurve:0];
    }
}
@end



////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MVUFKKView () <MVUFKKKeyboardListener>
@property (nonatomic, strong) NSLayoutConstraint *constraint;
@end

@implementation MVUFKKView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void)didMoveToSuperview {
    [managerInstance addListener:self];
}

- (void)keyboardFrameWillChangeToFrame:(CGRect)frame withAnimationDuration:(NSTimeInterval)duration andAnimationCurve:(UIViewAnimationCurve)curve {
    if (!self.enabled) return;
    
    if (!self.constraint) {
        self.constraint =
        [NSLayoutConstraint
         constraintWithItem:self.superview
         attribute:NSLayoutAttributeBottom
         relatedBy:NSLayoutRelationEqual
         toItem:self
         attribute:NSLayoutAttributeBottom
         multiplier:1.0f
         constant:0.0f];
        [self.superview addConstraint:self.constraint];
    }
    
    CGFloat superViewHeight = self.superview.frame.size.height;
    CGFloat keyboardY = [self.superview convertRect:frame fromView:nil].origin.y;
    CGFloat newConstant = MAX(superViewHeight - keyboardY, 0);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:NO];
    
    self.constraint.constant = newConstant;
    
    [self.superview layoutIfNeeded];
    [UIView commitAnimations];
}

- (void)setEnabled:(BOOL)enabled {
    if (enabled) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _enabled = YES;
            [self keyboardFrameWillChangeToFrame:managerInstance.keyboardFrame
                           withAnimationDuration:0
                               andAnimationCurve:UIViewAnimationCurveLinear];
        });
    } else {
        _enabled = NO;
    }
}

- (CGSize)intrinsicContentSize {
    return CGSizeZero;
}

@end
