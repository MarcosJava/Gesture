//
//  GestoSwipeViewController.m
//  Gestures
//
//  Created by Marcos Felipe Souza on 21/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "GestoSwipeViewController.h"

@interface GestoSwipeViewController ()

@end

@implementation GestoSwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self criaQuadrado];
    [self registraGestos];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) criaQuadrado {
    quadrado = [[UIView alloc]
                initWithFrame:CGRectMake(100, 100, 100, 100)];
    quadrado.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:quadrado];
}

-(void) registraGestos {
    
    [self adicionarGesto:UISwipeGestureRecognizerDirectionRight];
    [self adicionarGesto:UISwipeGestureRecognizerDirectionLeft];
}

-(void) adicionarGesto: (UISwipeGestureRecognizerDirection *) direcao {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(jogaQuadrado:)];
    swipe.direction = direcao;
    [self.view addGestureRecognizer:swipe];
    
}

-(void) jogaQuadrado: (UIGestureRecognizer *) gesto {
    
    CGPoint location = [gesto locationInView:quadrado];
    if ([quadrado pointInside:location withEvent:nil]) {
        
        UISwipeGestureRecognizer *swipe = (UISwipeGestureRecognizer *) gesto;
        
        //Caso o movimento for pra esquerda o novo X fica sendo zero se nao pega a largura do dispositivo menos a largura do quadrado
        float novoX = swipe.direction == UISwipeGestureRecognizerDirectionLeft ? 0 : (self.view.frame.size.width - quadrado.frame.size.width);
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            CGRect frame = quadrado.frame;
            frame.origin.x = novoX;
            quadrado.frame = frame;
        } completion:nil ];
    }
    
}


@end
