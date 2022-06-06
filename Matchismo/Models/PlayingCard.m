//
//  PlayingCard.m
//  test1
//
//  Created by Eliah Ninyo on 08/05/2022.
//

#import "PlayingCard.h"

@implementation PlayingCard


- (int)matchScore:(PlayingCard *)f secCard:(PlayingCard *)s{
    if ([f.suit isEqualToString:s.suit]){
        return 1;
    } else if (f.rank == s.rank){
        return 4;
    }
    return 0;
}
- (int)match:(NSArray *)otherCards{
    int score = 0;
    
    if ([otherCards count] == 2){
    
            PlayingCard *firstCard = [otherCards firstObject];
            PlayingCard *secondCard = otherCards[1];
            score += [self matchScore:firstCard secCard:secondCard];
    } else if ([otherCards count] == 3){
     
            PlayingCard *firstCard = [otherCards firstObject];
            PlayingCard *secondCard = otherCards[1];
            PlayingCard *thirdCard = otherCards[2];
                        
            score += [self matchScore:firstCard secCard:secondCard];
            score += [self matchScore:firstCard secCard:thirdCard];
            score += [self matchScore:thirdCard secCard:secondCard];

    }
    return score;
}

- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
@synthesize suit = _suit; //because we provide getter AND setter

+ (NSArray *)validSuits{
    return @[@"♥️", @"♦️",@"♠️", @"♣️"];
}

- (void) setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *) suit{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank { return [[self rankStrings] count] - 1; }

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}
@end
