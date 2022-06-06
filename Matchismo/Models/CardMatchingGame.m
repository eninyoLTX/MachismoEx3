//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Eliah Ninyo on 09/05/2022.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite)  NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic, readwrite) NSUInteger matchingSize;
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}

- (void)resetGame{
    self.score = 0;
    
}

- (void)setMatchingSize:(NSUInteger)matchingSize{
    _matchingSize = matchingSize;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        matchSize:(NSUInteger)matchSize
                        usingDeck:(Deck *)deck{
    self = [super init];
    
    self.matchingSize = matchSize;
    
    if (self){
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


- (struct matchResults)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    struct matchResults res;
    res.score = 0;
    res.isMatch = false;
    res.cards = [[NSMutableArray alloc] init];
    
    if (!card.isMachtched){
        if (card.isChosen){
            card.chosen = NO;
            [res.cards addObject:card];
            return res;
        } else {
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            res.score = self.score;
        }
        
        // find all chosen cards
        NSMutableArray *chosenCards = [[NSMutableArray alloc] init];
        for (Card *otherCard in self.cards){
            if (otherCard.isChosen && !otherCard.isMachtched){
                [chosenCards addObject:otherCard];
                [res.cards addObject:otherCard];
            }
        }
        
        
        
        // do the maching
        unsigned long cCount = [chosenCards count];
        if (cCount < _matchingSize)
            return res;
        
        for (Card *chosenCard in chosenCards){
            int matchScore = [chosenCard match:chosenCards];
            //matchScore = 100;
            if (matchScore){
                self.score += matchScore * MATCH_BONUS * self.matchingSize;
                for (Card *c in chosenCards){
                    c.matched = YES;
                }
                res.isMatch = true;
                break;
            } else {
                if (cCount > 1){
                    self.score -= MISMATCH_PENALTY;
                        
                    for (Card *c in chosenCards){
                        c.matched = NO;
                        c.chosen = NO;
                    }
                    
                    card.chosen = YES;
                }
            }
        }
        res.score = self.score;
        
        
            /*
            for (Card *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMachtched){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
             */
            
            
            //card.chosen = NO;
        
    }
    return res;
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (instancetype)init{
    return nil;
}

@end
