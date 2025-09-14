<template>
  <view class="comments-section">
    <!-- First Comment -->
    <view class="comment">
      <image class="avatar" src="/static/avatar.png"></image>
      <view class="comment-content">
        <view class="comment-header">
          <text class="username">Monopolyguy</text>
          <text class="time">18h</text>
        </view>
        <text class="comment-text">I really like Monopoly</text>
        <view class="comment-actions">
          <text class="icon options">⋮</text>
          <view class="action-button">
            <text class="icon">↩</text>
            <text class="action-text">Reply</text>
          </view>
          <view class="action-button">
            <text class="icon">👍</text>
            <text class="count">54</text>
          </view>
          <view class="action-button">
            <text class="icon">👎</text>
          </view>
        </view>
      </view>
    </view>
    <view class="comment nested-comment">
      <image class="avatar" src="/static/avatar.png"></image>
      <view class="comment-content">
        <view class="comment-header">
          <text class="username">Monopolyguy</text>
          <text class="time">7h</text>
        </view>
        <text class="comment-text">Does anyone else like Monopoly? I Was just wondering.</text>
      </view>
    </view>
    <view class="comment nested-comment">
      <image class="avatar" src="/static/avatar.png"></image>
      <view class="comment-content">
        <view class="comment-header">
          <text class="username">Monopolyguy</text>
          <text class="time">7h</text>
        </view>
        <text class="comment-text">Does anyone else like Monopoly? I Was just wondering.</text>
      </view>
    </view>
    <view class="comment">
      <image class="avatar" src="/static/avatar.png"></image>
      <view class="comment-content">
        <view class="comment-header">
          <text class="username">Monopolyguy</text>
          <text class="time">18h</text>
        </view>
        <text class="comment-text">I really like Monopoly</text>
        <view class="comment-actions">
          <text class="icon options">⋮</text>
          <view class="action-button">
            <text class="icon">↩</text>
            <text class="action-text">Reply</text>
          </view>
          <view class="action-button">
            <text class="icon">👍</text>
            <text class="count">54</text>
          </view>
          <view class="action-button">
            <text class="icon">👎</text>
          </view>
        </view>
      </view>
    </view>
    <view class="comment nested-comment">
      <image class="avatar" src="/static/avatar.png"></image>
      <view class="comment-content">
        <view class="comment-header">
          <text class="username">Monopolyguy</text>
          <text class="time">7h</text>
        </view>
        <text class="comment-text">Does anyone else like Monopoly? I Was just wondering.</text>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  name: 'comment',
  props: [],
  data() {
    return {
      
    }
  },
  methods: {
    
  }
}
</script>

<style>
.avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background-color: #e0e0e0;
  margin-right: 10px;
}

.comments-section {
  padding: 10px 15px;
}

.comment {
  display: flex;
  margin-bottom: 15px;
}

.comment-content {
  flex: 1;
  margin-left: 10px;
}

.comment-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 5px;
}

.username {
  font-weight: bold;
  font-size: 14px;
}

.time {
  font-size: 12px;
  color: #666;
}

.comment-text {
  font-size: 14px;
  margin-bottom: 5px;
}

.comment-actions {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-top: 5px;
}

.options {
  margin-right: auto;
}

.nested-comment {
  margin-left: 30px;
}

/* Comment Input Styles */
.comment-input {
  padding: 15px;
  border-top: 1px solid #eaeaea;
  position: fixed;
  bottom: 0;
  width: 100%;
  background-color: white;
}

.comment-input input {
  width: 100%;
  padding: 10px;
  border: 1px solid #eaeaea;
  border-radius: 20px;
  font-size: 14px;
}
</style>