//
//  ViewController.m
//  LearnGPUImage
//
//  Created by 郝一鹏 on 2018/8/8.
//  Copyright © 2018 郝一鹏. All rights reserved.
//

#import "ViewController.h"
#import "GPUImageVideoCamera.h"
#import "GPUImageMotionBlurFilter.h"
#import "GPUImageView.h"

@interface ViewController ()

@property (nonatomic, strong) GPUImageVideoCamera *camera;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self createCamera];
}

- (void)createCamera {
	self.camera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:AVCaptureDevicePositionBack];
	self.camera.outputImageOrientation = UIInterfaceOrientationPortrait;
//	GPUImageFilter *filter = [[GPUImageMotionBlurFilter alloc] init];
	GPUImageView *filteredVideoView = [[GPUImageView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:filteredVideoView];
	
	[self.camera addTarget:filteredVideoView];
//	[filter addTarget:filteredVideoView];
	
	[self.camera startCameraCapture];
}

@end
