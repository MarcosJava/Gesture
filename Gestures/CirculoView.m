//
//  CirculoView.m
//  Gestures
//
//  Created by Marcos Felipe Souza on 20/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "CirculoView.h"

@implementation CirculoView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contexto, 2.0);
    CGColorRef corFundo = [UIColor redColor].CGColor;
    CGContextSetFillColor(contexto, CGColorGetComponents(corFundo));
    
    int tamanho = 25;
    
    for (NSValue *item in circulos) {
        
        CGPoint ponto = [item CGPointValue];
        CGRect regiao = CGRectMake(ponto.x, ponto.y, tamanho, tamanho);
        CGContextAddEllipseInRect(contexto, regiao);
        CGContextFillEllipseInRect(contexto, regiao);
    }
    
    CGContextStrokePath(contexto);
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Recebimento touchesBegan");
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Recebimento touchesMoved ");
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!circulos) {
        circulos = [NSMutableArray new];
    }
    
    NSLog(@"Recebido touchesEnded. Registrando o ponto de toque");
    
    UITouch *toque = [touches anyObject];
    CGPoint localizacaoToque = [toque locationInView:self];
    
    [circulos addObject:[NSValue valueWithCGPoint:localizacaoToque]];
    
    [self setNeedsDisplay];
}


@end
