//
//  TapCirculoView.m
//  Gestures
//
//  Created by Marcos Felipe Souza on 20/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "TapCirculoView.h"

@implementation TapCirculoView


- (id) init {
    if (self=[super init]) {
        //[self registrarEventos];
        [self registrarRotations];
    }
    return self;
}

-(void) registrarRotations {
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationRecebido:)];
    [self addGestureRecognizer:rotation];
}

-(void) rotationRecebido: (UIGestureRecognizer*) gesto {
    
    
    NSLog(@"chegou aqui");
    if(!circulos) {
        circulos = [NSMutableArray new];
    }
    
    CGPoint localizacaoToque = [gesto locationInView:self];
    [circulos addObject:[NSValue valueWithCGPoint:localizacaoToque]];
    [self setNeedsDisplay];
    
    
}

-(void) registrarEventos {
    UITapGestureRecognizer *toque = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toqueRecebido:)];
    
    toque.numberOfTapsRequired = 1;
    [self addGestureRecognizer:toque];
}

-(void) toqueRecebido: (UIGestureRecognizer*) gesto {
    
    if(!circulos) {
        circulos = [NSMutableArray new];
    }
    
    CGPoint localizacaoToque = [gesto locationInView:self];
    [circulos addObject:[NSValue valueWithCGPoint:localizacaoToque]];
    [self setNeedsDisplay];
    

}


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

@end
