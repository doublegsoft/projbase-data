<#import "/$/projbase.ftl" as projbase>
<#if license??>
${objc.license(license)}
</#if>
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow* window;

@end

