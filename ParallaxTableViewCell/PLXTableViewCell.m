//
//  PLXTableViewCell.m
//  ParallaxTableViewCell
//
//  Created by Elliott French on 18/11/2014.
//  Copyright (c) 2014 Elliott French. All rights reserved.
//

#import "PLXTableViewCell.h"

@interface PLXTableViewCell ()



@end

@implementation PLXTableViewCell

- (void)awakeFromNib {
    // Set up NSNotification on Cell to update image centerY constraints when notified of scroll direction
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateImageConstraintWithScrollNotification:)
                                                 name:PLXTableViewCellScrollDirectionNotification
                                               object:nil];
}

- (void)dealloc {
    // remove NSNotification observer once cell is dealloc'ed
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// Method to offset NSConstraint centerY according to scroll amount and direction
- (void)updateImageConstraintWithScrollNotification:(NSNotification *)notification {
    NSNumber *notificationObject = notification.object;
    
    //typedef enum
    PLXTableViewCellScrollDirection scrollDirection = [notificationObject integerValue];
    // grab constant constraint center offset
    CGFloat centerYConstant = self.cellImageViewCenterYConstraint.constant;
    
    switch (scrollDirection) {
        case ScrollDirectionUp: {
            // If TableView is scrolled down, minus offsetfactor
            centerYConstant -= PLXTableViewCellOffsetFactor;

            // Check to see if image has scrolled to max allowable offset value and if so prevent further offsetting
            if (-1 * PLXTableViewCellMaximumOffset > centerYConstant) {
                centerYConstant = -1 * PLXTableViewCellMaximumOffset;
            }
        }
        break;
            
        case ScrollDirectionDown: {
            // If TableView is scrolled up, add offsetfactor
            centerYConstant += PLXTableViewCellOffsetFactor;

            // Check to see if image has scrolled to max allowable offset value and if so prevent further offsetting
            if (PLXTableViewCellMaximumOffset < centerYConstant) {
                centerYConstant = PLXTableViewCellMaximumOffset;
            }
        }
        default: {
            // Do nothing
        }
        break;
    }
    
    // Update ImageViews new centerY contraint constant
    self.cellImageViewCenterYConstraint.constant = centerYConstant;
}


@end
