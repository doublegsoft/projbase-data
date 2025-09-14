<template>
  <bottom-sheet :visible="visible" height="200vh" @close="closeBottomSheet">
    <view class="share-container" v-if="visible">
      <view class="share-overlay" @tap="close"></view>
      <view class="share-panel">
        <!-- Website preview -->
        <view class="website-preview">
          <view class="website-icon">
            <view class="blue-square">
              <text class="icon-text">A</text>
            </view>
          </view>
          <view class="website-info">
            <text class="website-title">Have a pocketsized avocado</text>
            <text class="website-url">pocketsizedavocado.com</text>
          </view>
          <view class="close-button" @tap="closeShare">
            <text class="close-icon">×</text>
          </view>
        </view>
        
        <!-- Contacts row -->
        <scroll-view scroll-x class="contacts-row">
          <view class="contact-item" v-for="(contact, index) in contacts" :key="index" @tap="shareWith(contact)">
            <image :src="contact.avatar" class="contact-avatar"></image>
            <text class="contact-name">{{ contact.name }}</text>
          </view>
        </scroll-view>
        
        <!-- Apps row -->
        <view class="apps-row">
          <view class="app-item" v-for="(app, index) in apps" :key="index" @tap="shareWithApp(app)">
            <view class="app-icon" :style="{ backgroundColor: app.color }">
              <text class="app-icon-text">{{ app.icon }}</text>
            </view>
            <text class="app-name">{{ app.name }}</text>
          </view>
        </view>
        
        <!-- Actions -->
        <view class="actions-list">
          <view class="action-item" @tap="copyLink">
            <text class="action-text">Copy</text>
            <text class="action-icon">📋</text>
          </view>
          <view class="action-item" @tap="addToReadingList">
            <text class="action-text">Add to readinglist</text>
            <text class="action-icon">👁️</text>
          </view>
        </view>
      </view>
    </view>
  </bottom-sheet>
</template>

<script>
import bottomSheet from '@/design/bottom-sheet';
export default {
  components: {
    bottomSheet,
  },
  data() {
    return {
      visible: false,
      url: 'https://pocketsizedavocado.com',
      title: 'Have a pocketsized avocado',
      contacts: [
        { name: 'Hugo Collins', avatar: '/static/avatars/hugo.jpg' },
        { name: 'Laura Scott', avatar: '/static/avatars/laura.jpg' },
        { name: 'Anne Frank', avatar: '/static/avatars/anne.jpg' },
        { name: 'Jasper Jacobs', avatar: '/static/avatars/jasper.jpg' },
        { name: 'Mae Wong', avatar: '/static/avatars/mae.jpg' }
      ],
      apps: [
        { name: 'Message', icon: '💬', color: '#4CD964' },
        { name: 'Mail', icon: '✉️', color: '#1E90FF' },
        { name: 'Messenger', icon: '⚡', color: '#A239FF' },
        { name: 'Whatsapp', icon: '📱', color: '#25D366' },
        { name: 'Twitter', icon: '🐦', color: '#1DA1F2' }
      ]
    };
  },
  methods: {
    show() {
      this.visible = true;
    },
    close() {
      this.visible = false;
      this.$emit('close');
    },
    shareWith(contact) {
      // Implementation for sharing with a contact
      uni.showToast({
        title: `Sharing with ${r"${"}contact.name}`,
        icon: 'none'
      });
    },
    shareWithApp(app) {
      // Implementation for sharing with an app
      uni.showToast({
        title: `Sharing via ${r"${"}app.name}`,
        icon: 'none'
      });
    },
    copyLink() {
      // Implementation for copying the link
      uni.setClipboardData({
        data: this.url,
        success: () => {
          uni.showToast({
            title: 'Link copied to clipboard',
            icon: 'success'
          });
        }
      });
    },
    addToReadingList() {
      uni.showToast({
        title: 'Added to reading list',
        icon: 'success'
      });
      this.close();
    },
  }
};
</script>

<style>
.share-container {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  top: 0;
  z-index: 999;
}

.share-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.2);
}

.share-panel {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: #f5f5f5;
  border-top-left-radius: 12px;
  border-top-right-radius: 12px;
  padding: 16px;
}

.website-preview {
  display: flex;
  flex-direction: row;
  align-items: center;
  padding: 8px;
  background-color: #ffffff;
  border-radius: 8px;
  margin-bottom: 16px;
}

.website-icon {
  margin-right: 12px;
}

.blue-square {
  width: 40px;
  height: 40px;
  background-color: #007AFF;
  border-radius: 8px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.icon-text {
  color: white;
  font-size: 20px;
  font-weight: bold;
}

.website-info {
  flex: 1;
}

.website-title {
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 4px;
}

.website-url {
  font-size: 12px;
  color: #666666;
}

.close-button {
  padding: 4px;
}

.close-icon {
  font-size: 24px;
  color: #999999;
}

.contacts-row {
  white-space: nowrap;
  margin-bottom: 16px;
}

.contact-item {
  display: inline-block;
  margin-right: 16px;
  align-items: center;
  width: 60px;
}

.contact-avatar {
  width: 50px;
  height: 50px;
  border-radius: 25px;
  margin-bottom: 4px;
}

.contact-name {
  font-size: 12px;
  text-align: center;
  white-space: normal;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.apps-row {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  margin-bottom: 16px;
}

.app-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 60px;
}

.app-icon {
  width: 50px;
  height: 50px;
  border-radius: 12px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 4px;
}

.app-icon-text {
  font-size: 24px;
  color: white;
}

.app-name {
  font-size: 12px;
  text-align: center;
}

.actions-list {
  background-color: #ffffff;
  border-radius: 8px;
}

.action-item {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 16px;
  border-bottom: 1px solid #eeeeee;
}

.action-item:last-child {
  border-bottom: none;
}

.action-text {
  font-size: 16px;
}

.action-icon {
  font-size: 18px;
}
</style>