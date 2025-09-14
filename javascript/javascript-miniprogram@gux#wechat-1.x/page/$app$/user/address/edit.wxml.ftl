<gx-navigation-bar id="navigationBar" title="地址编辑" />
<view class="page" style="top:{{top}}px;">
  <gx-two-column-form id="form" fields="{{fields}}" labelWidth="150" />
  <view>
    <view>
    <button class="gx-bg-primary gx-text-reversed gx-b-round" 
            bind:tap="doSaveAddress"
            style="height: 36px; line-height: 20px;text-align: center; width: 80%;">保存</button>
    <button class="gx-bg-error gx-text-reversed gx-b-round gx-mt-8" 
            bind:tap="doDeleteAddress"
            style="height: 36px; line-height: 20px;text-align: center; width: 80%;"
            wx:if="{{addressId}}">删除</button>                
  </view>
  </view>
</view>
