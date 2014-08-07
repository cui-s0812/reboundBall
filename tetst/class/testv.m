

#import "testv.h"

@implementation testv

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.ball = [[ball alloc]init];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect
{


    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect refreshRect;
    refreshRect.origin.x = 20;
    refreshRect.origin.y = 20;
    refreshRect.size.height = 380;
    refreshRect.size.width = 280;
    CGContextClearRect(context, refreshRect);
    
    CGContextBeginPath(context);
        CGContextMoveToPoint(context,0,0);
        CGContextAddLineToPoint(context,self.width, 0);
        CGContextAddLineToPoint(context,self.width, self.length);
        CGContextAddLineToPoint(context,self.width - 20, self.length);
        CGContextAddLineToPoint(context,self.width - 20, 20);
        CGContextAddLineToPoint(context,20, 20);
        CGContextAddLineToPoint(context,20, self.length);
        CGContextAddLineToPoint(context,0, self.length);
    
        CGContextMoveToPoint(context,self.ball.x,self.ball.y);
        CGContextAddLineToPoint(context,self.ball.x+5, self.ball.y);
        CGContextAddLineToPoint(context,self.ball.x+5, self.ball.y+5);
        CGContextAddLineToPoint(context,self.ball.x, self.ball.y+5);
    CGContextClosePath(context);

    
    [[UIColor blueColor] setFill];
    [[UIColor grayColor] setStroke];
    CGContextDrawPath(context,kCGPathFillStroke);
}

-(void)okonau:(int)x:(int)y:(int)w{
    [self.ball move:x:y:w];
    
    CGRect refreshRect;
    refreshRect.origin.x = 20;
    refreshRect.origin.y = 20;
    refreshRect.size.height = 380;
    refreshRect.size.width = 280;
    
    [self setNeedsDisplayInRect:refreshRect];
}

@end
