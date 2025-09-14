<#assign modules = {}>
<#assign navigables = []>
<#list app.pages as page>
  <#if page.options["navigable"]?? && page.options["navigable"] == "true">
    <#assign navigables += [page]>
  </#if>
  <#assign strs = page.id?split("/")>
  <#if (strs?size >= 3)>
    <#assign modules += {strs[0]:strs[0]}>
  </#if>
</#list>

// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {

/* Begin PBXBuildFile section */
    SRC000000000000000000B01 /* main.m in Sources */ = {isa = PBXBuildFile; fileRef = SRC000000000000000000M01 /* main.m */; };
		SRC000000000000000000B02 /* AppDelegate.m in Sources */ = {isa = PBXBuildFile; fileRef = SRC000000000000000000M02 /* AppDelegate.m */; };
		SRCCMN000000000000000B01 /* Styles.m in Sources */ = {isa = PBXBuildFile; fileRef = SRCCMN000000000000000M01 /* Styles.m */; };
		SRCCMN000000000000000B02 /* SDK.m in Sources */ = {isa = PBXBuildFile; fileRef = SRCCMN000000000000000M02 /* SDK.m */; };
    SRC0VC000000000000000B01 /* MainViewController.m in Sources */ = {isa = PBXBuildFile; fileRef = SRC0VC000000000000000M01 /* MainViewController.m */; };
    SRC0VC000000000000000B02 /* WelcomeViewController.m in Sources */ = {isa = PBXBuildFile; fileRef = SRC0VC000000000000000M02 /* WelcomeViewController.m */; };
<#list navigables as page>
    SRC0VCNAV000000000000B${(page?index + 1)?string?left_pad(2, "0")} /* ${objectivec.nameType(page.id)}ViewController.m */ = {isa = PBXBuildFile; fileRef = SRC0VCNAV000000000000M${(page?index + 1)?string?left_pad(2, "0")} /* ${objectivec.nameType(page.id)}ViewController.m */; };
</#list>    
<#list modules?keys as module>
  <#assign index = 1>
  <#list app.pages as page>
    <#if page.id?starts_with(module)>
    SRC0VC${module?upper_case?left_pad(6,"0")}000000000B${index?left_pad(2,"0")} /* ${objc.nameType(page.id?replace(module + "/", ""))}ViewController.m */ = {isa = PBXBuildFile; fileRef = SRC0VC${module?upper_case?left_pad(6,"0")}000000000M${index?left_pad(2,"0")} /* ${objc.nameType(page.id?replace(module + "/", ""))}Controller.m */; };
      <#assign index += 1>
    </#if>    
  </#list>      
