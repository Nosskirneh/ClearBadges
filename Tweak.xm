#import <SpringBoard/SBIconView.h>

%hook SBIconView

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    %orig;

    if (self.isEditing) {
        NSUInteger numTaps = [[touches anyObject] tapCount];
        if (numTaps == 2) {
            // Double tap
            [self.icon setBadge:nil];
        }
    }
}

%end
