const app = getApp();
const { sdk } = require('@/sdk/' + app.sdk)
const { gux } = require('@/vendor/gux/common/gux');

Page({

  data: {
    image: sdk.getFailureImage(),
  },

  onLoad(options) {
    options = options || {};
    this.setData({
      title: options.title || '此功能正在建设中...',
      description: options.description || '',
    });
  },

  gotoHome() {
    wx.reLaunch({
      url: '/page/index',
    });
  },
})