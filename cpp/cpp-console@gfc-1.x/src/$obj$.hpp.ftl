<#import "/$/projbase.ftl" as projbase>
<#if license??>
${c.license(license)}
</#if>
#pragma once

#include <memory>
#include <string>
using namespace std;
 
class ${cpp.nameType(obj.name)} {
public:
  
  /*!
  **
  */
  ${cpp.nameType(obj.name)}(void);
  
  /*!
  **
  */
  ~${cpp.nameType(obj.name)}(void);
  
  /*!
  **
  */
  ${cpp.nameType(obj.name)}(const ${cpp.nameType(obj.name)}& other);
  
  /*!
  **
  */
  ${cpp.nameType(obj.name)}& operator=(${cpp.nameType(obj.name)} rhs);

  // Getter
  int getSalary();

  // Setter
  void setSalary(int);
 
private:

  class Impl;

  unique_ptr<Impl> pimpl;
};