//
//  ViewController.m
//  MCMS
//
//  Created by Thomas M. Mroz on 5/20/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *onAddCreatureTextField;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//When ViewController instantiates, add 3 MagicalCreatures to creatures
    MagicalCreature *creature1 = [[MagicalCreature alloc] initWithName:@"Harry" description:@"Very Harry"image:[UIImage imageNamed:@"monster2"]];
    MagicalCreature *creature2 = [[MagicalCreature alloc] initWithName:@"Dick" description:@"Very Stinky"image:[UIImage imageNamed:@"monster3"]];
    MagicalCreature *creature3 = [[MagicalCreature alloc] initWithName:@"Tom" description:@"Very Silly" image:[UIImage imageNamed:@"Mike"]];
    self.creatures = [NSMutableArray arrayWithObjects:
                      creature1,
                      creature2,
                      creature3, nil];

}

-(void) viewWillAppear:(BOOL)animated
{
    [self.myTableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = self.myTableView.indexPathForSelectedRow;
   MagicalCreature *selectedCreature = [self.creatures objectAtIndex: selectedIndexPath.row ];
    CreatureViewController *CreaturedetailsVC = segue.destinationViewController;
    CreaturedetailsVC.creature = selectedCreature;
}

- (IBAction)onAddCreatureButton:(id)sender
{
    MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName: self.onAddCreatureTextField.text];
    [self.creatures addObject:newCreature];
    self.onAddCreatureTextField.text = @"";
    [self.onAddCreatureTextField resignFirstResponder];
    [self.myTableView reloadData];
}

-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureCellId"];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;
    cell.imageView.image = creature.image;
    return cell;
}




@end
