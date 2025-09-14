name: ${app.name}
description: "only for unit test"
publish_to: 'none'

version: 0.0.1+1

environment:
  sdk: '>=3.4.1 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  intl: ^0.19.0  
  http: ^0.13.3
  sqflite: ^2.3.0 
  sqflite_common_ffi: ^2.3.4+4
  
dev_dependencies:
  flutter_test:
    sdk: flutter
