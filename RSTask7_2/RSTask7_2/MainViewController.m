//
//  MainViewController.m
//  RSTask7_2
//
//  Created by Vladimir Khrolovich on 5.07.21.
//

#import "MainViewController.h"

@interface MainViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *rsLabel;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *authorizeButton;
@property (weak, nonatomic) IBOutlet UIView *codeView;
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UILabel *codeText;

@property NSMutableString *stringNumber;
@property NSString *rightStringNumber;

@property NSString *rightLogin;
@property NSString *rightPassword;

@property UIColor *cClear;
@property UIColor *cBlack;
@property UIColor *cWhite;
@property UIColor *cBlackCoral;
@property UIColor *cVenetianRed;
@property UIColor *cLittleBoyBlue;
@property UIColor *cLittleBoyBlue04;
@property UIColor *cLittleBoyBlue05;
@property UIColor *cGreen;
@property UIColor *cButtonBackground;


@end

@implementation MainViewController
- (void)viewDidLoad {
    //NSLog(@"Loading end......");
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    self.cClear = [UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:0.0];
    self.cWhite = [UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:1.0];
    self.cBlack = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:1.0];
    self.cBlackCoral = [UIColor colorWithRed:76/255.f green:92/255.f blue:104/255.f alpha:1.0];
    self.cVenetianRed = [UIColor colorWithRed:194/255.f green:1/255.f blue:20/255.f alpha:1.0];
    self.cLittleBoyBlue = [UIColor colorWithRed:128/255.f green:164/255.f blue:237/255.f alpha:1.0];
    self.cLittleBoyBlue04 = [UIColor colorWithRed:128/255.f green:164/255.f blue:237/255.f alpha:0.4];
    self.cLittleBoyBlue05 = [UIColor colorWithRed:128/255.f green:164/255.f blue:237/255.f alpha:0.5];
    self.cGreen = [UIColor colorWithRed:145/255.f green:199/255.f blue:177/255.f alpha:1.0];
    self.cButtonBackground = [UIColor colorWithRed:128/255.f green:164/255.f blue:237/255.f alpha:0.2];
    self.rightStringNumber = @"132";
    self.stringNumber = [NSMutableString stringWithString:@""];
    [self.codeText setText:@"_"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rightLogin = @"username";
    self.rightPassword = @"password";
    
    self.loginTextField.layer.borderColor = self.cBlackCoral.CGColor;
    self.loginTextField.layer.borderWidth = 1.5;
    self.loginTextField.layer.cornerRadius = 5;
    [self.loginTextField setEnabled:YES];
    self.loginTextField.text = @"";
    
    self.passwordTextField.layer.borderColor = self.cBlackCoral.CGColor;
    self.passwordTextField.layer.borderWidth = 1.5;
    self.passwordTextField.layer.cornerRadius = 5;
    [self.passwordTextField setEnabled:YES];
    self.passwordTextField.text = @"";
    [self.passwordTextField setSecureTextEntry:YES];
    
    //autorizeButton
    [self.authorizeButton setTitleColor:self.cLittleBoyBlue forState:UIControlStateNormal];
    [self.authorizeButton setTitleColor:self.cLittleBoyBlue04 forState:UIControlStateHighlighted];
    [self.authorizeButton setTitleColor:self.cLittleBoyBlue05 forState:UIControlStateDisabled];
    [self.authorizeButton setImage:[UIImage imageNamed:@"person-fill2x"] forState:UIControlStateHighlighted];
    
    self.authorizeButton.layer.borderWidth = 1.5;
    self.authorizeButton.layer.borderColor = self.cLittleBoyBlue.CGColor;
    self.authorizeButton.layer.cornerRadius = 10;
    [self enableAuthorizeColor];
    [self.authorizeButton setTitleEdgeInsets: UIEdgeInsetsMake(0.0, 5.0, 0.0, 0.0)];
    
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    // codeView
    self.codeView.layer.backgroundColor = self.cWhite.CGColor;
    self.codeView.layer.borderWidth = 2;
    self.codeView.layer.cornerRadius = 10;
    [self.codeView setHidden: YES];
    self.codeView.layer.borderColor = self.cClear.CGColor;
    
    //number buttons
    self.buttonOne.layer.backgroundColor = _cWhite.CGColor;
    self.buttonOne.layer.borderWidth = 1.5;
    self.buttonOne.layer.borderColor = self.cLittleBoyBlue.CGColor;
    self.buttonOne.layer.cornerRadius = self.buttonOne.frame.size.height / 2;
    self.buttonTwo.layer.backgroundColor = _cWhite.CGColor;
    self.buttonTwo.layer.borderWidth = 1.5;
    self.buttonTwo.layer.borderColor = self.cLittleBoyBlue.CGColor;
    self.buttonTwo.layer.cornerRadius = self.buttonTwo.frame.size.height / 2;
    self.buttonThree.layer.backgroundColor = _cWhite.CGColor;
    self.buttonThree.layer.borderWidth = 1.5;
    self.buttonThree.layer.borderColor = self.cLittleBoyBlue.CGColor;
    self.buttonThree.layer.cornerRadius = self.buttonThree.frame.size.height / 2;
    
    
}

