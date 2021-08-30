//
//  ViewController.m
//  Homework 29
//
//  Created by Vyacheslav Pronin on 30.08.2021.
//

#import "ViewController.h"
#import "StringArrayDelegate.h"
#import "StringArray.h"


@interface ViewController ()

@property (nonatomic, strong) id<StringArrayDelegate> stringsArrayDelegate;
@property (weak, nonatomic) IBOutlet UILabel *SomeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stringsArrayDelegate = [[StringArray alloc] init];
    NSArray *sortedArray = [self.stringsArrayDelegate getStringArray];
    NSString * stringToDisplay = [sortedArray componentsJoinedByString:@"\n"];
    
    self.SomeLabel.text = stringToDisplay;
    
}


@end
