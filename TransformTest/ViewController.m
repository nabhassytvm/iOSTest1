//
//  ViewController.m
//  TransformTest
//
//  Created by Anil on 19/06/14.
//  Copyright (c) 2014 Anil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void) Set_Comments:(NSMutableArray*)IN_arrComments
{
    UIFont* fontNormal = [UIFont systemFontOfSize:16.0];
    UIFont* fontBold = [UIFont boldSystemFontOfSize:16.0];
    
    NSMutableAttributedString *strAttr1 = [[NSMutableAttributedString alloc] initWithString:@""];
    
    for (int i = 0; i <[IN_arrComments count]; i++) {
        NSDictionary* oDict = [IN_arrComments objectAtIndex:i];
        
        NSString* strName = [oDict objectForKey:@"name"];
        NSString* strText = [oDict objectForKey:@"text"];
        
        NSString* strLine = [NSString stringWithFormat:@"%@: %@\n",
                             strName, strText];
        
        NSMutableAttributedString *strAttr2 = [[NSMutableAttributedString alloc] initWithString:strLine];
        
        [strAttr2 addAttribute:NSForegroundColorAttributeName
                         value:[UIColor darkGrayColor]
                         range:NSMakeRange(0, ([strLine length]))];
        
        [strAttr2 addAttribute:NSFontAttributeName
                         value:fontNormal
                         range:NSMakeRange(0, ([strLine length]))];
        
        [strAttr2 addAttribute:NSFontAttributeName
                         value:fontBold
                         range:NSMakeRange(0, ([strName length]+1))];
        
        [strAttr1 appendAttributedString:strAttr2];
    }
    
    
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:6];
    [style setAlignment:NSTextAlignmentLeft];
    [strAttr1 addAttribute:NSParagraphStyleAttributeName
                     value:style
                     range:NSMakeRange(0, [[strAttr1 mutableString] length])];
    
    
    [m_ctrlTxtComments setAttributedText:strAttr1];
}

-(NSString*) Get_Alphabet:(int) IN_iNo
{
    int iNo = IN_iNo;
    NSString* strAlphabet = @"";
    
    while (iNo > 0)
    {
        iNo--;
        int remainder = iNo % 26;
        NSString* strChar = [NSString stringWithFormat:@"%c", (remainder + 'A')];
        strAlphabet = [NSString stringWithFormat:@"%@%@", strChar, strAlphabet];
        
        iNo = (iNo) / 26;
    }
    
    return strAlphabet;
}

-(void)dismissAlertView:(UIAlertView *)alertView{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

-(IBAction) btnClicked:(id)sender
{
    NSLog(@"Val '%@'", [self Get_Alphabet:67825]);
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"tittle"
                                                        message:@"HEllodsfdf"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil];
    [alertView show];

    [self performSelector:@selector(dismissAlertView:) withObject:alertView afterDelay:1];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray* oArr = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* oDict = [[NSMutableDictionary alloc] init];
    [oDict setObject:@"Anil" forKey:@"name"];
    [oDict setObject:@"Hello sdjfgjd dsfgds  dsiufisduf dsf iuy dsiugydg d iou doig doigd oiu goidugd goiudg dfg" forKey:@"text"];
    [oArr addObject:oDict];
    
    
    oDict = [[NSMutableDictionary alloc] init];
    [oDict setObject:@"Biju" forKey:@"name"];
    [oDict setObject:@"Hello44" forKey:@"text"];
    [oArr addObject:oDict];
    
    [self Set_Comments:oArr];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
