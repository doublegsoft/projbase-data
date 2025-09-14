<#function app_name_or_alias>
  <#if appalias??>
    <#return appalias>
  </#if>
  <#return app.name>
</#function>
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 77;
	objects = {

/* Begin PBXBuildFile section */
    SOURCESDBB00000000000001 /* ${objc.nameType(app.name)}SQLite.m in Sources/DB */ = {isa = PBXBuildFile; fileRef = SOURCESDBM00000000000001 /* ${objc.nameType(app.name)}SQLite.m */; };
    VENDORSSQLITEB0000000001 /* sqlite3.c in Vendors/SQLite */ = {isa = PBXBuildFile; fileRef = VENDORSSQLITEC0000000001 /* sqlite3.c */; };
    SOURCESUTILB000000000001 /* IdGenerator.m in Sources/DB */ = {isa = PBXBuildFile; fileRef = SOURCESUTILM000000000001 /* IdGenerator.m */; };
<#assign index = 1>
<#list model.objects as obj>
    SOURCESPOCOB00000000${index?string("0000")} /* ${objc.nameType(obj.name)}.m in Sources/POCO */ = {isa = PBXBuildFile; fileRef = SOURCESPOCOM00000000${index?string("0000")} /* ${objc.nameType(obj.name)}.m */; };
  <#assign index += 1>
</#list> 
    SOURCESDTOB0000000000001 /* Pagination.m in Sources/DTO */ = {isa = PBXBuildFile; fileRef = SOURCESDTOM0000000000001 /* Pagination.m */; };
    SOURCESDTOB0000000000002 /* BaseQuery.m in Sources/DTO */ = {isa = PBXBuildFile; fileRef = SOURCESDTOM0000000000002 /* BaseQuery.m */; };
<#assign index = 3>
<#list model.objects as obj>
    SOURCESDTOB000000000${index?string("0000")} /* ${objc.nameType(obj.name)}Query.m in Sources/DTO */ = {isa = PBXBuildFile; fileRef = SOURCESDTOM000000000${index?string("0000")} /* ${objc.nameType(obj.name)}Query.m */; };
  <#assign index += 1>
</#list> 
<#assign index = 1>
<#list model.objects as obj>
    SOURCESJSONB00000000${index?string("0000")} /* ${objc.nameType(obj.name)}JSON.m in Sources/JSON */ = {isa = PBXBuildFile; fileRef = SOURCESJSONM00000000${index?string("0000")} /* ${objc.nameType(obj.name)}JSON.m */; };
  <#assign index += 1>
</#list> 
    SOURCESSQLB0000000000001 /* ${objc.nameType(app.name)}SQL.m in Sources/SQL */ = {isa = PBXBuildFile; fileRef = SOURCESSQLM0000000000001 /* ${objc.nameType(app.name)}SQL.m */; };
    SOURCESSQLB0000000000002 /* ${objc.nameType(app.name)}TableResult.m in Sources/SQL */ = {isa = PBXBuildFile; fileRef = SOURCESSQLM0000000000002 /* ${objc.nameType(app.name)}TableResult.m */; };
<#assign index = 3>
<#list model.objects as obj>
    SOURCESSQLB000000000${index?string("0000")} /* ${objc.nameType(obj.name)}SQL.m in Sources/SQL */ = {isa = PBXBuildFile; fileRef = SOURCESSQLM000000000${index?string("0000")} /* ${objc.nameType(obj.name)}SQL.m */; };
  <#assign index += 1>
</#list> 
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
		LIB000000000000000000000 /* lib${objc.nameType(app_name_or_alias())}.a */ = {isa = PBXFileReference; explicitFileType = archive.ar; includeInIndex = 0; path = lib${objc.nameType(app_name_or_alias())}.a; sourceTree = BUILT_PRODUCTS_DIR; };
<#-- DB -->
    SOURCESDBH00000000000001 /* ${objc.nameType(app.name)}SQLite.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = ${objc.nameType(app.name)}SQLite.h; sourceTree = "<group>"; };
    SOURCESDBM00000000000001 /* ${objc.nameType(app.name)}SQLite.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = ${objc.nameType(app.name)}SQLite.m; sourceTree = "<group>"; };
    VENDORSSQLITEH0000000001 /* sqlite3.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = sqlite3.h; sourceTree = "<group>"; };
    VENDORSSQLITEH0000000002 /* sqlite3ext.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = sqlite3ext.h; sourceTree = "<group>"; };
    VENDORSSQLITEC0000000001 /* sqlite3.c */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.c; path = sqlite3.c; sourceTree = "<group>"; };
