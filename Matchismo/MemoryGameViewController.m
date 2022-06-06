//
//  MemoryGameViewController.m
//  Matchismo
//
//  Created by Eliah Ninyo on 29/05/2022.
//

#import "MemoryGameViewController.h"
#import "PlayingCardDeck.h"


@interface MemoryGameViewController ()


@end

@implementation MemoryGameViewController



- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (NSUInteger) getMatchSize{
    return 2;
}

- (NSAttributedString *)titleForCard:(Card *)card{
    return [[NSAttributedString alloc] initWithString:card.isChosen ? card.contents : @"" attributes:nil];
    //return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
