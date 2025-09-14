<#if license??>
${js.license(license)}
</#if>
const app = getApp();
const { sdk } = require("@/sdk/" + app.sdk);
const { gux } = require('@/vendor/gux/common/gux');

Page({

  data: {
    images: [],
  },

  onShow() {
    sdk.fetchWelcomeImages().then(resp => {
      this.setData({
        images: resp,
      })
    });
  },

  gotoMain() {
    gux.redirectTo({
      url: '/page/main/index',
    })
  }
})