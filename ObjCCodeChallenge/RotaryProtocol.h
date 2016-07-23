//
//  RotaryProtocol.h
//  rotarywheelproject
//
//  Created by Patrick Cooke on 7/16/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RotaryProtocol <NSObject>

- (void) wheelDidChangeValue:(NSString *)newValue;


@end
