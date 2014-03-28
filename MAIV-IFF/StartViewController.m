//
//  StartViewController.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@property(nonatomic)BOOL jsonsLoaded;
@property(nonatomic)BOOL mapCacheLoaded;


@end

@implementation StartViewController
@synthesize lblLoading;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Check CUstom Fonts (CalcitePro-Regular)
        NSArray *fontFamilies = [UIFont familyNames];
        for (int i = 0; i < [fontFamilies count]; i++)
        {
            NSString *fontFamily = [fontFamilies objectAtIndex:i];
            NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
            NSLog (@"%@: %@", fontFamily, fontNames);
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    lblLoading = [ [UILabel alloc ] initWithFrame:CGRectMake((self.view.bounds.size.width / 2) - 75, 390.0, 150.0, 43.0) ];
    lblLoading.textColor = [UIColor blackColor];
    lblLoading.font = [UIFont fontWithName:@"CalcitePro-Regular" size:(20.0)];
    lblLoading.text = [NSString stringWithFormat: @"Loading..."];
    lblLoading.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblLoading];
    
    [self cacheMap];
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
    [self saveJsonData];
}

-(void)btnStartTapped:(id)sender{
    SoldierViewController *soldierVC = [[SoldierViewController alloc] init];
    [self.navigationController pushViewController:soldierVC animated:YES];
}

-(void)cacheMap{
    RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"stijnheylen.hkkg4ihk"];
    source.retryCount = 3;
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:source];
    //mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    RMTileCache *tileCache = [[RMTileCache alloc] initWithExpiryPeriod:31557600.0];
    mapView.tileCache = tileCache;
    
    mapView.tileCache.backgroundCacheDelegate = self;
    
    [mapView.tileCache beginBackgroundCacheForTileSource:mapView.tileSource
                                               southWest:CLLocationCoordinate2DMake(50.8581, 2.8516)
                                               northEast:CLLocationCoordinate2DMake(50.9101, 2.9433)
                                                 minZoom:16
                                                 maxZoom:16];
}

- (void)tileCache:(RMTileCache *)tileCache didBeginBackgroundCacheWithCount:(int)tileCount forTileSource:(id <RMTileSource>)tileSource {
    self.view.mapCachingProgressView.progress = 0.0f;
    self.view.mapCachingProgressView.hidden = NO;
}

- (void)tileCache:(RMTileCache *)tileCache didBackgroundCacheTile:(RMTile)tile withIndex:(int)tileIndex ofTotalTileCount:(int)totalTileCount {
    self.view.mapCachingProgressView.progress = (float)tileIndex / (float)totalTileCount;
}

- (void)tileCacheDidFinishBackgroundCache:(RMTileCache *)tileCache{
    self.mapCacheLoaded = YES;
    [self checkIfloadingIsDone];
}

-(void)saveJsonData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jsons" ofType:@"plist"];
    NSArray *jsons = [[NSArray alloc] initWithContentsOfFile:path];
    __block int jsonsLoading = [jsons count];
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue setMaxConcurrentOperationCount:4];
    
    for(NSString *url in jsons){

        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            //NSLog(@"Loaded data: %@", responseObject);
            
            
            //Save to documentDirectory
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths firstObject];
            NSString *pathString = [NSString stringWithFormat:@"%@/%@",documentsDirectory, [url lastPathComponent]];
            NSData* jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:kNilOptions error:nil];
            [jsonData writeToFile:pathString atomically:YES];
            
            jsonsLoading--;
            if(jsonsLoading == 0){
                self.jsonsLoaded = YES;
                [self checkIfloadingIsDone];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths firstObject];
            NSString *pathString = [NSString stringWithFormat:@"%@/%@",documentsDirectory, [url lastPathComponent]];
            BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:pathString];
            if(fileExists){
                jsonsLoading--;
                if(jsonsLoading == 0){
                    self.jsonsLoaded = YES;
                    [self checkIfloadingIsDone];
                }
            } else {
                NSLog(@"error");
            }
        }];
        
        [operationQueue addOperation:operation];
    }
}

-(void)checkIfloadingIsDone{
    if(self.jsonsLoaded && self.mapCacheLoaded){
        [self.view.btnStart setEnabled:YES];
        [lblLoading removeFromSuperview];
        NSLog(@"Loading done");
    }
}

@end
