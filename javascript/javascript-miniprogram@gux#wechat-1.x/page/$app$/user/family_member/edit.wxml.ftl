<gx-navigation-bar id="navigationBar" title="信息编辑" />
<view class="page" style="top:{{top}}px;">
  <view class="gx-w-full gx-d-flex" style="height: 156px;">
    <image class="gx-wh-128 gx-m-auto gx-b-round" 
          mode="aspectFit" src="{{avatar}}"
          bind:tap="doChangeAvatar"></image>
  </view>
  <gx-two-column-form id="form" fields="{{fields}}" labelWidth="150" />
  <view>
    <button class="gx-bg-primary gx-text-reversed gx-b-round" 
            bind:tap="doSaveFamilyMember"
            style="height: 36px; line-height: 20px;text-align: center; width: 80%;">保存</button>
    <button class="gx-bg-error gx-text-reversed gx-b-round gx-mt-8" 
            bind:tap="doDeleteFamilyMember"
            style="height: 36px; line-height: 20px;text-align: center; width: 80%;"
            wx:if="{{familyMemberId}}">删除</button>             
  </view>
</view>