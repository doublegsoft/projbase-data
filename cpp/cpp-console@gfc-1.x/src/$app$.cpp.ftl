<#import "/$/projbase.ftl" as projbase>
<#if license??>
${c.license(license)}
</#if>
#include <stdio.h>
#include <argparse.h>
#include <gfc.h>

#define PROGRAM_NAME                "${app.name}"

const char* const usage[] = {
  "\n\t" PROGRAM_NAME " Add Your Argument Description",
  NULL,
};

int main(int argc, char* argv[])
{
  char* str = NULL;
  int b;

  struct argparse_option options[] = {
    OPT_HELP(),
    OPT_STRING('s', "string", &str, "string value", NULL, 0, 0), 
    OPT_BOOLEAN('b', "bool", &b, "bool value", NULL, 0, 0),
    OPT_END(),
  };
  
  struct argparse argparse;
  argparse_init(&argparse, options, usage, 0);
  argparse_describe(&argparse, "\n" PROGRAM_NAME "", "");
  argc = argparse_parse(&argparse, argc, (const char**) argv);
  
  if (str == NULL)
  {
    argparse_usage(&argparse);
    return 0;
  }
  return 0;
}