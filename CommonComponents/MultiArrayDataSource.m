#import "MultiArrayDataSource.h"

@interface MultiArrayDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *cellIdentifiers;
@property (nonatomic, strong) NSArray *configureCellBlocks;

@end

@implementation MultiArrayDataSource

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(CellConfigureBlock)aConfigureCellBlock {
    return [self initWithItems: @[anItems] cellIdentifiers: @[[aCellIdentifier copy]] configureCellBlocks: @[[aConfigureCellBlock copy]]];
}

- (id)initWithItems:(NSArray *)items
     cellIdentifiers:(NSArray *)cellIdentifiers
 configureCellBlocks:(NSArray *)configureCellBlocks {
    self = [super init];
    if(self) {
        self.items = items;
        self.cellIdentifiers = cellIdentifiers;
        self.configureCellBlocks = [configureCellBlocks copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.section][(NSUInteger)indexPath.row];
}


#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)self.items[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = self.cellIdentifiers[indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    CellConfigureBlock block = self.configureCellBlocks[indexPath.section];
    block(cell, item);
    return cell;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.items.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return ((NSArray *)self.items[section]).count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = self.cellIdentifiers[indexPath.section];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    CellConfigureBlock block = self.configureCellBlocks[indexPath.section];
    block(cell, item);
    return cell;
}


@end