</#list>
    
    OTH00000000000000BASSETS /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = OTH000000000000000ASSETS /* Assets.xcassets */; };
    
    /***********/
    /*   GUX   */
    /***********/
    AA15A12C2C79C90D00303776 /* GUX.m in Sources */ = {isa = PBXBuildFile; fileRef = AA15A12A2C79C90D00303776 /* GUX.m */; };
    AA4F333D2C7C933D00F37F51 /* XHR.m in Sources */ = {isa = PBXBuildFile; fileRef = AA4F333C2C7C933D00F37F51 /* XHR.m */; };
    AA4F59612C80BF5400846508 /* GXTextField.m in Sources */ = {isa = PBXBuildFile; fileRef = AA4F59602C80BF5400846508 /* GXTextField.m */; };
    AA4F59642C80DA8100846508 /* GXListView.m in Sources */ = {isa = PBXBuildFile; fileRef = AA4F59632C80DA8100846508 /* GXListView.m */; };
    AAF7CA5E2C8374C100AF9574 /* GXGridView.m in Sources */ = {isa = PBXBuildFile; fileRef = AAF7CA5B2C83703600AF9574 /* GXGridView.m */; };
    AA500CF52C7F7BAD00D8AAD2 /* GXTwoColumnForm.m in Sources */ = {isa = PBXBuildFile; fileRef = AA500CF42C7F7BAD00D8AAD2 /* GXTwoColumnForm.m */; };
    AA500CF82C7F7BD600D8AAD2 /* GXSingleColumnForm.m in Sources */ = {isa = PBXBuildFile; fileRef = AA500CF72C7F7BD600D8AAD2 /* GXSingleColumnForm.m */; };
    AAB2B6932C7FE0F800A7F33C /* GXScrollNotification.m in Sources */ = {isa = PBXBuildFile; fileRef = AAB2B6902C7FDCC300A7F33C /* GXScrollNotification.m */; };
    AAF16B752C7B11A9001F8EAB /* GXSwiperNavigator.m in Sources */ = {isa = PBXBuildFile; fileRef = AAF16B742C7B11A9001F8EAB /* GXSwiperNavigator.m */; };
    AA271DEB2C821126000C266D /* GXCircularPercentage.m in Sources */ = {isa = PBXBuildFile; fileRef = AA271DE82C820676000C266D /* GXCircularPercentage.m */; };
    AA271DEC2C821126000C266D /* GXCircularPercentageLayer.m in Sources */ = {isa = PBXBuildFile; fileRef = AA271DEA2C8206A4000C266D /* GXCircularPercentageLayer.m */; };
    
    /*****************/
    /*   iCarousel   */
    /*****************/
    AA500CF02C7F5C1A00D8AAD2 /* iCarousel.m in Sources */ = {isa = PBXBuildFile; fileRef = AA500CEE2C7F5C1A00D8AAD2 /* iCarousel.m */; };
    
    /***********/
    /* VENDORS */
    /***********/
    AAA252402C7D8D0A00DD699C /* Toast.framework in Frameworks */ = {isa = PBXBuildFile; fileRef = TOAST000000000000000000F /* Toast.framework */; };
    AAA252412C7D8D0A00DD699C /* Toast.framework in Embed Frameworks */ = {isa = PBXBuildFile; fileRef = TOAST000000000000000000F /* Toast.framework */; settings = {ATTRIBUTES = (CodeSignOnCopy, RemoveHeadersOnCopy, ); }; };
    AA72D6332C80875900957AAB /* ActionSheetPicker-3.0 in Frameworks */ = {isa = PBXBuildFile; productRef = ACTIONSHEETPICKER00000PD /* ActionSheetPicker-3.0 */; };
    AAA252482C7DB64A00DD699C /* DGCharts in Frameworks */ = {isa = PBXBuildFile; productRef = DGCHARTS00000000000000PD /* DGCharts */; };
    FSCALENDAR0000000000000B /* FSCalendar in Frameworks */ = {isa = PBXBuildFile; productRef = FSCALENDAR000000000000PD /* FSCalendar */; };
    AA4F33402C7CA9D000F37F51 /* DSFSparkline in Frameworks */ = {isa = PBXBuildFile; productRef = DSFSPARKLINE0000000000PD /* DSFSparkline */; };
    AA4F33442C7CA9D000F37F51 /* DSFSparkline-static in Frameworks */ = {isa = PBXBuildFile; productRef = DSFSPARKLINESTATIC00000PD /* DSFSparkline-static */; };
    
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
    SRC000000000000000000M01 /* main.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = main.m; sourceTree = "<group>"; };
    SRC000000000000000000H02 /* AppDelegate.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = AppDelegate.h; sourceTree = "<group>"; };
    SRC000000000000000000M02 /* AppDelegate.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = AppDelegate.m; sourceTree = "<group>"; };
    SRC0VC000000000000000H01 /* MainViewController.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = MainViewController.h; sourceTree = "<group>"; };
    SRC0VC000000000000000M01 /* MainViewController.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = MainViewController.m; sourceTree = "<group>"; };
    SRC0VC000000000000000H02 /* WelcomeViewController.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = WelcomeViewController.h; sourceTree = "<group>"; };
    SRC0VC000000000000000M02 /* WelcomeViewController.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = WelcomeViewController.m; sourceTree = "<group>"; };      
<#list navigables as page>
    SRC0VCNAV000000000000H${(page?index + 1)?string?left_pad(2, "0")} /* ${objectivec.nameType(page.id)}ViewController.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = ${objectivec.nameType(page.id)}ViewController.h; sourceTree = "<group>"; }; 
    SRC0VCNAV000000000000M${(page?index + 1)?string?left_pad(2, "0")} /* ${objectivec.nameType(page.id)}ViewController.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = ${objectivec.nameType(page.id)}ViewController.m; sourceTree = "<group>"; }; 
</#list>   
<#list modules?keys as module>
  <#assign index = 1>
  <#list app.pages as page>
    <#if page.id?starts_with(module)>
    SRC0VC${module?upper_case?left_pad(6,"0")}000000000H${index?left_pad(2,"0")} /* ${objc.nameType(page.id?replace(module + "/", ""))}ViewController.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = ${objectivec.nameType(page.id?replace(module + "/", ""))}ViewController.h; sourceTree = "<group>"; }; 
    SRC0VC${module?upper_case?left_pad(6,"0")}000000000M${index?left_pad(2,"0")} /* ${objc.nameType(page.id?replace(module + "/", ""))}ViewController.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = ${objectivec.nameType(page.id?replace(module + "/", ""))}ViewController.m; sourceTree = "<group>"; }; 
      <#assign index += 1>
    </#if>    
  </#list>      
</#list>
    SRCCMN000000000000000H01 /* Styles.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = Styles.h; sourceTree = "<group>"; };
    SRCCMN000000000000000M01 /* Styles.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = Styles.m; sourceTree = "<group>"; };
    SRCCMN000000000000000H02 /* SDK.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = SDK.h; sourceTree = "<group>"; };
    SRCCMN000000000000000M02 /* SDK.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = SDK.m; sourceTree = "<group>"; };
    
    OTH0000000000000ICONFONT /* iconfont.ttf */ = {isa = PBXFileReference; lastKnownFileType = file; path = iconfont.ttf; sourceTree = "<group>"; };
    OTH000000000000000ASSETS /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
    OTH00000000000000000INFO /* Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = Info.plist; sourceTree = "<group>"; };
    000000000000000000README /* README.md */ = {isa = PBXFileReference; lastKnownFileType = text; path = README.md; sourceTree = "<group>"; };
    PRD000000000000000000APP /* ${app.name}.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = "${app.name}.app"; sourceTree = BUILT_PRODUCTS_DIR; };

    /***********/
    /*   GUX   */
    /***********/
    AA15A12A2C79C90D00303776 /* GUX.m */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; path = GUX.m; sourceTree = "<group>"; };
    AA15A12B2C79C90D00303776 /* GUX.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; path = GUX.h; sourceTree = "<group>"; };
    AA4F333B2C7C933300F37F51 /* XHR.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = XHR.h; sourceTree = "<group>"; };
    AA4F333C2C7C933D00F37F51 /* XHR.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = XHR.m; sourceTree = "<group>"; };
    AA4F595F2C80BF4300846508 /* GXTextField.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXTextField.h; sourceTree = "<group>"; };
    AA4F59602C80BF5400846508 /* GXTextField.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = GXTextField.m; sourceTree = "<group>"; };
    AA4F59622C80DA7100846508 /* GXListView.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXListView.h; sourceTree = "<group>"; };
    AA4F59632C80DA8100846508 /* GXListView.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = GXListView.m; sourceTree = "<group>"; };
    AA4F59652C80DA9000846508 /* GXListViewDelegate.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXListViewDelegate.h; sourceTree = "<group>"; };
    AA4F59672C80DAAD00846508 /* GXListViewDataSource.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXListViewDataSource.h; sourceTree = "<group>"; };
    AA271DE72C820661000C266D /* GXCircularPercentage.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXCircularPercentage.h; sourceTree = "<group>"; };
    AA271DE82C820676000C266D /* GXCircularPercentage.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = GXCircularPercentage.m; sourceTree = "<group>"; };
    AA271DE92C82068D000C266D /* GXCircularPercentageLayer.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXCircularPercentageLayer.h; sourceTree = "<group>"; };
    AA271DEA2C8206A4000C266D /* GXCircularPercentageLayer.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = GXCircularPercentageLayer.m; sourceTree = "<group>"; };
    AA500CF32C7F7B9E00D8AAD2 /* GXTwoColumnForm.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXTwoColumnForm.h; sourceTree = "<group>"; };
    AA500CF42C7F7BAD00D8AAD2 /* GXTwoColumnForm.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = GXTwoColumnForm.m; sourceTree = "<group>"; };
    AA500CF62C7F7BC200D8AAD2 /* GXSingleColumnForm.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXSingleColumnForm.h; sourceTree = "<group>"; };
    AA500CF72C7F7BD600D8AAD2 /* GXSingleColumnForm.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = GXSingleColumnForm.m; sourceTree = "<group>"; };
    AA72D6282C803F8700957AAB /* GXScrollNotificationDataSource.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; path = GXScrollNotificationDataSource.h; sourceTree = "<group>"; };
    AA72D6292C803F8700957AAB /* GXScrollNotificationDelegate.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; path = GXScrollNotificationDelegate.h; sourceTree = "<group>"; };
    AA72D62A2C803FA800957AAB /* GXSwiperNavigatorDelegate.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXSwiperNavigatorDelegate.h; sourceTree = "<group>"; };
    AA72D62D2C803FD300957AAB /* GXSwiperNavigatorDataSource.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXSwiperNavigatorDataSource.h; sourceTree = "<group>"; };
    AAB2B68F2C7FDCB200A7F33C /* GXScrollNotification.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXScrollNotification.h; sourceTree = "<group>"; };
    AAB2B6902C7FDCC300A7F33C /* GXScrollNotification.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = GXScrollNotification.m; sourceTree = "<group>"; };
    AAF16B732C7B11A9001F8EAB /* GXSwiperNavigator.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; path = GXSwiperNavigator.h; sourceTree = "<group>"; };
    AAF16B742C7B11A9001F8EAB /* GXSwiperNavigator.m */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; path = GXSwiperNavigator.m; sourceTree = "<group>"; };
    AAF7CA5A2C83702600AF9574 /* GXGridView.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXGridView.h; sourceTree = "<group>"; };
    AAF7CA5B2C83703600AF9574 /* GXGridView.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = GXGridView.m; sourceTree = "<group>"; };
    AAF7CA5C2C83704700AF9574 /* GXGridViewDataSource.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXGridViewDataSource.h; sourceTree = "<group>"; };
    AAF7CA5D2C83705900AF9574 /* GXGridViewDelegate.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = GXGridViewDelegate.h; sourceTree = "<group>"; };
    
    /*****************/
    /*   iCarousel   */
    /*****************/
    AA500CEF2C7F5C1A00D8AAD2 /* iCarousel.h */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.h; path = iCarousel.h; sourceTree = "<group>"; };
    AA500CEE2C7F5C1A00D8AAD2 /* iCarousel.m */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; path = iCarousel.m; sourceTree = "<group>"; };  
    
    /******************/
    /*   FRAMEWORKS   */
    /******************/
    TOAST000000000000000000P /* Toast.xcodeproj */ = {isa = PBXFileReference; lastKnownFileType = "wrapper.pb-project"; name = Toast.xcodeproj; path = "Toast-4.1.1/Toast.xcodeproj"; sourceTree = "<group>"; };
    TOAST000000000000000000F /* Toast.framework */ = {isa = PBXFileReference; explicitFileType = wrapper.framework; path = Toast.framework; sourceTree = BUILT_PRODUCTS_DIR; };
