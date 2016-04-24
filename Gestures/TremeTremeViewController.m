//
//  TremeTremeViewController.m
//  Gestures
//
//  Created by Marcos Felipe Souza on 20/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "TremeTremeViewController.h"
#import "TremeTremeView.h"

@interface TremeTremeViewController ()

@end

@implementation TremeTremeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self criarTremeTremeView:CGPointMake(50, 50) comCor:[UIColor redColor]];
    [self criarTremeTremeView:CGPointMake(200, 150) comCor:[UIColor blueColor]];
    [self criarTremeTremeView:CGPointMake(110, 250) comCor:[UIColor purpleColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) criarTremeTremeView: (CGPoint) posicao comCor:(UIColor *) cor {
    CGRect r = CGRectMake(posicao.x, posicao.y, 60, 60);
    TremeTremeView *t = [[TremeTremeView alloc]initWithFrame:r];
    t.backgroundColor = cor;
    [self.view addSubview:t];
}



@end
