#import "ArrayDataSource.h"

@interface MultiArrayDataSource : ArrayDataSource

- (id)initWithItems:(NSArray *)items
     cellIdentifiers:(NSArray *)cellIdentifiers
 configureCellBlocks:(NSArray *)configureCellBlocks;

@end
