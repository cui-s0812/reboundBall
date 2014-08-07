

#import <UIKit/UIKit.h>
#import "testv.h"

@interface ViewController : UIViewController
{
    testv *av;
}
-(IBAction)handlePan:(UIPanGestureRecognizer *)recongizer;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;
@property (weak, nonatomic) IBOutlet UIImageView *imageStick;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *reg_z;
- (IBAction)changeSize:(id)sender;
- (IBAction)changeBallSpeed:(id)sender;

@end
