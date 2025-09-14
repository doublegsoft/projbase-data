<#import "/$/projbase.ftl" as projbase>
<#if license??>
${objc.license(license)}
</#if>
#include <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController <UIScrollViewDelegate>


@end