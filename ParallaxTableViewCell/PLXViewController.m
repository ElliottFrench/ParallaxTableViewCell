//
//  PLXViewController.m
//  ParallaxTableViewCell
//
//  Created by Elliott French on 18/11/2014.
//  Copyright (c) 2014 Elliott French. All rights reserved.
//

#import "PLXViewController.h"
#import "PLXTableViewCell.h"

@interface PLXViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *imagesArray;
@property (assign, nonatomic) CGPoint lastContentOffset;

@end

@implementation PLXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.imagesArray = [NSMutableArray array];
    
    // Set images array for TableViewDataSource
    NSUInteger numberOfImages = 18;
    for (NSUInteger i = 0; i < numberOfImages; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"image%li", (unsigned long)i]];
        [self.imagesArray addObject:image];
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PLXTableViewCell" bundle:nil] forCellReuseIdentifier:@"PLXTableViewCell"];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set row height in combination to maximum offset and image height
    return 150.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of images in the images array
    return [self.imagesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PLXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PLXTableViewCell" forIndexPath:indexPath];
    // Set the cells image according to its row
    cell.cellImageView.image = self.imagesArray[indexPath.row];
    
    // For performance reasons, the table view's delegate in tableView:cellForRowAtIndexPath: is the location you reset cell content when reusing a cell.
    // Reset constraint as cell is reused
    cell.cellImageViewCenterYConstraint.constant = 0;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    PLXTableViewCellScrollDirection scrollDirection = ScrollDirectionNone;
    
    // Determine whether TableView is scrolling up or down
    if (self.lastContentOffset.y > scrollView.contentOffset.y) {
        scrollDirection = ScrollDirectionDown;
    }
    else if (self.lastContentOffset.y < scrollView.contentOffset.y) {
        scrollDirection = ScrollDirectionUp;
    }
    
    // Update lastContentOffSet to scrollView's latest offset for next comparison
    self.lastContentOffset = scrollView.contentOffset;
    
    // Create object to send to all observers (UITableViewCells) of the PLXTableViewCellScrollDirectionNotification
    NSNumber *notificationObject = [NSNumber numberWithInteger:scrollDirection];
    [[NSNotificationCenter defaultCenter] postNotificationName:PLXTableViewCellScrollDirectionNotification
                                                        object:notificationObject];
}





@end
