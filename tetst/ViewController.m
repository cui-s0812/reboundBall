

#import "ViewController.h"

#import "testv.h"
#import "ball.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	// Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    CGSize size = CGSizeMake(320, 400);
    av = [[testv alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    [av setLength:(400)];
    [av setWidth:(320)];
    
    
    [[self view] addSubview:av];
    
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.01
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo: nil
                                            repeats: YES];
}


-(IBAction)handlePan:(UIPanGestureRecognizer *)recongizer{
    
    CGPoint translation = [recongizer translationInView:self.view];
    
    
    
    recongizer.view.center = CGPointMake(recongizer.self.view.center.x + translation.x,recongizer.view.center.y);
    
    
    
    [recongizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recongizer.state == UIGestureRecognizerStateEnded) {
        
        
        
        CGPoint velocity = [recongizer velocityInView:self.view];//define the velocity
        
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));//y disabled,define the speed
        
        CGFloat slideMult = magnitude / 280;
        
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        
        CGPoint finalPoint = CGPointMake(recongizer.view.center.x + (velocity.x * slideFactor),
                                         
                                         recongizer.view.center.y );
        
        finalPoint.x = MIN(MAX(finalPoint.x, 20), self.view.bounds.size.width-20);
        
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        
        
        [UIView animateWithDuration:slideFactor*2 delay:0
         
                            options:UIViewAnimationOptionCurveEaseOut animations:^{
                                
                                recongizer.view.center = finalPoint;
                                
                            } completion:nil];
        
        
        
    }
    float recSize = recongizer.self.view.bounds.size.width/2;
   if(recongizer.self.view.center.x>=300-recSize)
        
        recongizer.view.center = CGPointMake(300-recSize,recongizer.view.center.y);
    
    if(recongizer.self.view.center.x<=recSize+20)
        
        recongizer.view.center = CGPointMake(recSize+20,recongizer.view.center.y);}
    



- (void) handleTimer: (NSTimer *) timer
{
    //Do Process
    [av okonau:self.reg_z.view.center.x:self.reg_z.view.center.y:self.reg_z.view.bounds.size.width];
   // NSLog(@"%f", self.reg_z.view.center.x);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   

}


- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

- (IBAction)changeSize:(id)sender {
    
    UISlider * sld = (UISlider *)sender;
    float size = sld.value;
    
    self.imageStick.bounds = CGRectMake(0, 0, 80*size, 24);
   // if (self.imageStick.bounds.origin.x - self.imageStick.bounds.size.width)<20 {
     //   self.imageStick.CG
    //}
   
  

}

- (IBAction)changeBallSpeed:(id)sender {
    UISlider * sld = (UISlider *)sender;
    
}
@end
