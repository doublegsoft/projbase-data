<#if license??>
${dart.license(license)}
</#if>
class ${dart.nameType(app.name)}Exception implements Exception {

  final int code;

  final String message;

  ${dart.nameType(app.name)}Exception({
    required this.code, 
    required this.message,
  });

  @override
  String toString() {
    return '$code: $message';
  }
}

void handleError(dynamic ex) {
  
}