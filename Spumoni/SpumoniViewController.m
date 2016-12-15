//
//  ViewController.m
//  Spumoni
//
//  Created by Mario Diana on 12/15/16.
//  Copyright © 2016 Mario Diana. All rights reserved.
//

#import "SpumoniViewController.h"
#import "SpumoniView.h"

@interface SpumoniViewController ()

@end

@implementation SpumoniViewController

- (void)dealloc
{
    self.view = nil;
}

- (void)loadView
{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    SpumoniView *view = [[SpumoniView alloc] initWithFrame:[window bounds]];
    [view setBackgroundColor:[UIColor whiteColor]];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SpumoniView *spumoni = (SpumoniView *)[self view];
    [self createSpumoni:spumoni];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createSpumoni:(SpumoniView *)spumoni
{
    UIView *chocolate = [[UIView alloc] init];
    [chocolate setBackgroundColor:[self chocolate]];
    
    UIView *cherry = [[UIView alloc] init];
    [cherry setBackgroundColor:[self cherry]];
    
    UIView *pistachio = [[UIView alloc] init];
    [pistachio setBackgroundColor:[self pistachio]];
    
    [spumoni addChocolate:chocolate cherry:cherry pistachio:pistachio];
}


- (UIColor *)chocolate
{
    return [UIColor colorWithRed:107/255.0 green:62/255.0 blue:38/255.0 alpha:1.0f];
}


- (UIColor *)cherry
{
    return [UIColor colorWithRed:255/255.0 green:197/255.0 blue:217/255.0 alpha:1.0];
}


- (UIColor *)pistachio
{
    return [UIColor colorWithRed:194/255.0 green:242/255.0 blue:208/255.0 alpha:1.0];
}

@end
