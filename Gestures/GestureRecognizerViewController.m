//
//  GestureRecognizerViewController.m
//  Gestures
//
//  Created by Marcos Felipe Souza on 20/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "GestureRecognizerViewController.h"
#import "TapCirculoView.h"

@interface GestureRecognizerViewController ()

@end

@implementation GestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView {
    TapCirculoView *c = [TapCirculoView new];
    c.backgroundColor = [UIColor whiteColor];
    self.view = c ;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
