#import "UITableViewCell+Utils.h"

@implementation UITableViewCell (Utils)

+ (UINib *) nib {
    return [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
}

@end