<#-- UTIL -->
    SOURCESUTILH000000000001 /* IdGenerator.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = IdGenerator.h; sourceTree = "<group>"; };
    SOURCESUTILM000000000001 /* IdGenerator.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = IdGenerator.m; sourceTree = "<group>"; };
<#-- POCO -->
<#assign index = 1>
<#list model.objects as obj>
    SOURCESPOCOH00000000${index?string("0000")} /* ${objc.nameType(obj.name)}.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = ${objc.nameType(obj.name)}.h; sourceTree = "<group>"; };
    SOURCESPOCOM00000000${index?string("0000")} /* ${objc.nameType(obj.name)}.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = ${objc.nameType(obj.name)}.m; sourceTree = "<group>"; };
  <#assign index += 1>
</#list>		
<#-- DTO -->
    SOURCESDTOH0000000000001 /* Pagination.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = Pagination.h; sourceTree = "<group>"; };
    SOURCESDTOM0000000000001 /* Pagination.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = Pagination.m; sourceTree = "<group>"; };
    SOURCESDTOH0000000000002 /* BaseQuery.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = BaseQuery.h; sourceTree = "<group>"; };
    SOURCESDTOM0000000000002 /* BaseQuery.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = BaseQuery.m; sourceTree = "<group>"; };
<#assign index = 3>
<#list model.objects as obj>
    SOURCESDTOH000000000${index?string("0000")} /* ${objc.nameType(obj.name)}Query.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = ${objc.nameType(obj.name)}Query.h; sourceTree = "<group>"; };
    SOURCESDTOM000000000${index?string("0000")} /* ${objc.nameType(obj.name)}Query.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = ${objc.nameType(obj.name)}Query.m; sourceTree = "<group>"; };
  <#assign index += 1>
</#list>
<#-- SQL -->
    SOURCESSQLH0000000000001 /* ${objc.nameType(app.name)}SQL.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = ${objc.nameType(app.name)}SQL.h; sourceTree = "<group>"; };
    SOURCESSQLM0000000000001 /* ${objc.nameType(app.name)}SQL.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = ${objc.nameType(app.name)}SQL.m; sourceTree = "<group>"; };
    SOURCESSQLH0000000000002 /* ${objc.nameType(app.name)}TableResult.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = ${objc.nameType(app.name)}TableResult.h; sourceTree = "<group>"; };
    SOURCESSQLM0000000000002 /* ${objc.nameType(app.name)}TableResult.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = ${objc.nameType(app.name)}TableResult.m; sourceTree = "<group>"; };
<#assign index = 3>
<#list model.objects as obj>
    SOURCESSQLH000000000${index?string("0000")} /* ${objc.nameType(obj.name)}SQL.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = ${objc.nameType(obj.name)}SQL.h; sourceTree = "<group>"; };
    SOURCESSQLM000000000${index?string("0000")} /* ${objc.nameType(obj.name)}SQL.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = ${objc.nameType(obj.name)}SQL.m; sourceTree = "<group>"; };
  <#assign index += 1>
</#list>
<#-- JSON -->
<#assign index = 1>
<#list model.objects as obj>
    SOURCESJSONH00000000${index?string("0000")} /* ${objc.nameType(obj.name)}JSON.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = ${objc.nameType(obj.name)}JSON.h; sourceTree = "<group>"; };
    SOURCESJSONM00000000${index?string("0000")} /* ${objc.nameType(obj.name)}JSON.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = ${objc.nameType(obj.name)}JSON.m; sourceTree = "<group>"; };
  <#assign index += 1>
</#list>
/* End PBXFileReference section */

