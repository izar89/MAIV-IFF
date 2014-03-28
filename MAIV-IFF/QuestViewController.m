//
//  QuestViewController.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "QuestViewController.h"

@interface QuestViewController ()

@property(strong, nonatomic)NSMutableArray *backpackItems;
@property(strong, nonatomic)NSMutableArray *btnBackpackItems;
@property(strong, nonatomic)UIButton *selectedBtnBackpackItem;

@end

@implementation QuestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.backpackItems = [[NSMutableArray alloc] init];
        self.btnBackpackItems = [[NSMutableArray alloc] init];
        
        for(NSDictionary *backpackItemDict in [FileManager getJsonFromDDWithName:@"backpackitems"]){
            
            BackpackItem *backpackItem = [BackpackItem createBackpackFromDictionary:backpackItemDict];
            
            UIImage *backpackItemImage = [UIImage imageNamed:backpackItem.imageName];
            UIImage *backpackItemImageSelected = [UIImage imageNamed:backpackItem.imageSelectedName];
            UIButton *btnBackpackItem = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnBackpackItem setBackgroundImage:backpackItemImage forState:UIControlStateNormal];
            [btnBackpackItem setBackgroundImage:backpackItemImageSelected forState:UIControlStateSelected];
            //[btnBackpackItem addTarget:self action:@selector(btnBackpackItemTapped:) forControlEvents:UIControlEventTouchUpInside];
            btnBackpackItem.frame = CGRectMake(backpackItem.xPos, backpackItem.yPos + 133, backpackItemImage.size.width, backpackItemImage.size.height);
            
            [self.backpackItems addObject:backpackItem];
            
            [self.btnBackpackItems addObject:btnBackpackItem];
            [self.view addSubview:btnBackpackItem];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.photoView.image = [FileManager getImageFromDDWithName:@"photo.png"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadView{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.view = [[QuestView alloc] initWithFrame:bounds];
}

@end
