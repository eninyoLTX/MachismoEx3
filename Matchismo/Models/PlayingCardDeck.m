//
//  PlayingCardDeck.m
//  test1
//
//  Created by Eliah Ninyo on 08/05/2022.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck



- (instancetype)init{
    self = [super init];
    
    if (self){
        for (NSString *suit in [PlayingCard validSuits]){
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                card.contents = [NSString stringWithFormat:@"%lu%@", (unsigned long)rank, suit];
                [self addCard:card];
            }
        }
        
    }
    
    return self;
}

@end
