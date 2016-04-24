//
//  ViewController.m
//  Gestures
//
//  Created by Marcos Felipe Souza on 20/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "ViewController.h"
#import "CirculoView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadView {
    CirculoView *c = [[CirculoView alloc] init];
    c.backgroundColor = [UIColor whiteColor];
    self.view = c;
}
@end
