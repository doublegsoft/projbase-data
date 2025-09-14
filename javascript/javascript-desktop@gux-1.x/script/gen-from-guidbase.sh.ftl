export JAR=/Volumes/EXPORT/local/works/doublegsoft.org/protosys/03.Development/protosys-plugin-guidbase/target/protosys-plugin-guidbase-4.5-shaded.jar
export OUTPUT_ROOT=/Volumes/EXPORT/local/works/doublegsoft.biz/stdbiz/03.Development/stdbiz-out/gui
export GUIDBASE_DATA_ROOT=/Volumes/EXPORT/local/works/doublegsoft.io/guidbase/03.Development/guidbase-data
export GUIDBASE_MODEL_ROOT=/Volumes/EXPORT/local/works/doublegsoft.biz/stdbiz/03.Development/stdbiz-spec

################################################################################
##                                                                            ##
##                                    POCO                                    ##
##                                                                            ##
################################################################################
export PROJECT_ROOT=$OUTPUT_ROOT/desktop4objc
export MODEL=$GUIDBASE_MODEL_ROOT/个人信息/个人信息桌面界面模型.guidbase

export TEMPLATE_ROOT=$GUIDBASE_DATA_ROOT/objectivec/objectivec@cocoa-1.0

java -jar $JAR \
--guidbase=$MODEL \
--template-root=$TEMPLATE_ROOT \
--output-root=$PROJECT_ROOT \
--license=$GUIDBASE_MODEL_ROOT/LICENSE \
--globals=\
\{\
\"application\":\"${app.name}\",\
\"namespace\":\"${app.name}\",\
\"artifact\":\"${app.name}\",\
\"version\":\"1.0.0\",\
\"description\":\"\",\
\"naming\":\"com.doublegsoft.jcommons.programming.objc.ObjcConventions\",\
\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.objc.ObjcNamingConvention\",\
\"language\":\"objc\",\
\"imports\":\
\[\],\
\"dependencies\":\
\[\]\
\} 2>&1


