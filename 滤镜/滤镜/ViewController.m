//
//  ViewController.m
//  滤镜
//
//  Created by fairy on 16/7/29.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "ViewController.h"
#import "CIFilterEffect.h"
#import "CIFilter+ColorLUT.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)start:(id)sender {
    
//    UIImage *showImage = [[CIFilterEffect alloc ]initWithImage:self.imageView.image filterName:@"CIColorCube"].result;
//    self.imageView.image = showImage;
    CIFilter *colorCube = [CIFilter colorCubeWithColrLUTImageNamed:@"colorLUTProcessed.png" dimension:64];
//    NSLog(@"222222222%@",[self.imageView.image accessibilityIdentifier]);
    CIImage *inputImage = [[CIImage alloc] initWithImage: self.imageView.image];
    [colorCube setValue:inputImage forKey:@"inputImage"];
    CIImage *outputImage = [colorCube outputImage];
    
    CIContext *context = [CIContext contextWithOptions:[NSDictionary dictionaryWithObject:(__bridge id)(CGColorSpaceCreateDeviceRGB()) forKey:kCIContextWorkingColorSpace]];
    UIImage *newImage = [UIImage imageWithCGImage:[context createCGImage:outputImage fromRect:outputImage.extent]];
    [self.imageView setImage:newImage];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
