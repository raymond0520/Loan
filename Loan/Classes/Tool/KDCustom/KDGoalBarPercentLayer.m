

#import "KDGoalBarPercentLayer.h"
#define toRadians(x) ((x)*M_PI / 180.0)
#define toDegrees(x) ((x)*180.0 / M_PI)
#define innerRadius    20  
#define outerRadius    25

@implementation KDGoalBarPercentLayer
@synthesize percent;
@synthesize percent1;

-(void)drawInContext:(CGContextRef)ctx {

    [self DrawCenter:ctx];
    [self DrawRight:ctx];
    [self DrawLeft:ctx];
}
-(void)DrawCenter:(CGContextRef)ctx
{
    CGPoint center = CGPointMake(self.frame.size.width / (2), self.frame.size.height / (2));
    
    if(percent1 + percent >= 1)
    {
        return;
    }
    
    CGFloat delta = -toRadians(360 * (1-percent));
    
    //CGFloat delat1 = -toRadians(360 * percent1);
    
    CGContextSetFillColorWithColor(ctx, RGBACOLOR(255,193,43,1).CGColor);
    
    CGContextSetLineWidth(ctx, 1);
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextSetAllowsAntialiasing(ctx, YES);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, -(M_PI / 2), delta);
    CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, delta - (M_PI / 2), -delta);
    

     CGPathAddLineToPoint(path, NULL, center.x  , center.y-innerRadius);       


    
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    
    CFRelease(path);
}
-(void)DrawRight:(CGContextRef)ctx {
    CGPoint center = CGPointMake(self.frame.size.width / (2), self.frame.size.height / (2));
    
    CGFloat delta = toRadians(360 * percent);

    
    CGContextSetFillColorWithColor(ctx, RGBACOLOR(197,23,43,1).CGColor);
    
    CGContextSetLineWidth(ctx, 1);
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextSetAllowsAntialiasing(ctx, YES);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, -(M_PI / 2), delta);
    CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, delta - (M_PI / 2), -delta);
    CGPathAddLineToPoint(path, NULL, center.x, center.y-innerRadius);
    
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    
    CFRelease(path);
}

-(void)DrawLeft:(CGContextRef)ctx {
    CGPoint center = CGPointMake(self.frame.size.width / (2), self.frame.size.height / (2));
    
    if(percent1 + percent > 1)
    {
        percent1 = 1-percent;
    }
    CGFloat delta = toRadians(360 * percent1);

    
    CGContextSetFillColorWithColor(ctx, RGBACOLOR(255,220,0,1).CGColor);
    
    CGContextSetLineWidth(ctx, 1);
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextSetAllowsAntialiasing(ctx, YES);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, -(M_PI / 2), -delta);
    CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, -(M_PI / 2 )-delta, delta);
    
  //  CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, -(M_PI / 2),M_PI /4);
  // CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, M_PI /4 - (M_PI / 2), -M_PI /4);
    CGPathAddLineToPoint(path, NULL, center.x, center.y-innerRadius);
    
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    
    CFRelease(path);
}

@end
