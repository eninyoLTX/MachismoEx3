//
//  ViewController.h
//  test1
//
//  Created by Eliah Ninyo on 03/05/2022.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"


@interface CardGameViewController : UIViewController



- (Deck *) createDeck;
- (NSUInteger) getMatchSize;
- (void)updateUI;


- (NSAttributedString *)titleForCard:(Card *)card;
- (UIImage *)backgroundImageForCard:(Card *)card;


@end

