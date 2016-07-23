//
//  RotaryWheel.h
//  rotarywheelproject
//
//  Created by Patrick Cooke on 7/16/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotaryProtocol.h"
#import "Sector.h"

@interface RotaryWheel : UIControl

@property (weak) id <RotaryProtocol> delegate;
@property (nonatomic, strong) UIView *container;
@property int numberOfSections;
@property CGAffineTransform startTransform;
@property (nonatomic, strong) NSMutableArray *sectors;
@property int currentSector;


- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber;
- (void) rotate;

@end