/* End PBXFileReference section */

/* Begin PBXGroup section */
		000000000000000000000000 = {
			isa = PBXGroup;
			children = (
				SRC000000000000000000000 /* Sources */,
				OTH000000000000000000000 /* Others */,
				VDR000000000000000000000 /* Vendors */,
				FWK000000000000000000000 /* Frameworks */,
				PRD000000000000000000000 /* Products */,
				000000000000000000README /* README.md */,
			);
			sourceTree = "<group>";
		};
		FWK000000000000000000000 /* Frameworks */ = {
      isa = PBXGroup;
      children = (
        TOAST000000000000000000F /* Toast.framework */,
      );
      name = Frameworks;
      sourceTree = "<group>";
    };
		SRC000000000000000000000 /* Sources */ = {
      isa = PBXGroup;
      children = (
        SRC0VC000000000000000000 /* VC */,
        SRCCMN000000000000000000 /* Common */,
        SRC000000000000000000H02 /* AppDelegate.h */,
        SRC000000000000000000M02 /* AppDelegate.m */,
        SRC000000000000000000M01 /* main.m */,
      );
      path = Sources;
      sourceTree = "<group>";
    };
		OTH000000000000000000000 /* Others */ = {
      isa = PBXGroup;
      children = (
        OTH000000000000000ASSETS /* Assets */,
        OTH00000000000000000INFO /* Info.plist */,
      );
      path = Others;
      sourceTree = "<group>";
    };
		VDR000000000000000000000 /* Vendors */ = {
			isa = PBXGroup;
			children = (
				VDRGUX000000000000000000 /* GUX */,
				TOAST000000000000000000P /* Toast.xcodeproj */,
				AA500CEC2C7F5BD900D8AAD2 /* iCarousel-1.8.3 */,
			);
			path = Vendors;
			sourceTree = "<group>";
		};
		PRD000000000000000000000 /* Products */ = {
      isa = PBXGroup;
      children = (
        PRD000000000000000000APP /* ${app.name}.app */,
      );
      name = Products;
      sourceTree = "<group>";
    };
		
		SRC0VC000000000000000000 /* VC */ = {
			isa = PBXGroup;
			children = (
			  SRC0VCCMN000000000000000 /* Common */,
        SRC0VCNAV000000000000000 /* Navigable */,
        SRC0VC0PG000000000000000 /* Page */,	
        SRC0VC000000000000000H01 /* MainViewController.h */,  
        SRC0VC000000000000000M01 /* MainViewController.m */,  
        SRC0VC000000000000000H02 /* WelcomeViewController.h */,  
        SRC0VC000000000000000M02 /* WelcomeViewController.m */,  
			);
			path = VC;
			sourceTree = "<group>";
		};
		
		SRC0VCCMN000000000000000 /* VC/Common */ = {
      isa = PBXGroup;
      children = (
      );
      path = Common;
      sourceTree = "<group>";
    };
    SRC0VCNAV000000000000000 /* VC/Navigable */ = {
      isa = PBXGroup;
      children = (
<#list navigables as page>
        SRC0VCNAV000000000000H${(page?index + 1)?string?left_pad(2, "0")}, /* ${objectivec.nameType(page.id)}ViewController.h */
        SRC0VCNAV000000000000M${(page?index + 1)?string?left_pad(2, "0")}, /* ${objectivec.nameType(page.id)}ViewController.m */
</#list>      
      );
      path = Navigable;
      sourceTree = "<group>";
    };
    SRC0VC0PG000000000000000 /* VC/Page */ = {
      isa = PBXGroup;
      children = (
<#list modules?keys as module>
        SRC0VC0PG${module?upper_case?left_pad(6, "0")}000000000, /* ${module?upper_case} */
</#list>       
      );
      path = Page;
      sourceTree = "<group>";
    };
