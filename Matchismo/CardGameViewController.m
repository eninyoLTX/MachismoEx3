//
//  ViewController.m
//  test1
//
//  Created by Eliah Ninyo on 03/05/2022.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) NSMutableAttributedString *resString;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game{
    if (!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  matchSize:[self getMatchSize]
                                                  usingDeck:[self createDeck]];
        _resString = [[NSMutableAttributedString alloc] init];
        
    }
    return _game;
}

- (NSUInteger) getMatchSize{
    return 0;
}

- (Deck *) createDeck {
    return nil;
}


- (NSAttributedString *)titleForCard:(Card *)card{
    return nil;
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    
    return nil;
}

- (IBAction)resetGame:(id)sender {
    self.game = nil;
    self.resString =  [[NSMutableAttributedString alloc]initWithString:@""];
    [self updateUI];
       
}

- (IBAction)touchCardButton:(UIButton *)sender {
    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
    struct matchResults mres = [self.game chooseCardAtIndex:cardIndex];
    self.resString = [[NSMutableAttributedString alloc]initWithString:@""];
    for (Card *c in mres.cards){
        [self.resString appendAttributedString:[self titleForCard:c]];   
    }
    
    if (mres.isMatch){
        NSAttributedString *temp = [[NSAttributedString alloc]initWithString:@"Matched!"];
        [self.resString appendAttributedString:temp];
    } else {
        NSString *resStr = [[NSString alloc]initWithFormat:@"Don't matched! %ld points penalty!", mres.score];
        
        NSAttributedString *convertedStrToAttrStr = [[NSAttributedString alloc]initWithString:resStr];
        
        [self.resString appendAttributedString:convertedStrToAttrStr];
        
    }
    
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons){
        unsigned long cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.layer.borderWidth = 0.0f;
        if (card.isChosen){
            cardButton.layer.borderWidth = 2.0f;
            cardButton.layer.borderColor = [UIColor blackColor].CGColor;
        }
        
        cardButton.enabled = !card.isMachtched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Scorce: %ld", (long)self.game.score];
        
    
    //self.resultLabel.text = [NSString stringWithString:self.resString];
    self.resultLabel.attributedText = self.resString;
}




@end
