//
//  AboutController.h
//  eCard
//
//  Created by Ming Sun on 12-4-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

@interface AboutController : UIViewController

@property (retain, nonatomic) IBOutlet UIButton *urlButton;
@property (retain, nonatomic) IBOutlet UILabel *versionCode;

- (IBAction)urlButtonTapped:(id)sender;
@end
