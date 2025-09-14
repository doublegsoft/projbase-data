{
  "pages": [
    "page/welcome/index",
    "page/common/article/index",
    "page/common/search/index",
    "page/common/success/index",
    "page/common/failure/index",
    "page/common/under-construction/index",
    "page/${app.name}/pim/address/list",
    "page/${app.name}/pim/address/edit",
    "page/${app.name}/pim/family_member/list",
    "page/${app.name}/pim/family_member/edit",
    "page/${app.name}/pim/mine/index",
<#list app.pages?sort_by("id") as page>
  <#if page.module?? && page.module != "unknown">
    "page/${app.name}/${page.module}/${page.id}/index",
  <#else>
    "page/${app.name}/${page.id}/index",
  </#if>  
</#list>
    "page/main/index"
  ],
  "window": {
    "backgroundTextStyle": "light",
    "navigationBarBackgroundColor": "#fff",
    "navigationBarTitleText": "",
    "navigationBarTextStyle": "black",
    "navigationStyle": "custom"
  },
  "style": "v2",
  "rendererOptions": {
    "skyline": {
      "defaultDisplayBlock": true,
      "disableABTest": true,
      "sdkVersionBegin": "3.0.0",
      "sdkVersionEnd": "15.255.255"
    }
  },
  "componentFramework": "glass-easel",
  "sitemapLocation": "sitemap.json",
  "lazyCodeLoading": "requiredComponents",
  "resolveAlias": {
    "@/*": "/*"
  }
}