//
//  MapViewController.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "MapViewController.h"


@interface MapViewController ()

@property(strong, nonatomic)NSMutableArray *quests;
@property(strong, nonatomic)Quest *selectedQuest;

@end

@implementation MapViewController
@synthesize view, locationManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Init GPS
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    
    //Turn on the GPS
    [self.locationManager startUpdatingLocation];
    //[self initializeGPS];
    
    
    //TODO: DELETE!
    UIImage *btnNextImage = [UIImage imageNamed:@"btnNext"];
    UIButton *btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNext setBackgroundImage:btnNextImage forState:UIControlStateNormal];
    btnNext.frame = CGRectMake(0, 0, btnNextImage.size.width, btnNextImage.size.height);
    btnNext.center = CGPointMake((self.view.frame.size.width / 2), 950);
    [btnNext addTarget:self action:@selector(btnNextTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNext];
    
    [self loadQuests];
}

-(void)loadQuests{
    self.quests = [[NSMutableArray alloc] init];
    for(NSDictionary *questDict in [FileManager getJsonFromDDWithName:@"quests"]){
        Quest *quest = [Quest createQuestFromDictionary:questDict];
        [self.quests addObject:quest];
    }
    
    self.selectedQuest = [self.quests objectAtIndex:0];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location: %@", [newLocation description]);
    
    MapBoxView *mapBoxView;
    mapBoxView.mapView.centerCoordinate = newLocation.coordinate; //Werkt nog niet//
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", [error description]);
}

-(void)btnNextTapped:(id)sender{
    QuestViewController *questVC = [[QuestViewController alloc] initWithNibName:nil bundle:nil andQuest:self.selectedQuest];
    [self.navigationController pushViewController:questVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.view = [[MapBoxView alloc] initWithFrame:bounds];
}

@end
