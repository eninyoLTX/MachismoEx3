//
//  SetCard.h
//  Matchismo
//
//  Created by Eliah Ninyo on 29/05/2022.
//

#import "Card.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetCard : Card


enum shapeFill : NSInteger{
    kEmpty,
    kFull,
    kStrike
};


@property (strong, nonatomic) NSString *shape;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) enum shapeFill fill; // 0 - empty, 1 - full, 2  - srikes (lines)
@property (nonatomic) NSUInteger cnt; // 1, 2 or 3 shapes in a card

//@property (nonatomic) NSUInteger rank;

+ (NSArray *)validShapes;
+ (NSArray *)validColors;

//+ (NSUInteger)maxRank;

@end

NS_ASSUME_NONNULL_END