<#list modules?keys as module>
    SRC0VC0PG${module?upper_case?left_pad(6, "0")}000000000 /* VC/Page/${module?upper_case} */ = {
      isa = PBXGroup;
      children = (    
  <#assign index = 1>
  <#list app.pages as page>
    <#if page.id?starts_with(module)>
        SRC0VC${module?upper_case?left_pad(6,"0")}000000000H${index?left_pad(2,"0")} /* ${objc.nameType(page.id?replace(module + "/", ""))}ViewController.h */,
        SRC0VC${module?upper_case?left_pad(6,"0")}000000000M${index?left_pad(2,"0")} /* ${objc.nameType(page.id?replace(module + "/", ""))}ViewController.m */,
      <#assign index += 1>
    </#if>    
  </#list>          
      );
      path = ${module?upper_case};
      sourceTree = "<group>";
    };    
</#list>  
		SRCCMN000000000000000000 /* Common */ = {
			isa = PBXGroup;
			children = (
				SRCCMN000000000000000H01 /* Styles.h */,
				SRCCMN000000000000000M01 /* Styles.m */,
				SRCCMN000000000000000H02 /* SDK.h */,
				SRCCMN000000000000000M02 /* SDK.m */,
			);
			path = Common;
			sourceTree = "<group>";
		};
		
		/***********/
    /*   GUX   */
    /***********/
    VDRGUX000000000000000000 /* GUX */ = {
      isa = PBXGroup;
      children = (
        AA15A1232C79C50000303776 /* Common */,
        AAF16B712C7B1146001F8EAB /* Widget */,
      );
      path = GUX;
      sourceTree = "<group>";
    };
    AA15A1232C79C50000303776 /* Common */ = {
      isa = PBXGroup;
      children = (
        AA15A12B2C79C90D00303776 /* GUX.h */,
        AA15A12A2C79C90D00303776 /* GUX.m */,
        AA4F333B2C7C933300F37F51 /* XHR.h */,
        AA4F333C2C7C933D00F37F51 /* XHR.m */,
      );
      path = Common;
      sourceTree = "<group>";
    };
    AAF16B712C7B1146001F8EAB /* Widget */ = {
      isa = PBXGroup;
      children = (
        AA4F595E2C80BF2900846508 /* Common */,
        AA4F595B2C80A1FD00846508 /* GridView */,
        AA4F595A2C809E7800846508 /* ListView */,
        AAB2B68E2C7FDC9F00A7F33C /* ScrollNotification */,
        AA500CF22C7F7B8500D8AAD2 /* TwoColumnForm */,
        AA500CF12C7F7B7500D8AAD2 /* SingleColumnForm */,
        AAF16B722C7B114D001F8EAB /* SwiperNavigator */,
        AA271DE62C81E614000C266D /* CircularPercentage */,
      );
      path = Widget;
      sourceTree = "<group>";
    };
    AA4F595E2C80BF2900846508 /* Common */ = {
      isa = PBXGroup;
      children = (
        AA4F595F2C80BF4300846508 /* GXTextField.h */,
        AA4F59602C80BF5400846508 /* GXTextField.m */,
      );
      path = Common;
      sourceTree = "<group>";
    };
    AAF16B722C7B114D001F8EAB /* SwiperNavigator */ = {
      isa = PBXGroup;
      children = (
        AAF16B732C7B11A9001F8EAB /* GXSwiperNavigator.h */,
        AAF16B742C7B11A9001F8EAB /* GXSwiperNavigator.m */,
        AA72D62D2C803FD300957AAB /* GXSwiperNavigatorDataSource.h */,
        AA72D62A2C803FA800957AAB /* GXSwiperNavigatorDelegate.h */,
      );
      path = SwiperNavigator;
      sourceTree = "<group>";
    };
    AA271DE62C81E614000C266D /* CircularPercentage */ = {
      isa = PBXGroup;
      children = (
        AA271DE72C820661000C266D /* GXCircularPercentage.h */,
        AA271DE82C820676000C266D /* GXCircularPercentage.m */,
        AA271DE92C82068D000C266D /* GXCircularPercentageLayer.h */,
        AA271DEA2C8206A4000C266D /* GXCircularPercentageLayer.m */,
      );
      path = CircularPercentage;
      sourceTree = "<group>";
    };
    AA4F595A2C809E7800846508 /* ListView */ = {
      isa = PBXGroup;
      children = (
        AA4F59622C80DA7100846508 /* GXListView.h */,
        AA4F59632C80DA8100846508 /* GXListView.m */,
        AA4F59672C80DAAD00846508 /* GXListViewDataSource.h */,
        AA4F59652C80DA9000846508 /* GXListViewDelegate.h */,
      );
      path = ListView;
      sourceTree = "<group>";
    };
    AA4F595B2C80A1FD00846508 /* GridView */ = {
      isa = PBXGroup;
      children = (
        AAF7CA5A2C83702600AF9574 /* GXGridView.h */,
        AAF7CA5B2C83703600AF9574 /* GXGridView.m */,
        AAF7CA5C2C83704700AF9574 /* GXGridViewDataSource.h */,
        AAF7CA5D2C83705900AF9574 /* GXGridViewDelegate.h */,
      );
      path = GridView;
      sourceTree = "<group>";
    };
    AA500CF12C7F7B7500D8AAD2 /* SingleColumnForm */ = {
      isa = PBXGroup;
      children = (
        AA500CF62C7F7BC200D8AAD2 /* GXSingleColumnForm.h */,
        AA500CF72C7F7BD600D8AAD2 /* GXSingleColumnForm.m */,
      );
      path = SingleColumnForm;
      sourceTree = "<group>";
    };
    AA500CF22C7F7B8500D8AAD2 /* TwoColumnForm */ = {
      isa = PBXGroup;
      children = (
        AA500CF32C7F7B9E00D8AAD2 /* GXTwoColumnForm.h */,
        AA500CF42C7F7BAD00D8AAD2 /* GXTwoColumnForm.m */,
      );
      path = TwoColumnForm;
      sourceTree = "<group>";
    };
    AAB2B68E2C7FDC9F00A7F33C /* ScrollNotification */ = {
      isa = PBXGroup;
      children = (
        AAB2B68F2C7FDCB200A7F33C /* GXScrollNotification.h */,
        AAB2B6902C7FDCC300A7F33C /* GXScrollNotification.m */,
        AA72D6282C803F8700957AAB /* GXScrollNotificationDataSource.h */,
        AA72D6292C803F8700957AAB /* GXScrollNotificationDelegate.h */,
      );
      path = ScrollNotification;
      sourceTree = "<group>";
    };
