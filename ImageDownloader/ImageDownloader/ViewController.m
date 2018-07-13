//
//  ViewController.m
//  ImageDownloader
//
//  Created by Edmel John Ricahuerta on 2018-07-12.
//  Copyright © 2018 seneca.map. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) dispatch_queue_t imageQueue;
@property (strong , nonatomic) NSMutableArray * URLs;
@end

@implementation ViewController

int counter = 0;

-(NSMutableArray * ) URLs{
    if(_URLs == nil){
        _URLs = [[NSMutableArray alloc] initWithObjects:@"lobster.jpg",@"pasta.png",@"pizza.jpg",@"steak.jpg", nil];
    }
     return _URLs;
}


- (IBAction)navButtonClicked:(UIButton *)sender {
    
    
    //COUNTER can be refactored
    if([sender.titleLabel.text isEqualToString:@"Next"]){
        if(counter < 3){
            ++counter;
        }
        else{
            counter = 0;
        }
        
    }
    else if([sender.titleLabel.text isEqualToString:@"Previous"]){
        if(counter >0){
            counter--;
        }
        else{
            counter = 3;
        }
    }
    
    
    //QUEUE Threading
    self.imageQueue = dispatch_queue_create("Image", NULL);
    dispatch_async(self.imageQueue, ^{
        NSString* url1 = [NSString stringWithFormat:@"https://raniaarbash.000webhostapp.com/%@",[self.URLs objectAtIndex:counter]];
        NSURL* url = [NSURL URLWithString:url1];
        NSData* data = [[NSData alloc]initWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [UIImage imageWithData:data];
        });
    });
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //LOAD FIRST TIME
    self.imageQueue = dispatch_queue_create("Image", NULL);
    dispatch_async(self.imageQueue, ^{
        NSString* url1 = [NSString stringWithFormat:@"https://raniaarbash.000webhostapp.com/%@",[self.URLs objectAtIndex:counter]];
        NSURL* url = [NSURL URLWithString:url1];
        NSData* data = [[NSData alloc]initWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [UIImage imageWithData:data];
        });
    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
