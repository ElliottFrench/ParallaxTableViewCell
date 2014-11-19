//
//  PLXTableViewCell.h
//  ParallaxTableViewCell
//
//  Created by Elliott French on 18/11/2014.
//  Copyright (c) 2014 Elliott French. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLXTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *cellImageView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *cellImageViewCenterYConstraint;

typedef enum PLXTableViewCellScrollDirection : NSInteger {
    ScrollDirectionNone = 0,
    ScrollDirectionUp,
    ScrollDirectionDown,
} PLXTableViewCellScrollDirection;

//The #define is a pre-processor macro, this allows us to define and update the important UITableViewCell constants in one place.
#define PLXTableViewCellScrollDirectionNotification @"PLXTableViewCellScrollDirectionNotification"
#define PLXTableViewCellMaximumOffset 50.0f
#define PLXTableViewCellOffsetFactor 0.25f

@end