- (IBAction)authorize:(UIButton *)sender {
    [self.authorizeButton setBackgroundColor: self.cClear];
    NSString *username = self.loginTextField.text;
    NSString *password = self.passwordTextField.text;
    if ([self.rightLogin isEqualToString: username]) {
        self.loginTextField.layer.borderColor = self.cGreen.CGColor;
    } else {
        self.loginTextField.layer.borderColor = self.cVenetianRed.CGColor;
    }
    if ([self.rightPassword isEqualToString: password]) {
        self.passwordTextField.layer.borderColor = self.cGreen.CGColor;
    } else {
        self.passwordTextField.layer.borderColor = self.cVenetianRed.CGColor;
    }
    if ([self.rightLogin isEqualToString: username] && [self.rightPassword isEqualToString: password]) {
        [self.codeView setHidden:NO];
        [self.loginTextField setEnabled:NO];
        [self.passwordTextField setEnabled:NO];
        [self disableAuthorizeColor];
    }
    
}
- (IBAction)setDefoultColorForFieldBorders:(UITextField *)sender {
    sender.layer.borderColor = self.cBlackCoral.CGColor;
}


- (IBAction)setBackgroundForAuthorizeButton:(UIButton *)sender {
    [self.authorizeButton setBackgroundColor: self.cButtonBackground];
}

- (IBAction)changeBGForNumberWhenPresssed:(UIButton *)sender {
    [sender setBackgroundColor: self.cButtonBackground];
}

- (IBAction)numberIsPressed:(UIButton *)sender {
    [sender setBackgroundColor: self.cClear];
    self.codeView.layer.borderColor = self.cClear.CGColor;
    
    if (self.stringNumber.length >= self.rightStringNumber.length){
        self.stringNumber = [NSMutableString stringWithString:@""];
    }
    
    [self.stringNumber appendString: sender.titleLabel.text];
    [self.codeText setText:self.stringNumber];
    
    if (self.stringNumber.length == self.rightStringNumber.length){
        if ([self.stringNumber isEqualToString: self.rightStringNumber]) {
            self.codeView.layer.borderColor = self.cGreen.CGColor;
            [self InformativeAlertWithmsg];
            
        } else {
            self.codeView.layer.borderColor = self.cVenetianRed.CGColor;
            [self.codeText setText:@"_"];
        }
        //self.stringNumber = [NSMutableString stringWithString:@""];
        //[self.codeText setText:@"_"];
    }
}

-(void) InformativeAlertWithmsg {
  UIAlertController * alertvc = [UIAlertController alertControllerWithTitle: @ "Welcome"
                                 message: @"You are successfuly authorized!" preferredStyle: UIAlertControllerStyleAlert
                                ];
  UIAlertAction * action = [UIAlertAction actionWithTitle: @ "Refresh"
                            style: UIAlertActionStyleDestructive handler: ^ (UIAlertAction * _Nonnull action) {
      
                              NSLog(@ "Dismiss Tapped");
      [self viewDidLoad];
                            }
                           ];
  [alertvc addAction: action];
  [self presentViewController: alertvc animated: true completion: nil];
}

-(void) disableAuthorizeColor {
    [self.authorizeButton setEnabled:NO];
    self.authorizeButton.layer.borderColor = self.cLittleBoyBlue05.CGColor;
    //self.authorizeButton setT
    
    //self.authorizeButton setTit = self.cLittleBoyBlue05;
}

-(void) enableAuthorizeColor {
    [self.authorizeButton setEnabled:YES];
    self.authorizeButton.layer.borderColor = self.cLittleBoyBlue.CGColor;
}
 
-(void)dismissKeyboard {
    [self.loginTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
