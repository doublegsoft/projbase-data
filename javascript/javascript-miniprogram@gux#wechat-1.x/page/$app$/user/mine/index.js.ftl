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
    ** 用户头像。
    */
    avatar: app.user.avatar,
    
    fields: [{
      title: '姓名',
      name: 'personName',
      input: 'text',
    },{
      title: '生日',
      name: 'birthDate',
      input: 'date',
    },{
      title: '性别',
      name: 'genderCode',
      input: 'select',
      options: {
        values: [
          {text: '男', value: 'M'},
          {text: '女', value: 'F'}
        ],
      },
    }],
    
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
  onLoad() {
    
  },
  
  /*!
  ** 响应【头像】点击事件，切换头像。
  */
  doChangeAvatar(ev) {
    wx.chooseMedia({
      count: 1,
      mediaType: 'image',
      sourceType: ['album','camera'],
      success: res => {
        this.changeAvatar(res);
      }
    });
  },
  
  /*!
  ** 处理改变头像的逻辑。将图片保存至后台，获取远程的URL作为头像路径。
  */
  async changeAvatar(res) {
    if (res.tempFiles.length == 0) {
      return;
    }
    wx.getFileSystemManager().readFile({
      filePath: res.tempFiles[0].tempFilePath,
      encoding: 'base64',
      success: async base64 => {
        let data = base64.data;
        let resp = await xhr.promise({
          url: '/api/v3/common/image',
          params: {
            directoryKey: 'TODO',
            filedata: data,
            fileext: 'jpg',
          },
        });
        if (resp.error) {
          wx.showModal({
            title: '错误',
            content: '头像上传出错了！',
            showCancel: false,
          });
          return;
        }
        this.setData({
          avatar: xhr.host + resp.data.filepath,
        });
      },
    });
  },

});
