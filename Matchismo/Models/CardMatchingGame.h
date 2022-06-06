//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Eliah Ninyo on 09/05/2022.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        matchSize:(NSUInteger)matchSize
                        usingDeck:(Deck *)deck;

- (struct matchResults)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void)resetGame;
- (void)setMatchingSize:(NSUInteger)matchingSize;


struct matchResults{
    NSInteger score;
    bool isMatch;
    NSMutableArray *cards;
};

@property (nonatomic, readonly) NSInteger score;

@end

NS_ASSUME_NONNULL_END
