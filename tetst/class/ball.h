

#import <Foundation/Foundation.h>

@interface ball : NSObject{
    int x;
    int y;
    float vectorx;
    float vectory;
    float velocity;
}
- (void)move:(int)x:(int)y:(int)w;
-(float)ball_speed:(float)s;
@property (readwrite, nonatomic) int x;
@property (readwrite,nonatomic) int y;
@property (nonatomic) float vectorx;
@property (nonatomic) float vectory;
@property (nonatomic) float velocity;



@end
