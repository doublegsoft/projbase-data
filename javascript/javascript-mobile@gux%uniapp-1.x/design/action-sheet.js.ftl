openActionSheet() {
  uni.showActionSheet({
    itemList: ['拍照', '从手机相册选择', '保存图片', '取消'],
    itemColor: '#007AFF', 
    success: (res) => {
      if (res.tapIndex >= 0 && res.tapIndex < 3) { // Check for valid option index (not "Cancel")
        let selectedOption = this.getActionName(res.tapIndex); // Get option name
        uni.showToast({
          icon: 'none',
          title: `选择了：${r"${"}selectedOption}` // Show selected option
        });

        if (res.tapIndex === 0) {
          console.log('拍照 action');
          // ... Code to open camera ...
        } else if (res.tapIndex === 1) {
          console.log('从手机相册选择 action');
          // ... Code to open album ...
        } else if (res.tapIndex === 2) {
          console.log('保存图片 action');
          // ... Code to save image ...
        }
      } else if (res.tapIndex === 3 || res.tapIndex === -1) { 
        uni.showToast({
          icon: 'none',
          title: '已取消' // Show "Cancelled" message
        });
        console.log('Action sheet cancelled');
      }
    },
    fail: (err) => {
      console.error('showActionSheet 失败', err);
      uni.showToast({
        icon: 'none',
        title: '操作失败，请重试' // Show error message
      });
    },
    complete: () => {
      console.log('showActionSheet complete callback executed');
    }
  });
},
getActionName(index) {
  const actionNames = ['拍照', '从手机相册选择', '保存图片', '取消']; // Match action names to indices
  return actionNames[index] || '未知操作';
}