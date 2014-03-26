//
//  SoldierViewController.m
//  MAIV-IFF
//
//  Created by Stijn Heylen on 26/03/14.
//  Copyright (c) 2014 Stijn Heylen. All rights reserved.
//

#import "SoldierViewController.h"

@interface SoldierViewController ()

@end

@implementation SoldierViewController

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
    [self initCameraView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = self.navigationController.view.bounds;
    self.view = [[SoldierView alloc] initWithFrame:bounds];
}

-(void)initCameraView{
    // CameraView
    self.cameraView = [[CameraView alloc] initWithFrame:self.view.frame];
    self.cameraView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [self.view addSubview:self.cameraView];
    [self.cameraView.btnCamera addTarget:self action:@selector(btnCameraTapped:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)takeSimulatorSafePhoto{
    // ImagePicker (Camera or Select an image)
    self.imagePickerController = [[UIImagePickerController alloc] init];
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    [self.imagePickerController setSourceType:sourceType];
    self.imagePickerController.allowsEditing = NO;
    self.imagePickerController.delegate = self;
	
    if (sourceType != UIImagePickerControllerSourceTypeCamera) {
        [self presentViewController:self.imagePickerController animated:YES completion:NULL];
    } else {
        //No ipad to test camera :(
    }
}

-(void)btnCameraTapped:(id)sender{
    [self takeSimulatorSafePhoto];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self detectFacesInUIImage:image];
}

-(void)detectFacesInUIImage:(UIImage *)facePicture
{
    CIImage* image = [CIImage imageWithCGImage:facePicture.CGImage];
    
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyLow forKey:CIDetectorAccuracy]];
    
    NSArray* features = [detector featuresInImage:image];
    
    for(CIFaceFeature* faceObject in features)
    {
        CGRect modifiedFaceBounds = faceObject.bounds;
        modifiedFaceBounds.origin.y = facePicture.size.height-faceObject.bounds.size.height-faceObject.bounds.origin.y;
        CGImageRef imageRef = CGImageCreateWithImageInRect([facePicture CGImage], modifiedFaceBounds);
        UIImage *faceImage = [UIImage imageWithCGImage:imageRef];
        self.cameraView.photoView.image = faceImage;
    }
}

@end
