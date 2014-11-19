#Parallax Scrolling and UITableViewCell

##How to get started
Fork the repo and follow the included comments. In the custom UITableViewCell.h there are three pre-processor macros defined, two  for you to customise and play with. 

The first is ```PLXTableViewCellMaximumOffset```, this dictates the maximum allowable image offset within the cell, once this maximum is met further offsets to the image y-constraint are ignored.

The second is ```PLXTableViewCellOffsetFactor```, and defines the amount the cell image should be offset with each call of the ```- (void)scrollViewDidScroll:(UIScrollView *)scrollView``` method.

**I hope the comments included are clear, however please do not hesitate to submit pull requests.**

##Device note
The UIViewController and UITableView have been modelled on iPhone 5/5S/5C. For other devices you'll just need to make some additions to the views AutoLayout constraints.

#Screenshot
![Image of TableViewCell]
(screenshot.png)
