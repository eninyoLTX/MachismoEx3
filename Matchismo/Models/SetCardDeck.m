//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Eliah Ninyo on 29/05/2022.
//

#import "SetCardDeck.h"

@implementation SetCardDeck


- (instancetype)init{
    self = [super init];
    
    if (self){
        for (NSString *shape in [SetCard validShapes]){
            for (enum shapeFill fill = kEmpty; fill <= kStrike ; fill++){
                for (UIColor *color in [SetCard validColors]){
                    for (int numOfShapes = 0; numOfShapes < 3; numOfShapes++){
                        SetCard *card = [[SetCard alloc] init];
                        card.color = color;
                        card.shape = shape;
                        card.fill = fill;
                        card.cnt = numOfShapes+1;
                        
                        [self addCard:card];
                    }
                }          
            }
        }
        
    }
    
    return self;
}

@end
