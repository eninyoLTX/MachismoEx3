//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Eliah Ninyo on 25/05/2022.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "QuartzCore/QuartzCore.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

- (Deck *) createDeck {
    return [[SetCardDeck alloc] init];
}

- (NSUInteger) getMatchSize{
    return 3;
}
- (NSAttributedString *)titleForCard:(Card *)card{
    NSMutableDictionary<NSAttributedStringKey,id> *titleAttributes = [NSMutableDictionary dictionary];

    SetCard *sCard = (SetCard*)(card);
    NSString *cardTitle = @"";
    
    cardTitle = [cardTitle stringByPaddingToLength:sCard.cnt withString:sCard.shape startingAtIndex:0];

    titleAttributes[NSForegroundColorAttributeName] = sCard.color;
    
    switch (sCard.fill) {
      case kFull:
       // Do nothing, as default is already set to fill
       break;
      case kEmpty:
       titleAttributes[NSStrokeWidthAttributeName] = @3;
       break;
      case kStrike:
            titleAttributes[NSStrokeWidthAttributeName] = @3;
            titleAttributes[NSStrikethroughStyleAttributeName] = @(NSUnderlineStyleSingle);
       break;
      default:
       NSLog(@"error, unexpected shading value");
       break;
     }
    //sCard.contents = [[NSAttributedString alloc] initWithString:cardTitle attributes:titleAttributes];

    return [[NSAttributedString alloc] initWithString:cardTitle attributes:titleAttributes];
    
    //return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed: @"cardfront"];
}


- (void)viewDidLoad{
    [self updateUI];
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