/* End PBXGround section */

/* Begin PBXNativeTarget section */
    TGT000000000000000000001 /* ${app.name} */ = {
      isa = PBXNativeTarget;
      buildConfigurationList = AAD1D9492B94F3000023ACDB /* Build configuration list for PBXNativeTarget "${app.name}" */;
      buildPhases = (
        SRC00000000000000000000B /* Sources */,
        FWK00000000000000000000B /* Frameworks */,
        AAD1D92E2B94F2FE0023ACDB /* Resources */,
      );
      buildRules = (
      );
      dependencies = (
      );
      packageProductDependencies = (
        FSCALENDAR000000000000PD /* FSCalendar */,
        DSFSPARKLINE0000000000PD /* DSFSparkline */,
        DSFSPARKLINESTATIC00000PD /* DSFSparkline-static */,
        DGCHARTS00000000000000PD /* DGCharts */,
        ACTIONSHEETPICKER00000PD /* ActionSheetPicker-3.0 */,
      );
      name = "${app.name}";
      productName = "${app.name}";
      productReference = PRD000000000000000000APP /* ${app.name}.app */;
      productType = "com.apple.product-type.application";
    };
    AA500CEC2C7F5BD900D8AAD2 /* iCarousel-1.8.3 */ = {
      isa = PBXGroup;
      children = (
        AA500CED2C7F5BF400D8AAD2 /* iCarousel */,
      );
      path = "iCarousel-1.8.3";
      sourceTree = "<group>";
    };
    AA500CED2C7F5BF400D8AAD2 /* iCarousel */ = {
      isa = PBXGroup;
      children = (
        AA500CEF2C7F5C1A00D8AAD2 /* iCarousel.h */,
        AA500CEE2C7F5C1A00D8AAD2 /* iCarousel.m */,
      );
      path = iCarousel;
      sourceTree = "<group>";
    };