/* Begin PBXGroup section */
		PROJ00000000000000000000 = {
			isa = PBXGroup;
			children = (
				SOURCES00000000000000000 /* Sources */,
				VENDORS00000000000000000 /* Vendors */,
				PROD00000000000000000000 /* Products */,
			);
			sourceTree = "<group>";
		};
		SOURCES00000000000000000 /* Sources */ = {
      isa = PBXGroup;
      children = (
        SOURCESPOCO0000000000000,
        SOURCESDTO00000000000000,
        SOURCESJSON0000000000000,
        SOURCESSQL00000000000000,
        SOURCESDB000000000000000,
        SOURCESUTIL0000000000000,
      );
      path = Sources;
      sourceTree = "<group>";
    };
    VENDORS00000000000000000 /* Vendors */ = {
      isa = PBXGroup;
      children = (
        VENDORSSQLITE00000000000,
      );
      path = Vendors;
      sourceTree = "<group>";
    };
		PROD00000000000000000000 /* Products */ = {
			isa = PBXGroup;
			children = (
				LIB000000000000000000000 /* lib${objc.nameType(app.name)}.a */,
			);
			name = Products;
			sourceTree = "<group>";
		};
    SOURCESPOCO0000000000000 /* Sources/POCO */ = {
      isa = PBXGroup;
      children = (
<#assign index = 1>
<#list model.objects as obj>
        SOURCESPOCOH00000000${index?string("0000")} /* ${objc.nameType(obj.name)}.h */,
        SOURCESPOCOM00000000${index?string("0000")} /* ${objc.nameType(obj.name)}.m */,
  <#assign index += 1>
</#list>      
      );
      path = POCO;
      sourceTree = "<group>";
    };
    SOURCESDTO00000000000000 /* Sources/DTO */ = {
      isa = PBXGroup;
      children = (
        SOURCESDTOH0000000000001 /* Pagination.h */,
        SOURCESDTOM0000000000001 /* Pagination.m */,
        SOURCESDTOH0000000000002 /* BaseQuery.h */,
        SOURCESDTOM0000000000002 /* BaseQuery.m */,
<#assign index = 3>
<#list model.objects as obj>
        SOURCESDTOH000000000${index?string("0000")} /* ${objc.nameType(obj.name)}Query.h */,
        SOURCESDTOM000000000${index?string("0000")} /* ${objc.nameType(obj.name)}Query.m */,
  <#assign index += 1>
</#list>       
      );
      path = DTO;
      sourceTree = "<group>";
    };
    SOURCESJSON0000000000000 /* Sources/JSON */ = {
      isa = PBXGroup;
      children = (
<#assign index = 1>
<#list model.objects as obj>
        SOURCESJSONH00000000${index?string("0000")} /* ${objc.nameType(obj.name)}JSON.h */,
        SOURCESJSONM00000000${index?string("0000")} /* ${objc.nameType(obj.name)}JSON.m */,
  <#assign index += 1>
</#list>       
      );
      path = JSON;
      sourceTree = "<group>";
    };
    SOURCESSQL00000000000000 /* Sources/SQL */ = {
      isa = PBXGroup;
      children = (
        SOURCESSQLH0000000000001 /* ${objc.nameType(app.name)}SQL.h */,
        SOURCESSQLM0000000000001 /* ${objc.nameType(app.name)}SQL.m */,
        SOURCESSQLH0000000000002 /* ${objc.nameType(app.name)}TableResult.h */,
        SOURCESSQLM0000000000002 /* ${objc.nameType(app.name)}TableResult.m */,
<#assign index = 3>
<#list model.objects as obj>
        SOURCESSQLH000000000${index?string("0000")} /* ${objc.nameType(obj.name)}SQL.h */,
        SOURCESSQLM000000000${index?string("0000")} /* ${objc.nameType(obj.name)}SQL.m */,
  <#assign index += 1>
</#list>       
      );
      path = SQL;
      sourceTree = "<group>";
    };
    SOURCESDB000000000000000 /* Sources/DB */ = {
      isa = PBXGroup;
      children = (
        SOURCESDBH00000000000001 /* ${objc.nameType(app.name)}SQLite.h */,
        SOURCESDBM00000000000001 /* ${objc.nameType(app.name)}SQLite.m */,
      );
      path = DB;
      sourceTree = "<group>";
    };
    SOURCESUTIL0000000000000 /* Sources/DB */ = {
      isa = PBXGroup;
      children = (
        SOURCESUTILH000000000001 /* IdGenerator.h */,
        SOURCESUTILM000000000001 /* IdGenerator.m */,
      );
      path = Util;
      sourceTree = "<group>";
    };
    VENDORSSQLITE00000000000 /* Vendors/SQLite */ = {
      isa = PBXGroup;
      children = (   
        VENDORSSQLITEH0000000001 /* sqlite3.h */,
        VENDORSSQLITEH0000000002 /* sqlite3ext.h */,
        VENDORSSQLITEC0000000001 /* sqlite3.c */,
      );
      path = SQLite;
      sourceTree = "<group>";
    };
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		TARGET000000000000000000 /* ${objc.nameType(app_name_or_alias())} */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = AA8034FC2D4DFEC50030ECF9 /* Build configuration list for PBXNativeTarget "${objc.nameType(app_name_or_alias())}" */;
			buildPhases = (
				SOURCESB0000000000000000 /* Sources */,
				AA8034EF2D4DFEC50030ECF9 /* Frameworks */,
				AA8034F02D4DFEC50030ECF9 /* CopyFiles */,
			);
			buildRules = (
			);
			dependencies = (
			);
			fileSystemSynchronizedGroups = (
				SOURCES00000000000000000 /* ${objc.nameType(app_name_or_alias())} */,
			);
			name = ${objc.nameType(app_name_or_alias())};
			packageProductDependencies = (
			);
			productName = ${objc.nameType(app_name_or_alias())};
			productReference = LIB000000000000000000000 /* ${objc.nameType(app_name_or_alias())} */;
			productType = "com.apple.product-type.library.static";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		ROOT00000000000000000000 /* Project object */ = {
			isa = PBXProject;
			attributes = {
				BuildIndependentTargetsInParallel = 1;
				LastUpgradeCheck = 1600;
				TargetAttributes = {
					TARGET000000000000000000 = {
						CreatedOnToolsVersion = 16.0;
					};
				};
			};
			buildConfigurationList = AA8034ED2D4DFEC50030ECF9 /* Build configuration list for PBXProject "${objc.nameType(app.name)}" */;
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = PROJ00000000000000000000;
			minimizedProjectReferenceProxies = 1;
			preferredProjectObjectVersion = 77;
			productRefGroup = AA8034F32D4DFEC50030ECF9 /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				TARGET000000000000000000 /* ${objc.nameType(app_name_or_alias())} */,
			);
		};
