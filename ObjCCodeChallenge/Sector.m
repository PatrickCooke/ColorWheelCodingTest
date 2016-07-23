//
//  Sector.m
//  rotarywheelproject
//
//  Created by Patrick Cooke on 7/17/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

#import "Sector.h"

@implementation Sector

@synthesize minValue, maxValue, midValue, sector;

- (NSString *) description {
    return [NSString stringWithFormat:@"%i | %f, %f, %f", self.sector, self.minValue, self.midValue, self.maxValue];
}

@end