/* End PBXNativeTarget section */

/* Begin PBXProject section */
    AAD1D9282B94F2FE0023ACDB /* Project object */ = {
      isa = PBXProject;
      attributes = {
        BuildIndependentTargetsInParallel = 1;
        LastUpgradeCheck = 1500;
        TargetAttributes = {
          TGT000000000000000000001 = {
            CreatedOnToolsVersion = 15.0.1;
          };
        };
      };
      buildConfigurationList = AAD1D92B2B94F2FE0023ACDB /* Build configuration list for PBXProject "${app.name}" */;
      compatibilityVersion = "Xcode 14.0";
      developmentRegion = en;
      hasScannedForEncodings = 0;
      knownRegions = (
        en,
        Base,
      );
      mainGroup = 000000000000000000000000;
      packageReferences = (
        FSCALENDAR000000000000PR /* XCLocalSwiftPackageReference "Vendors/FSCalendar-2.8.3" */,
        DSFSPARKLINE0000000000PR /* XCLocalSwiftPackageReference "Vendors/DSFSparkline-6.0.2" */,
        DGCHARTS00000000000000PR /* XCLocalSwiftPackageReference "Vendors/Charts-5.1.0" */,
        ACTIONSHEETPICKER00000PR /* XCLocalSwiftPackageReference "Vendors/ActionSheetPicker-3.0-2.7.4" */,
      );
      productRefGroup = AAD1D9312B94F2FE0023ACDB /* Products */;
      projectDirPath = "";
      projectRoot = "";
      projectReferences = (

      );
      targets = (
        TGT000000000000000000001 /* ${app.name} */,
      );
    };
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
    AAD1D92E2B94F2FE0023ACDB /* Resources */ = {
      isa = PBXResourcesBuildPhase;
      buildActionMask = 2147483647;
      files = (
        OTH00000000000000BASSETS /* Assets.xcassets in Resources */,
      );
      runOnlyForDeploymentPostprocessing = 0;
    };
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
    SRC00000000000000000000B /* Sources */ = {
      isa = PBXSourcesBuildPhase;
      buildActionMask = 2147483647;
      files = (
        SRC000000000000000000B01 /* main.m */,
        SRC000000000000000000B02 /* AppDelegate.m */,
        SRCCMN000000000000000B01 /* Styles.m */,
        SRCCMN000000000000000B02 /* SDK.m */,
        SRC0VC000000000000000B01 /* MainViewController.m */,
        SRC0VC000000000000000B02 /* WelcomeViewController.m */,
<#list navigables as page>
        SRC0VCNAV000000000000B${(page?index + 1)?string?left_pad(2, "0")} /* ${objectivec.nameType(page.id)}ViewController.m */,
</#list>        
<#list modules?keys as module>
  <#assign index = 1>
  <#list app.pages as page>
    <#if page.id?starts_with(module)>
        SRC0VC${module?upper_case?left_pad(6,"0")}000000000B${index?left_pad(2,"0")} /* ${objc.nameType(page.id?replace(module + "/", ""))}ViewController.m */,
      <#assign index += 1>  
    </#if>    
  </#list>      
</#list>    

        /***********/
        /*   GUX   */
        /***********/  
        AA15A12C2C79C90D00303776 /* GUX.m in Sources */,
        AA4F333D2C7C933D00F37F51 /* XHR.m in Sources */,
        AAF7CA5E2C8374C100AF9574 /* GXGridView.m in Sources */,
        AA271DEB2C821126000C266D /* GXCircularPercentage.m in Sources */,
        AA271DEC2C821126000C266D /* GXCircularPercentageLayer.m in Sources */,
        AAB2B6932C7FE0F800A7F33C /* GXScrollNotification.m in Sources */,
        AAF16B752C7B11A9001F8EAB /* GXSwiperNavigator.m in Sources */,
        AA4F59612C80BF5400846508 /* GXTextField.m in Sources */,
        AA4F59642C80DA8100846508 /* GXListView.m in Sources */,
        AA500CF82C7F7BD600D8AAD2 /* GXSingleColumnForm.m in Sources */,
        AA500CF52C7F7BAD00D8AAD2 /* GXTwoColumnForm.m in Sources */,
        
        /*****************/
        /*   iCarousel   */
        /*****************/
        AA500CF02C7F5C1A00D8AAD2 /* iCarousel.m in Sources */
      );
      runOnlyForDeploymentPostprocessing = 0;
    };
/* End PBXSourcesBuildPhase section */

/* Begin PBXFrameworksBuildPhase section */
    FWK00000000000000000000B /* Frameworks */ = {
      isa = PBXFrameworksBuildPhase;
      buildActionMask = 2147483647;
      files = (
        AA4F33442C7CA9D000F37F51 /* DSFSparkline-static in Frameworks */,
        FSCALENDAR0000000000000B /* FSCalendar in Frameworks */,
        AAA252482C7DB64A00DD699C /* DGCharts in Frameworks */,
        AAA252402C7D8D0A00DD699C /* Toast.framework in Frameworks */,
        AA72D6332C80875900957AAB /* ActionSheetPicker-3.0 in Frameworks */,
        AA4F33402C7CA9D000F37F51 /* DSFSparkline in Frameworks */,
      );
      runOnlyForDeploymentPostprocessing = 0;
    };
