//
//  QuestViewController.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 28/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "QuestViewController.h"

@interface QuestViewController ()

@property(strong, nonatomic)Quest *quest;

@property(strong, nonatomic)NSMutableArray *backpackItems;
@property(strong, nonatomic)NSMutableArray *backpackItemImageViews;
@property(nonatomic)NSNumber *selectedBackpackItemImageViewIndex;

@property(nonatomic)CGPoint originalPosition;
@property(nonatomic)CGPoint touchOffset;

@end

@implementation QuestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.backpackItems = [[NSMutableArray alloc] init];
        self.backpackItemImageViews = [[NSMutableArray alloc] init];
        
        for(NSDictionary *backpackItemDict in [FileManager getJsonFromDDWithName:@"backpackitems"]){
            
            BackpackItem *backpackItem = [BackpackItem createBackpackFromDictionary:backpackItemDict];
            
            UIImage *backpackItemImage = [UIImage imageNamed:backpackItem.imageName];
            UIImageView *backpackItemImageView = [[UIImageView alloc] initWithImage:backpackItemImage];
            backpackItemImageView.frame = CGRectMake(backpackItem.xPos, backpackItem.yPos + 133, backpackItemImage.size.width, backpackItemImage.size.height);
            backpackItemImageView.userInteractionEnabled = YES;
            
            [self.backpackItems addObject:backpackItem];
            [self.backpackItemImageViews addObject:backpackItemImageView];
            [self.view addSubview:backpackItemImageView];
        }
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andQuest:(Quest *)quest{
    self.quest = quest;
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.photoView.image = [FileManager getImageFromDDWithName:@"photo.png"];
    self.view.txtBackpackInfo.text = [FileManager getStringFromPlistWithName:@"text" AndKey:@"quest_backpack_info"];
    self.view.txtGeneral.text = self.quest.question;
    
    //BTN BACK
    [self.view.btnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    for(UIImageView *backpackItemImageView in self.backpackItemImageViews){
        if (CGRectContainsPoint(backpackItemImageView.frame, [touch locationInView:self.view])) {
            //imgView.center = [touch locationInView:self.view];
            self.selectedBackpackItemImageViewIndex = [NSNumber numberWithInt: [self.backpackItemImageViews indexOfObject:backpackItemImageView]];
            self.originalPosition = backpackItemImageView.center;
            [self.view bringSubviewToFront:backpackItemImageView];
        }
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
     if(self.selectedBackpackItemImageViewIndex){
         UITouch *touch = [touches anyObject];
         CGPoint position = [touch locationInView: self.view];
         
         [UIView animateWithDuration:.001
                               delay:0.0
                             options:UIViewAnimationOptionCurveEaseInOut
                          animations:^ {
                              UIImageView *backpackItemImageView = [self.backpackItemImageViews objectAtIndex:[self.selectedBackpackItemImageViewIndex intValue]];
                              backpackItemImageView.center = CGPointMake(position.x+_touchOffset.x, position.y+_touchOffset.y);
                          }
                          completion:^(BOOL finished) {}];
     }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.selectedBackpackItemImageViewIndex){
        UITouch *touch = [touches anyObject];
    
        CGPoint positionInView = [touch locationInView:self.view];
        CGPoint newPosition;
        if (CGRectContainsPoint(CGRectMake(500, 300, 150, 150), positionInView)) {
            // Position ok!
            newPosition = positionInView;
            if(![self checkIfAnswerIsOk]){
                newPosition = self.originalPosition;
            }
        } else {
            // Wrong position
            newPosition = self.originalPosition;

        }
    
        [UIView animateWithDuration:0.4
                            delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                        animations:^ {
                            UIImageView *backpackItemImageView = [self.backpackItemImageViews objectAtIndex:[self.selectedBackpackItemImageViewIndex intValue]];
                            backpackItemImageView.center = newPosition;
                        }
                        completion:^(BOOL finished) {}];
        self.selectedBackpackItemImageViewIndex = nil;
    }
}

-(void)btnBackTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)checkIfAnswerIsOk{
    BackpackItem *backpackItem = [self.backpackItems objectAtIndex: [self.selectedBackpackItemImageViewIndex intValue]];
    if(self.quest.backpackItem_identifier == backpackItem.identifier){
        
        NSLog(@"Juist!");
        self.view.txtGeneral.text = self.quest.response;
        self.view.btnBack.hidden = NO;
        return true;
    }
    NSLog(@"Fout!");
    return false;
}

@end
