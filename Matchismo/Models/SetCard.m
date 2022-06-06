//
//  SetCard.m
//  Matchismo
//
//  Created by Eliah Ninyo on 29/05/2022.
//

#import "SetCard.h"

@implementation SetCard


+ (NSArray *)validShapes{
    return @[@"▲", @"◼︎",@"●"];
}

+ (NSArray<UIColor*> *)validColors{
    return @[[UIColor redColor], [UIColor greenColor], [UIColor purpleColor]];
}


- (int)match:(NSArray *)otherCards{
    int score = 0;
    
  if ([otherCards count] == 3){
     
        SetCard *firstCard = [otherCards firstObject];
        SetCard *secondCard = otherCards[1];
        SetCard *thirdCard = otherCards[2];
      
      NSUInteger cnt = (firstCard.cnt == secondCard.cnt) + (firstCard.cnt == thirdCard.cnt) + (secondCard.cnt == thirdCard.cnt);
      
      NSUInteger fill = (firstCard.fill == secondCard.fill) + (firstCard.fill == thirdCard.fill) + (secondCard.fill == thirdCard.fill);
      
      NSUInteger shape = (firstCard.shape == secondCard.shape) + (firstCard.shape == thirdCard.shape) + (secondCard.shape == thirdCard.shape);
      
      NSUInteger color = (firstCard.color.description == secondCard.color.description) + (firstCard.color.description == thirdCard.color.description) + (secondCard.color.description == thirdCard.color.description);
      
      if ((cnt == 0 || cnt == 3) &&
          (fill == 0 || fill == 3) &&
          (shape == 0 || shape == 3) &&
          (color == 0 || color == 3)){
              // we have a match!!!
            score = 4;
          }
      
    }
    
    return score;
}

@end