/* End PBXFrameworksBuildPhase section */

/* Begin PBXVariantGroup section */
    AAD1D93C2B94F2FE0023ACDB /* Main.storyboard */ = {
      isa = PBXVariantGroup;
      children = (
        AAD1D93D2B94F2FE0023ACDB /* Base */,
      );
      name = Main.storyboard;
      sourceTree = "<group>";
    };
    AAD1D9412B94F3000023ACDB /* LaunchScreen.storyboard */ = {
      isa = PBXVariantGroup;
      children = (
        AAD1D9422B94F3000023ACDB /* Base */,
      );
      name = LaunchScreen.storyboard;
      sourceTree = "<group>";
    };
/* End PBXVariantGroup section */

/* Begin XCBuildConfiguration section */
    AAD1D9472B94F3000023ACDB /* Debug */ = {
      isa = XCBuildConfiguration;
      buildSettings = {
        ALWAYS_SEARCH_USER_PATHS = NO;
        ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
        CLANG_ANALYZER_NONNULL = YES;
        CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
        CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
        CLANG_ENABLE_MODULES = YES;
        CLANG_ENABLE_OBJC_ARC = YES;
        CLANG_ENABLE_OBJC_WEAK = YES;
        CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
        CLANG_WARN_BOOL_CONVERSION = YES;
        CLANG_WARN_COMMA = YES;
        CLANG_WARN_CONSTANT_CONVERSION = YES;
        CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
        CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
        CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
        CLANG_WARN_EMPTY_BODY = YES;
        CLANG_WARN_ENUM_CONVERSION = YES;
        CLANG_WARN_INFINITE_RECURSION = YES;
        CLANG_WARN_INT_CONVERSION = YES;
        CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
        CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
        CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
        CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
        CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
        CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
        CLANG_WARN_STRICT_PROTOTYPES = YES;
        CLANG_WARN_SUSPICIOUS_MOVE = YES;
        CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
        CLANG_WARN_UNREACHABLE_CODE = YES;
        CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
        COPY_PHASE_STRIP = NO;
        DEBUG_INFORMATION_FORMAT = dwarf;
        ENABLE_STRICT_OBJC_MSGSEND = YES;
        ENABLE_TESTABILITY = YES;
        ENABLE_USER_SCRIPT_SANDBOXING = YES;
        GCC_C_LANGUAGE_STANDARD = gnu17;
        GCC_DYNAMIC_NO_PIC = NO;
        GCC_NO_COMMON_BLOCKS = YES;
        GCC_OPTIMIZATION_LEVEL = 0;
        GCC_PREPROCESSOR_DEFINITIONS = (
          "DEBUG=1",
          "$(inherited)",
        );
        GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
        GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
        GCC_WARN_UNDECLARED_SELECTOR = YES;
        GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
        GCC_WARN_UNUSED_FUNCTION = YES;
        GCC_WARN_UNUSED_VARIABLE = YES;
        IPHONEOS_DEPLOYMENT_TARGET = 17.0;
        LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
        MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
        MTL_FAST_MATH = YES;
        ONLY_ACTIVE_ARCH = YES;
        SDKROOT = iphoneos;
      };
      name = Debug;
    };
    AAD1D9482B94F3000023ACDB /* Release */ = {
      isa = XCBuildConfiguration;
      buildSettings = {
        ALWAYS_SEARCH_USER_PATHS = NO;
        ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
        CLANG_ANALYZER_NONNULL = YES;
        CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
        CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
        CLANG_ENABLE_MODULES = YES;
        CLANG_ENABLE_OBJC_ARC = YES;
        CLANG_ENABLE_OBJC_WEAK = YES;
        CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
        CLANG_WARN_BOOL_CONVERSION = YES;
        CLANG_WARN_COMMA = YES;
        CLANG_WARN_CONSTANT_CONVERSION = YES;
        CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
        CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
        CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
        CLANG_WARN_EMPTY_BODY = YES;
        CLANG_WARN_ENUM_CONVERSION = YES;
        CLANG_WARN_INFINITE_RECURSION = YES;
        CLANG_WARN_INT_CONVERSION = YES;
        CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
        CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
        CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
        CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
        CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
        CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
        CLANG_WARN_STRICT_PROTOTYPES = YES;
        CLANG_WARN_SUSPICIOUS_MOVE = YES;
        CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
        CLANG_WARN_UNREACHABLE_CODE = YES;
        CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
        COPY_PHASE_STRIP = NO;
        DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
        ENABLE_NS_ASSERTIONS = NO;
        ENABLE_STRICT_OBJC_MSGSEND = YES;
        ENABLE_USER_SCRIPT_SANDBOXING = YES;
        GCC_C_LANGUAGE_STANDARD = gnu17;
        GCC_NO_COMMON_BLOCKS = YES;
        GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
        GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
        GCC_WARN_UNDECLARED_SELECTOR = YES;
        GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
        GCC_WARN_UNUSED_FUNCTION = YES;
        GCC_WARN_UNUSED_VARIABLE = YES;
        IPHONEOS_DEPLOYMENT_TARGET = 17.0;
        LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
        MTL_ENABLE_DEBUG_INFO = NO;
        MTL_FAST_MATH = YES;
        SDKROOT = iphoneos;
        VALIDATE_PRODUCT = YES;
      };
      name = Release;
    };
    AAD1D94A2B94F3000023ACDB /* Debug */ = {
      isa = XCBuildConfiguration;
      buildSettings = {
        ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
        ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
        CODE_SIGN_STYLE = Automatic;
        CURRENT_PROJECT_VERSION = 1;
        DEVELOPMENT_TEAM = H6X9G3CYFJ;
        GENERATE_INFOPLIST_FILE = YES;
        HEADER_SEARCH_PATHS = (
          Vendors,
          Sources,
          "Vendors/Toast-4.1.1",
          "Vendors/iCarousel-1.8.3/iCarousel",
        );
        INFOPLIST_FILE = Others/Info.plist;
        INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
        INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
        INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
        LD_RUNPATH_SEARCH_PATHS = (
          "$(inherited)",
          "@executable_path/Frameworks",
        );
        MARKETING_VERSION = 1.0;
        PRODUCT_BUNDLE_IDENTIFIER = io.doublegsoft.projbase.${app.name};
        PRODUCT_NAME = "$(TARGET_NAME)";
        SWIFT_EMIT_LOC_STRINGS = YES;
        TARGETED_DEVICE_FAMILY = "1,2";
      };
      name = Debug;
    };
    AAD1D94B2B94F3000023ACDB /* Release */ = {
      isa = XCBuildConfiguration;
      buildSettings = {
        ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
        ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
        CODE_SIGN_STYLE = Automatic;
        CURRENT_PROJECT_VERSION = 1;
        DEVELOPMENT_TEAM = H6X9G3CYFJ;
        GENERATE_INFOPLIST_FILE = YES;
        HEADER_SEARCH_PATHS = (
          Vendors,
          Sources,
          "Vendors/Toast-4.1.1",
          "Vendors/iCarousel-1.8.3/iCarousel",
        );
        INFOPLIST_FILE = Others/Info.plist;
        INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
        INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
        INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
        LD_RUNPATH_SEARCH_PATHS = (
          "$(inherited)",
          "@executable_path/Frameworks",
        );
        MARKETING_VERSION = 1.0;
        PRODUCT_BUNDLE_IDENTIFIER = io.doublegsoft.projbase.${app.name};
        PRODUCT_NAME = "$(TARGET_NAME)";
        SWIFT_EMIT_LOC_STRINGS = YES;
        TARGETED_DEVICE_FAMILY = "1,2";
      };
      name = Release;
    };
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
    AAD1D92B2B94F2FE0023ACDB /* Build configuration list for PBXProject "${app.name}" */ = {
      isa = XCConfigurationList;
      buildConfigurations = (
        AAD1D9472B94F3000023ACDB /* Debug */,
        AAD1D9482B94F3000023ACDB /* Release */,
      );
      defaultConfigurationIsVisible = 0;
      defaultConfigurationName = Release;
    };
    AAD1D9492B94F3000023ACDB /* Build configuration list for PBXNativeTarget "${app.name}" */ = {
      isa = XCConfigurationList;
      buildConfigurations = (
        AAD1D94A2B94F3000023ACDB /* Debug */,
        AAD1D94B2B94F3000023ACDB /* Release */,
      );
      defaultConfigurationIsVisible = 0;
      defaultConfigurationName = Release;
    };
