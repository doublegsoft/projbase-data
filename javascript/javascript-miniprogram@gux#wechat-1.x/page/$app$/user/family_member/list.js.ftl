<#if license??>
${js.license(license)}
</#if>
const app = getApp();
const { sdk } = require('@/sdk/' + app.sdk);
const { gux } = require('@/vendor/gux/common/gux');
const { xhr } = require('@/vendor/gux/common/xhr');

Page({

  data: {
    
    /*!
    ** 当前登录用户。
    */
    user: app.user,
    
    familyMembers: [],
    
  },
  
  /*!
  ** 页面显示时调用的方法，主要解决页面布局。
  */
  onShow() {
    app.onShowPage(this);
  },
  
  /*!
  ** 页面加载时调用的方法，主要解决远程数据加载。
  */
  async onLoad() {
    let resp = await xhr.promise({
      url: '/api/v3/common/script/stdbiz/sms/family_member/get',
      params: {
        familyId: app.user.userId,
        '_left_join': 'left join tn_sms_pers pers on pers.persid = fammbr.mbrid',
        '_other_select': 'pers.persid personId, pers.persnm personName, pers.bdt birthdate'
      },
    });
    if (resp.error) {
      wx.showModal({
        title: '错误',
        content: '小程序出错了！',
        showCancel: false,
      });
      return;
    }
    this.setData({
      familyMembers: resp.data,
    });
  },
  
  /*!
  ** 响应【编辑】按钮事件，跳转到编辑页面。
  */
  gotoFamilyMemberEdit(ev) {
    gux.navigateTo({
      url: '/page/nowcare/family_member/edit?personId=' + ev.currentTarget.dataset.personId,
    });
  },

});
