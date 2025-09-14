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
    ** 默认头像。
    */
    avatar: '/asset/image/avatar.png',
    
    fields: [{
      title: '姓名',
      name: 'personName',
      input: 'text',
    },{
      title: '生日',
      name: 'birthDate',
      input: 'date',
    }],
    
    /*!
    ** 人员标识。
    */
    personId: null,
    
    /*!
    ** 所在家庭标识，最初全局保留此值，提高性能。
    */
    familyId: null,
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
    if (!opt.personId) {
      return;
    }
    let resp = await xhr.promise({
      url: '/api/v3/common/script/stdbiz/sms/person/find',
      params: {
        personId: opt.personId,
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
    let person = resp.data[0];
    form.setValues(person);
  },
  
  /*!
  ** 响应【头像】点击事件，切换头像。
  */
  doChangeAvatar(ev) {
    wx.chooseMedia({
      count: 1,
      mediaType: 'image',
    });
  },

  /*!
  ** 响应【保存】按钮的操作。
  */
  async doSaveFamilyMember(ev) {
    let form = this.selectComponent('#form');
    let familyMember = form.getValues();
    let resp = await this.saveFamilyMember(familyMember);
    if (resp.error) {
      wx.showModal({
        title: '错误',
        content: '家庭成员保存出错了！',
        showCancel: false,
      });
      return;
    }
    wx.showToast({
      title: '家庭成员保存成功！',
      icon: 'success',
    });
    setTimeout(() => {
      gux.navigateBack({
        success: () => {
          this.getOpenerEventChannel().emit('familyMemberSaved', {
            addressId: this.data.addressId,
          });
        },
      });
    }, 1500);
  },
  
  /*!
  ** 删除【家庭成员】的后台调用逻辑。、
  */
  async deleteFamilyMember() {
    if (!this.data.personId) {
      return;
    }
    await xhr.promise({
      url: '/api/v3/common/script/stdbiz/sms/family_member/remove',
      params: {
        personId: this.data.personId,
        familyId: this.data.familyId,
      }
    });
  },

  /*!
  ** 响应【删除】按钮的操作。
  */
  doDeleteFamilyMember(ev) {
    wx.showModal({
      title: "确认",
      content: '确定要删除该家庭成员？',
      success: async (res) => {
        if (res.confirm) {
          await this.deleteFamilyMember();
          gux.navigateBack({
            success: () => {
              this.getOpenerEventChannel().emit('familyMemberSaved', {
                addressId: this.data.addressId,
              });
            },
          });
        }
      }
    });
  },

  /*!
  ** 保存【家庭成员】的后台调用逻辑。、
  */
  async saveFamilyMember(familyMember) {
    return {};
  },

});
