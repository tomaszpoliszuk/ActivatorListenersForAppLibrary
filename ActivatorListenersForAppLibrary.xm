#import <libactivator/libactivator.h>
#import <UIKit/UIKit.h>
#import <notify.h>

@interface SBHIconManager : NSObject
@end

@interface SBIconController : NSObject
@property (nonatomic, readonly) SBHIconManager *iconManager;
+ (id)sharedInstance;
- (void)dismissLibraryOverlayAnimated:(bool)arg1;
- (void)presentLibraryOverlayForIconManager:(id)arg1;
@end

@interface ActivatorListenersForAppLibraryShow : NSObject <LAListener>
@end
@implementation ActivatorListenersForAppLibraryShow
+ (void)load {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersforapplibrary.show"];
	[pool release];
}
//	- (NSArray *)activator:(LAActivator *)activator requiresCompatibleEventModesForListenerWithName:(NSString *)listenerName {
//	//	return [NSArray arrayWithObjects:@"springboard"];
//		return @[@"springboard"];
//	//	TODO - why it is still allowed on lockscreen?
//	//	TODO - before release restrict only to springboard or find a way to put overlay on top of Lockscreen (check if it's not a security issue) or Application
//	//	TODO - Is it bug with filtering in Activator itself or I did something wrong?
//	}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	SBHIconManager *iconManager = [[%c(SBIconController) sharedInstance] iconManager];
	[[%c(SBIconController) sharedInstance] presentLibraryOverlayForIconManager:(iconManager)];
}
- (void)dealloc {
	[super dealloc];
}
@end

@interface ActivatorListenersForAppLibraryHide : NSObject <LAListener>
@end
@implementation ActivatorListenersForAppLibraryHide
+ (void)load {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.tomaszpoliszuk.activatorlistenersforapplibrary.hide"];
	[pool release];
}
//	- (NSArray *)activator:(LAActivator *)activator requiresCompatibleEventModesForListenerWithName:(NSString *)listenerName {
//	//	return [NSArray arrayWithObjects:@"springboard"];
//		return @[@"springboard"];
//	//	TODO - why it is still allowed on lockscreen?
//	//	TODO - before release restrict only to springboard or find a way to put overlay on top of Lockscreen (check if it's not a security issue) or Application
//	//	TODO - Is it bug with filtering in Activator itself or I did something wrong?
//	}
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(SBIconController) sharedInstance] dismissLibraryOverlayAnimated:YES];
}
- (void)dealloc {
	[super dealloc];
}
@end

