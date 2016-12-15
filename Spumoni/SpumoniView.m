//
//  SpumoniView.m
//  Spumoni
//
//  Created by Mario Diana on 12/15/16.
//  Copyright © 2016 Mario Diana. All rights reserved.
//

#import "SpumoniView.h"

@interface SpumoniView ()
@property (nonatomic, strong) NSMutableArray *constraints;
@end

@implementation SpumoniView

- (void)dealloc
{
    self.constraints = nil;
}


- (id)init
{
    return [self initWithFrame:CGRectMake(0, 0, 0, 0)];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.constraints = [NSMutableArray array];
    }
    
    return self;
}


- (void)addChocolate:(UIView *)chocolate cherry:(UIView *)cherry pistachio:(UIView *)pistachio;
{
    [self removeConstraints:[self constraints]];
    [[self constraints] removeAllObjects];
    
    for (UIView *subview in [self subviews]) {
        [subview removeFromSuperview];
    }
    
    [self addSubview:chocolate];
    [chocolate setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:cherry];
    [cherry setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:pistachio];
    [pistachio setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self constrainViewToTop:chocolate];
    [self constrainViewToSides:chocolate];
    
    [self constrainView:cherry underView:chocolate];
    [self constrainViewToSides:cherry];
    
    [self constrainView:pistachio underView:cherry];
    [self constrainViewToSides:pistachio];
    [self constrainViewToBottom:pistachio];
    
    [self constrainDimensionsOfView:chocolate equalToView:cherry];
    [self constrainDimensionsOfView:cherry equalToView:pistachio];
    
    [NSLayoutConstraint activateConstraints:[self constraints]];
}


#pragma mark - NSAutoLayoutConstraint methods


- (void)constrainViewToTop:(UIView *)aView
{
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:aView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0.0];
    
    [[self constraints] addObject:top];
}


- (void)constrainViewToSides:(UIView *)aView
{
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:aView
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self
                                                               attribute:NSLayoutAttributeLeading
                                                              multiplier:1.0
                                                                constant:0.0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:aView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0.0];
    
    [[self constraints] addObjectsFromArray:@[leading, trailing]];

}


- (void)constrainView:(UIView *)aView underView:(UIView *)above
{
    NSLayoutConstraint *under = [NSLayoutConstraint constraintWithItem:aView
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:above
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:0.0];
    
    [[self constraints] addObject:under];
}


- (void)constrainViewToBottom:(UIView *)aView
{
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:aView
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:0.0];
    
    [[self constraints] addObject:bottom];
}


- (void)constrainDimensionsOfView:(UIView *)first equalToView:(UIView *)second
{
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:first
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:second
                                                              attribute:NSLayoutAttributeHeight
                                                             multiplier:1.0
                                                               constant:0.0];
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:first
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:second
                                                              attribute:NSLayoutAttributeWidth
                                                             multiplier:1.0
                                                               constant:0.0];
    
    [[self constraints] addObjectsFromArray:@[height, width]];
}


@end
