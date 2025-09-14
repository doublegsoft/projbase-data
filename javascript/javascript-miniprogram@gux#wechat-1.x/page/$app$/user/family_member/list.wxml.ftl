<gx-navigation-bar id="navigationBar" title="家庭成员" />
<view class="page" style="top:{{top}}px;">
  <view class="gx-d-flex gx-mx-16 gx-pt-16" wx:for="{{familyMembers}}" wx:key="familyMemberId" wx:for-item="item">
    <view class="gx-wh-40 gx-mr-16">
      <image style="width:100%;height:100%;" src="{{item.avatar || '/asset/image/avatar.png'}}"></image>
    </view>
    <view>
      <view class="gx-text-primary">{{item.personName}}</view>
      <view class="gx-fs-13 gx-text-secondary">{{item.birthdate}}</view>
    </view>
    <view class="gx-ml-auto gx-lh-36"
          style="text-align: center;"
          data-person-id="{{item.personId}}"
          bind:tap="gotoFamilyMemberEdit">
      <text class="fas fa-edit gx-color-primary"></text>    
    </view>
  </view>
  <button class="gx-bg-success gx-text-reversed gx-b-round gx-mt-24" 
          bind:tap="gotoFamilyMemberEdit"
          style="height: 36px; line-height: 20px;text-align: center; width: 80%;">新增成员</button>
</view>
