<!DOCTYPE html>
<html lang="en">
<head>
  <style>
    .app-loading {
      display: flex;
      width: 100%;
      height: 100%;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      background: #f0f2f5;
    }
  
    .app-loading .app-loading-wrap {
      position: absolute;
      top: 50%;
      left: 50%;
      display: flex;
      -webkit-transform: translate3d(-50%, -50%, 0);
      transform: translate3d(-50%, -50%, 0);
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
  </style>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="referrer" content="" />
  <link rel="icon" href="/favicon.ico" />
  <script src="/js/tailwind-3.4.16.js"></script>
  <link href="/vendor/gux/font/gx-iconfont.css" rel="stylesheet">
  <title>${app.name?upper_case}</title>
</head>
<body style="overflow:hidden;height:100vh;margin:0;background-color:rgb(249,250,251)">
  <div id="app" style="height:100%;">
    <div class="app-loading">
      <div class="app-loading-wrap">
        <img src="/image/loading.gif" style="width:200px;" />
      </div>
    </div>
  </div>
  <script type="module" src="/src/main.js"></script>
</body>
</html>
