<#if license??>
${js.license(license)}
</#if>
const { xhr } = require('@/vendor/gux/common/xhr');
const { util } = require('@/vendor/gux/common/util');
App({
  
  /*!
  ** 此处调节本地测试数据与远程数据的SDK实现。
  */
  sdk: 'memory',
  
  /*!
  ** 自定义底部导航栏的高度，非微信自带的而是自定义实现的。
  */
  bottomNavigatorHeight: 88,
  
  /*!
  ** 顶部导航栏的高度
  */
  topNavigatorHeight: 0,
  
  host: 'http://localhost:9098',
  
  /*!
  ** 当前用户。
  */
  user: {
  
    /*!
    ** 用户标识，匿名用户上线改为0。
    */
    userId: '1',
    
    /*!
    ** 用户名称。
    */
    username: '匿名',
    
    /*!
    ** 默认头像路径。
    */
    avatar: '/asset/image/avatar.png',
    
    /*!
    ** 家庭标识，默认为0，如果app中无家庭成员管理或者组管理，则无需考虑。
    */
    familyId: '0',
  },
  
  onLaunch() {
    xhr.host = this.host;
  },
  
  onShowPage(page, offset) {
    offset = offset || 0;
    if (!this.sysinfo) {
      this.sysinfo = wx.getSystemInfoSync();
    }
    let navbar = page.selectComponent('#navigationBar');
    if (navbar != null) {
      page.setData({
        top: navbar.getHeight(),
        viewHeight: this.sysinfo.safeArea.bottom - navbar.getHeight() - offset,
        viewWidth: this.sysinfo.screenWidth,
        screenHeight: this.sysinfo.screenHeight,
      });
    } else {
      let rect = wx.getMenuButtonBoundingClientRect();
      page.setData({
        topOfBack: rect.top,
        heightOfBack: rect.height,
        top: this.sysinfo.safeArea.top,
        viewHeight: this.sysinfo.safeArea.bottom - offset,
        bottonHeight: this.sysinfo.screenHeight - this.sysinfo.safeArea.height - this.sysinfo.safeArea.top,
        viewWidth: this.sysinfo.screenWidth,
        screenHeight: this.sysinfo.screenHeight,
      });
    } 
  },
})