/* End PBXProject section */

/* Begin PBXSourcesBuildPhase section */
		SOURCESB0000000000000000 /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
			  SOURCESDBB00000000000001,
			  VENDORSSQLITEB0000000001,
			  SOURCESUTILB000000000001,
<#assign index = 1>
<#list model.objects as obj>
        SOURCESPOCOB00000000${index?string("0000")},
  <#assign index += 1>
</#list> 		
        SOURCESDTOB0000000000001,
        SOURCESDTOB0000000000002,
<#assign index = 3>
<#list model.objects as obj>
        SOURCESDTOB000000000${index?string("0000")},
  <#assign index += 1>
</#list> 
        SOURCESSQLB0000000000001,
        SOURCESSQLB0000000000002,
<#assign index = 3>
<#list model.objects as obj>
        SOURCESSQLB000000000${index?string("0000")},
  <#assign index += 1>
</#list> 
<#assign index = 1>
<#list model.objects as obj>
        SOURCESJSONB00000000${index?string("0000")},
  <#assign index += 1>
</#list> 	
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */

/* Begin XCBuildConfiguration section */
		AA8034FA2D4DFEC50030ECF9 /* Debug */ = {
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
				IPHONEOS_DEPLOYMENT_TARGET = 18.0;
				LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
				MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
				MTL_FAST_MATH = YES;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = iphoneos;
			};
			name = Debug;
		};
		AA8034FB2D4DFEC50030ECF9 /* Release */ = {
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
				IPHONEOS_DEPLOYMENT_TARGET = 18.0;
				LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
				MTL_ENABLE_DEBUG_INFO = NO;
				MTL_FAST_MATH = YES;
				SDKROOT = iphoneos;
				VALIDATE_PRODUCT = YES;
			};
			name = Release;
		};
		AA8034FD2D4DFEC50030ECF9 /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				CODE_SIGN_STYLE = Automatic;
				DEVELOPMENT_TEAM = H6X9G3CYFJ;
				HEADER_SEARCH_PATHS = (
          Sources,
          Vendors,
        );
				OTHER_LDFLAGS = "-ObjC";
				PRODUCT_NAME = "$(TARGET_NAME)";
				SKIP_INSTALL = YES;
				TARGETED_DEVICE_FAMILY = "1,2";
			};
			name = Debug;
		};
		AA8034FE2D4DFEC50030ECF9 /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				CODE_SIGN_STYLE = Automatic;
				DEVELOPMENT_TEAM = H6X9G3CYFJ;
				HEADER_SEARCH_PATHS = (
          Sources,
          Vendors,
        );
				OTHER_LDFLAGS = "-ObjC";
				PRODUCT_NAME = "$(TARGET_NAME)";
				SKIP_INSTALL = YES;
				TARGETED_DEVICE_FAMILY = "1,2";
			};
			name = Release;
		};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		AA8034ED2D4DFEC50030ECF9 /* Build configuration list for PBXProject "${objc.nameType(app.name)}" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				AA8034FA2D4DFEC50030ECF9 /* Debug */,
				AA8034FB2D4DFEC50030ECF9 /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		AA8034FC2D4DFEC50030ECF9 /* Build configuration list for PBXNativeTarget "${objc.nameType(app.name)}" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				AA8034FD2D4DFEC50030ECF9 /* Debug */,
				AA8034FE2D4DFEC50030ECF9 /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */
	};
	rootObject = ROOT00000000000000000000 /* Project object */;
}
