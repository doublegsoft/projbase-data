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
    ** 在存在自定义导航栏的情况下，页面正文的起始位置。
    */
    marginTop: 0,
    
    /*!
    ** 当前登录用户。
    */
    user: app.user,
    
    fields: [{
      title: '地区',
      name: 'district',
      input: 'district',
    },{
      title: '详细地址',
      name: 'detail',
      input: 'longtext',
    }],
    
    /*!
    ** 地址标识。
    */
    addressId: null,
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
  async onLoad(opt) {
    if (!opt.addressId) {
      return;
    }
    let resp = await xhr.promise({
      url: '/api/v3/common/script/stdbiz/sms/address/find',
      params: {
        addressId: opt.addressId,
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
    if (resp.data.length == 0) {
      return;
    }
    let form = this.selectComponent('#form');
    let address = resp.data[0];
    let values = {
      district: {
        provinceCode: address.provinceCodeChineseDistrictCode,
        provinceName: address.provinceName,
        cityCode: address.cityCodeChineseDistrictCode,
        cityName: address.cityName,
        countyCode: address.countyCodeChineseDistrictCode,
        countyName: address.countyName,
        townCode: address.townCodeChineseDistrictCode,
        townName: address.townName,
      },
      detail: address.detail,
    }
    this.setData({
      addressId: opt.addressId,
    });
    form.setValues(values);
  },
  
  /*!
  ** 响应【删除】按钮的事件。
  */
  async doDeleteAddress(ev) {
    wx.showModal({
      title: "确认",
      content: '确定要删除该地址？',
      success: async (res) => {
        if (!res.confirm) {
          return;
        }
        await this.deleteAddress();
        gux.navigateBack({
          success: () => {
            this.getOpenerEventChannel().emit('addressDeleted', {
              addressId: this.data.addressId,
            });
          },
        });
      },
    });
  },
  
  /*!
  ** 删除【地址】的后台调用操作。
  */
  async deleteAddress() {
    if (!this.data.addressId) {
      return;
    }
    await xhr.promise({
      url: '/api/v3/common/script/stdbiz/sms/personal_address/remove',
      params: {
        personId: app.user.userId,
        addressId: this.data.addressId,
      }
    });
  },
  
  /*!
  ** 响应【保存】按钮的事件。
  */
  async doSaveAddress(ev) {
    let form = this.selectComponent('#form');
    let address = form.getValues();
    let resp = await this.saveAddress(address);
    if (resp.error) {
      wx.showModal({
        title: '错误',
        content: '地址保存出错了！',
        showCancel: false,
      });
      return;
    }
    wx.showToast({
      title: '地址保存成功！',
      icon: 'success',
    });
    setTimeout(() => {
      gux.navigateBack({
        success: () => {
          this.getOpenerEventChannel().emit('addressSaved', address);
        },
      });
    }, 1500);
  },
  
  /*!
  ** 保存【地址】的后台调用操作。
  */
  async saveAddress(address) {
    return {};
  },

});
