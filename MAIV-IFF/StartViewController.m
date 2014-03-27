//
//  StartViewController.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Check CUstom Fonts (CalcitePro-Regular)
//        NSArray *fontFamilies = [UIFont familyNames];
//        for (int i = 0; i < [fontFamilies count]; i++)
//        {
//            NSString *fontFamily = [fontFamilies objectAtIndex:i];
//            NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
//            NSLog (@"%@: %@", fontFamily, fontNames);
//        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.view = [[StartView alloc] initWithFrame:bounds];
    [self.view.btnStart setEnabled:NO];
    [self.view.btnStart addTarget:self action:@selector(btnStartTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self saveRoutecoordsData];
}

-(void)btnStartTapped:(id)sender{
    SoldierViewController *soldierVC = [[SoldierViewController alloc] init];
    [self.navigationController pushViewController:soldierVC animated:YES];
}

-(void)saveRoutecoordsData{
    NSURL *url = [NSURL URLWithString:@"http://localhost/RMDII/MAIV-IFF-API/api/routecoords"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Loaded data: %@", responseObject);
        
        //Save to documentDirectory
        NSString *documentsDirectory = nil;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsDirectory = [paths objectAtIndex:0];
        NSString *pathString = [NSString stringWithFormat:@"%@/%@",documentsDirectory, @"routecoords"];
        [responseObject writeToFile:pathString atomically:YES];
        
        //Enable startBtn
        [self.view.btnStart setEnabled:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error loading data");
        
    }];
    [operation start];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
