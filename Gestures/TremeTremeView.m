//
//  TremeTremeView.m
//  Gestures
//
//  Created by Marcos Felipe Souza on 21/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "TremeTremeView.h"
#define RADIANS(degrees) ((degrees * M_PI) / 180.0)


@interface TremeTremeView ()
-(void) registrarGestos;
-(void) enfeitaView;
@end

@implementation TremeTremeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(id) initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {
        [self enfeitaView];
        [self registrarGestos];
    }
    return self;
}

-(void) registrarGestos{
    UILongPressGestureRecognizer *toqueLongo = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(iniciaTremedeira:)];
    toqueLongo.minimumPressDuration = 0.3;
    [self addGestureRecognizer:toqueLongo];
    
    UITapGestureRecognizer *toqueParar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pararAnimacao:)];
    toqueParar.numberOfTapsRequired = 3;
    [self addGestureRecognizer:toqueParar];
}

-(void) iniciaTremedeira: (UIGestureRecognizer *) tremedeira {
    CGAffineTransform oscilaEsquerda = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(- 5.0));
    CGAffineTransform oscilaDireira = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(5.0));
    
    self.transform = oscilaEsquerda;
    
    UIViewAnimationOptions opcoes = UIViewAnimationOptionRepeat |  //Vai se repetir sempre
                                    UIViewAnimationOptionAllowUserInteraction | //Pode ser interrompido
                                    UIViewAnimationOptionAutoreverse | //Qndo acabar, volta ao ponto inicial
                                    UIViewAnimationCurveEaseInOut;
    
    
    //Cada oscilacao deve durar 100 millesegundos
    [UIView animateWithDuration:0.1 delay:0 options:opcoes animations:^{
        self.transform = oscilaDireira;
        NSLog(@"treme-treme !");
    } completion:nil];
}

-(void) pararAnimacao: (UIGestureRecognizer *) animacao {
    UIViewAnimationOptions opcoes = UIViewAnimationOptionBeginFromCurrentState; //Pega a parte em que a view se encontra, movimento fica suave
    
    //Retorna a View ao estado normal
    [UIView animateWithDuration:0 delay:0 options:opcoes animations:^{
        self.transform = CGAffineTransformIdentity;
        NSLog(@"parou !");
    } completion:nil];
}


-(void) enfeitaView {
    self.layer.masksToBounds = NO;
    self.layer.cornerRadius = 8; //bordas arredondadas
    self.layer.shadowOffset = CGSizeMake(-2, 2);  //adiciona a sombra
    self.layer.shadowRadius = 5; //radio da sombra
    self.layer.shadowOpacity = 0.5;
}


@end
