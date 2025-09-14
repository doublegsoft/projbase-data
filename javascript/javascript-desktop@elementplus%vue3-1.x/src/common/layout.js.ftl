
const layout = {
  topNavigatorHeight: 64,
};

layout.contentHeight = () => {
  const screenHeight = window.screen.height;
  return screenHeight - layout.topNavigatorHeight;
};
