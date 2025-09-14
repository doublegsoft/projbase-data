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
    
    /*!
    ** 列表中的地址数据。
    */
    addresses: [],
    
    /*!
    ** 作为默认地址的地址标识。
    */
    defaultAddressId: null,
    
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
      url: '/api/v3/common/script/stdbiz/sms/personal_address/get',
      params: {
        personId: app.user.userId,
        '_other_select': 'adr.det detail',
        '_left_join': 'left join tn_sms_adr adr on adr.adrid = persadr.adrid ',
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
    let defaultAddressId = null;
    for (let i = 0; i < resp.data.length;i++) {
      if (resp.data[i].typeAddressTypeCode == '默认地址') {
        defaultAddressId = resp.data[i].addressId;
      }
    }
    this.setData({
      addresses: resp.data,
      defaultAddressId: defaultAddressId,
    });
  },
  
  /*!
  ** 响应【默认】按钮事件，改变默认地址选项。
  */
  doChangeDefaultAddress(ev) {
    this.setData({
      defaultAddressId: ev.currentTarget.dataset.value,
    })
  },
  
  /*!
  ** 响应【编辑】按钮事件，跳转到编辑页面。
  */
  gotoAddressEdit(ev) {
    gux.navigateTo({
      url: '/page/nowcare/address/edit?addressId=' + ev.currentTarget.dataset.addressId,
      events: {
        addressSaved: address => {
          this.onLoad();
        },
        addressDeleted: address => {
          this.onLoad();
        },
      },
    });
  },

});
