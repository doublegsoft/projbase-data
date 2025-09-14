<template>
  <view class="bottom-sheet-container" v-if="visible">
    <view 
      class="bottom-sheet-overlay" 
      :style="{ opacity: backdropOpacity }" 
      @touchmove.stop.prevent 
      @tap="onBackdropClick"
    ></view>
    <view 
      class="bottom-sheet-panel"
      :style="{ transform: `translateY(${r"${"}translateY}px)`, height: height }"
      @touchstart="onTouchStart"
      @touchmove="onTouchMove"
      @touchend="onTouchEnd"
    >
      <view class="bottom-sheet-handle-container">
        <view class="bottom-sheet-handle"></view>
      </view>
      <view class="bottom-sheet-content">
        <slot></slot>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  name: 'bottom-sheet',
  props: {
    visible: {
      type: Boolean,
      default: false
    },
    height: {
      type: String,
      default: '50vh'
    },
    closeOnBackdropClick: {
      type: Boolean,
      default: true
    },
    enableDrag: {
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      backdropOpacity: 0.5,
      translateY: 0,
      startY: 0,
      currentY: 0,
      isDragging: false,
      panelHeight: 0
    };
  },
  watch: {
    visible(newVal) {
      if (newVal) {
        this.translateY = 0;
        this.backdropOpacity = 0.5;
        // Prevent body scrolling when sheet is open
        document.body.style.overflow = 'hidden';
      } else {
        // Restore body scrolling when sheet is closed
        document.body.style.overflow = '';
      }
    }
  },
  mounted() {
    // Get actual panel height for calculations
    setTimeout(() => {
      const query = uni.createSelectorQuery().in(this);
      query.select('.bottom-sheet-panel').boundingClientRect(data => {
        if (data) {
          this.panelHeight = data.height;
        }
      }).exec();
    }, 50);
  },
  methods: {
    onBackdropClick() {
      if (this.closeOnBackdropClick) {
        this.close();
      }
    },
    onTouchStart(e) {
      if (!this.enableDrag) return;
      this.isDragging = true;
      this.startY = e.touches[0].clientY;
      this.currentY = this.translateY;
    },
    onTouchMove(e) {
      if (!this.isDragging || !this.enableDrag) return;
      
      const deltaY = e.touches[0].clientY - this.startY;
      // Only allow dragging downward
      if (deltaY < 0) {
        this.translateY = Math.max(deltaY + this.currentY, 0);
      } else {
        this.translateY = deltaY + this.currentY;
      }
      
      // Adjust backdrop opacity based on drag position
      const dragPercentage = Math.min(this.translateY / this.panelHeight, 1);
      this.backdropOpacity = 0.5 * (1 - dragPercentage);
    },
    onTouchEnd() {
      if (!this.isDragging || !this.enableDrag) return;
      this.isDragging = false;
      
      // Close if dragged more than 30% of panel height
      if (this.translateY > this.panelHeight * 0.3) {
        this.close();
      } else {
        // Spring back to original position
        this.translateY = 0;
        this.backdropOpacity = 0.5;
      }
    },
    close() {
      // Animate closing
      this.translateY = this.panelHeight;
      this.backdropOpacity = 0;
      
      // Emit close event after animation
      setTimeout(() => {
        this.$emit('close');
      }, 300);
    }
  }
};
</script>

<style>
.bottom-sheet-container {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 999;
}

.bottom-sheet-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #000000;
  transition: opacity 0.3s ease;
}

.bottom-sheet-panel {
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ffffff;
  border-top-left-radius: 16px;
  border-top-right-radius: 16px;
  box-shadow: 0 -4px 16px rgba(0, 0, 0, 0.1);
  transform: translateY(0);
  transition: transform 0.3s ease;
  overflow: hidden;
}

.bottom-sheet-handle-container {
  padding: 12px 0;
  display: flex;
  justify-content: center;
  align-items: center;
}

.bottom-sheet-handle {
  width: 36px;
  height: 4px;
  border-radius: 2px;
  background-color: #e0e0e0;
}

.bottom-sheet-content {
  padding: 0 16px 24px 16px;
  overflow-y: auto;
  max-height: calc(90vh - 56px);
}
</style>