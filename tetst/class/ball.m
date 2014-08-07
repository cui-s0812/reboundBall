

#import "ball.h"

@implementation ball

@synthesize x;
@synthesize y;

- (id)init
{
   
    if(self == [super init]){
        x = 0;
        y = 0;
        velocity = 2.0;
        vectorx = velocity;
        vectory = velocity;
    }
    return self;
}


- (void)move:(int)x:(int)y:(int)w;
{
    
    self.x += vectorx;
    
    if(self.x < 20){
        vectorx = velocity;
    }
    
    if(self.x > 300){
        vectorx  = velocity * -1;
    }
    
    
    self.y += vectory;
    
    if(self.y < 20){
        vectory = velocity ;
    }
    
    if(self.y > 400 && self.x < (x + w/2) && self.x > (x - w/2)){
        vectory  = velocity * -1;
    }
    
    if(self.y > 410){
        self.x = 50;
        self.y = 50;
    }
}


-(float)ball_speed:(float)s{
    velocity = s * velocity;
    return velocity;
}
@end
