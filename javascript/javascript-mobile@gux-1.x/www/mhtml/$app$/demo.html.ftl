<#import "/$/projbase.ftl" as projbase>
<div id="pageDemo" class="page">
  <div class="card">
    <div class="card-body">
      <ul class="list-group">
<#list app.pages?sort_by("id") as page>
  <#assign pagetype = projbase.get_page_type_name(page)>
        <li widget-id="button${js.nameType(pagetype)}" class="list-group-item gx-d-flex">
          <span class="gx-fs-15">${page.title}</span>
          <i class="gx-i gx-i-arrow-right gx-ml-auto"></i>
        </li>
</#list>       
      </ul>
    </div>
  </div>
</div>

<script>
function PageDemo() {
  this.page = document.getElementById('pageDemo');
  this.noNavigationBar = false;
  this.noBottomNavigator = false;
  this.title = '生成页面';
}

PageDemo.prototype.initialize = function() {
  dom.init(this, this.page);
  this.topmostElement = this.widgetAd;
<#list app.pages?sort_by("id") as page>
  <#assign pagetype = projbase.get_page_type_name(page)>
  dom.bind(this.button${js.nameType(pagetype)}, 'click', ev => {
    this.goto${js.nameType(pagetype)}({});
  });
</#list>    
};

PageDemo.prototype.show = function() {
  this.initialize();
};

PageDemo.prototype.pull2Refresh = function() {
  pageIndex.switchTab('/mhtml/${app.name}/demo.html', {})
};
<#list app.pages as page>
  <#assign pagetype = projbase.get_page_type_name(page)>
  
/*!
** 【${page.title}】
*/
PageDemo.prototype.goto${js.nameType(pagetype)} = function(params) {
  gux.navigateTo('/mhtml/${app.name}<#if page.module?? && page.module != "unknown">/${page.module}</#if>/${page.id}.html', {});
};
</#list>

pageDemo = new PageDemo();
</script>