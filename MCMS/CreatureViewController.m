//
//  CreatureViewController.m
//  MCMS
//
//  Created by Thomas M. Mroz on 5/20/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//
#import "ViewController.h"
#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatureDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UITextField *editNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *editDescriptionTextField;
@property MagicalCreature *updateCreature;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@end

@implementation CreatureViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.creatureNameLabel.text = self.creature.name;
    self.creatureDescriptionLabel.text = self.creature.description;
    self.editNameTextField.hidden = YES;
    self.editDescriptionTextField.hidden = YES;
    self.editNameTextField.text = self.creature.name;
    self.editDescriptionTextField.text = self.creature.description;
    self.creatureImageView.image =self.creature.image;
    
   
}

- (IBAction)onEditButtonPressed:(UIButton *)sender
{
    self.editing = !self.editing;
    if (self.editing)
    {
        [sender setTitle: @"Done" forState: UIControlStateNormal];
        self.editNameTextField.hidden = NO;
        self.editDescriptionTextField.hidden=NO;
    }
    else
    {
        [sender setTitle: @"Edit" forState: UIControlStateNormal];
        self.editNameTextField.hidden = YES;
        self.editDescriptionTextField.hidden = YES;

        if(![self.creatureNameLabel.text isEqualToString:self.editNameTextField.text])
        {
            self.creatureNameLabel.text = self.editNameTextField.text;
            self.creature.name = self.creatureNameLabel.text;

        }
        if(![self.creatureDescriptionLabel.text isEqualToString:self.editDescriptionTextField.text])
        {
            self.creatureDescriptionLabel.text = self.editDescriptionTextField.text;
            self.creature.description = self.creatureDescriptionLabel.text;
        }

    }

}



@end
