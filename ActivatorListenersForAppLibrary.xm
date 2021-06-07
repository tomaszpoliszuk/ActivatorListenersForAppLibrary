/* Activator Listeners for App Library
 * Copyright (C) 2020 Tomasz Poliszuk
 *
 * Activator Listeners for App Library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * Activator Listeners for App Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Activator Listeners for App Library. If not, see <https://www.gnu.org/licenses/>.
 */


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
- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	[[%c(SBIconController) sharedInstance] dismissLibraryOverlayAnimated:YES];
}
- (void)dealloc {
	[super dealloc];
}
@end