/* End XCConfigurationList section */

/* Begin XCLocalSwiftPackageReference section */
    DSFSPARKLINE0000000000PR /* XCLocalSwiftPackageReference "Vendors/DSFSparkline-6.0.2" */ = {
      isa = XCLocalSwiftPackageReference;
      relativePath = "Vendors/DSFSparkline-6.0.2";
    };
    ACTIONSHEETPICKER00000PR /* XCLocalSwiftPackageReference "Vendors/ActionSheetPicker-3.0-2.7.4" */ = {
      isa = XCLocalSwiftPackageReference;
      relativePath = "Vendors/ActionSheetPicker-3.0-2.7.4";
    };
    DGCHARTS00000000000000PR /* XCLocalSwiftPackageReference "Vendors/Charts-5.1.0" */ = {
      isa = XCLocalSwiftPackageReference;
      relativePath = "Vendors/Charts-5.1.0";
    };
    FSCALENDAR000000000000PR /* XCLocalSwiftPackageReference "Vendors/FSCalendar-2.8.3" */ = {
      isa = XCLocalSwiftPackageReference;
      relativePath = "Vendors/FSCalendar-2.8.3";
    };
/* End XCLocalSwiftPackageReference section */

/* Begin XCSwiftPackageProductDependency section */
    DSFSPARKLINE0000000000PD /* DSFSparkline */ = {
      isa = XCSwiftPackageProductDependency;
      productName = DSFSparkline;
    };
    DSFSPARKLINESTATIC00000PD /* DSFSparkline-static */ = {
      isa = XCSwiftPackageProductDependency;
      productName = "DSFSparkline-static";
    };
    ACTIONSHEETPICKER00000PD /* ActionSheetPicker-3.0 */ = {
      isa = XCSwiftPackageProductDependency;
      productName = "ActionSheetPicker-3.0";
    };
    DGCHARTS00000000000000PD /* DGCharts */ = {
      isa = XCSwiftPackageProductDependency;
      productName = DGCharts;
    };
    FSCALENDAR000000000000PD /* FSCalendar */ = {
      isa = XCSwiftPackageProductDependency;
      productName = FSCalendar;
    };
/* End XCSwiftPackageProductDependency section */
  };
  rootObject = AAD1D9282B94F2FE0023ACDB /* Project object */;
}