<view style="height: 90vh;">
  <view class="gx-h-full">
    <swiper indicator-dots="false"
            indicator-color="rgba(0,0,0,.3)"
            class="gx-h-full">
      <swiper-item wx:for="{{images}}" wx::for-index="index" wx:key="image">
        <view class="gx-d-flex" style="height: 75vh;">
          <view class="content">
            <image src="{{item.imagePath}}" mode="aspectFit" lazy-load="false"></image>
          </view>
        </view>
        <button wx:if="{{index == images.length - 1}}" class="primary" bind:tap="gotoMain">进入应用</button>
      </swiper-item>
    </swiper>
  </view>
</view>