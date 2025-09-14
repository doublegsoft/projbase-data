<gx-navigation-bar id="navigationBar" title="地址管理" />
<view class="page" style="top:{{top}}px;">
  <view class="gx-d-flex gx-mx-16 gx-pt-16" wx:for="{{addresses}}" wx:key="addressId" wx:item="item">
    <view class="gx-wh-36 gx-lh-36">
      <radio value="{{item.addressId}}" data-value="{{item.addressId}}" checked="{{defaultAddressId == item.addressId}}" bind:tap="doChangeDefaultAddress"></radio>
    </view>
    <view>
      <view class="gx-text-primary">{{item.detail}}</view>
      <view class="gx-fs-13 gx-text-secondary">{{item.typeAddressTypeCode}}</view>
    </view>
    <view class="gx-ml-auto gx-lh-36"
          style="text-align: center;"
          data-address-id="{{item.addressId}}"
          bind:tap="gotoAddressEdit">
      <text class="fas fa-edit gx-color-primary"></text>    
    </view>
  </view>
  <button class="gx-bg-success gx-text-reversed gx-b-round gx-mt-24" 
          bind:tap="gotoAddressEdit"
          style="height: 36px; line-height: 20px;text-align: center; width: 80%;">新增地址</button>
</view>
