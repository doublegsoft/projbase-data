<style>
  body,
  html {
    margin: 0;
    padding: 0;
    height: 100%;
  }
  .login {
    width: 100%;
    height: 100%;
    background-size: cover;
    -webkit-background-size: cover;
    -o-background-size: cover;
    background-position: center 0;
    background-attachment: fixed;
    position: relative
  }

  .login .ant-form-item {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    color: rgba(0, 0, 0, .65);
    font-size: 14px;
    font-variant: tabular-nums;
    line-height: 1.5;
    list-style: none;
    -webkit-font-feature-settings: "tnum";
    font-feature-settings: "tnum";
    margin-bottom: 13px;
    vertical-align: top
  }

  .login .loginLogo img {
    width: 25%;
    margin: 40px
  }

  .login .loginFlex {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    position: absolute;
    width: 520px;
    height: 367.5px;
    left: 61.4vw;
    top: 50%;
    margin-top: -183.75px
  }

  .login .loginFlex .loginTitle h1 {
    font-size: 38px;
    font-family: Microsoft YaHei UI;
    font-weight: 400;
    color: #ffffff;
    margin-top: 46px;
    margin-left: 39px
  }

  .login .loginFlex .loginTitle i {
    width: 43px;
    height: 3px;
    background: #ffffff;
    margin-top: 23.3px;
    margin-left: 39px;
    display: block
  }


  .login .loginFlex .loginTitle .workstation_name p {
    margin-right: 10px;
    margin-bottom: 0;
    font-size: 22px;
    font-family: Microsoft YaHei UI;
    font-weight: 700;
    color: #ffffff
  }

  .login .loginFlex .loginTitle .workstation_name span {
    line-height: 12px;
    color: #3a88f7;
    background: #fff;
    border-radius: 25px;
    font-size: 12px;
    padding: 2px 5px;
    display: block
  }


  .login .loginFlex .loginTitle .footer a {
    font-size: 14px;
    font-family: Microsoft YaHei UI;
    font-weight: 300;
    color: #ffffff;
    margin-right: 56px
  }

  .login .loginFlex .loginFrom {
    width: 100%;
    background: #FFFFFF;
    border-top: 4px solid #3C70F5;
    box-shadow: 0px 0px 80px 60px rgba(0,0,0,0.07);
    padding: 140px 80px;
  }

  .login .loginFlex .loginFrom h2 {
    font-size: 18px;
    font-family: Microsoft YaHei UI;
    font-weight: 600;
    color: #3a88f7
  }

  .login .loginFlex .loginFrom input,.form-control {
    width: 100%;
    height: 60px !important;
    font-size: 16px !important;
    font-family: PingFang SC;
    color: #222;
    background: #fcfdfd;
    border: 1px solid #e5e8f0;
    border-radius: 4px;
    padding-left: 70px;
    box-sizing: border-box;
  }
  .login .loginFlex .loginFrom input::placeholder{
    color: #999;
  }

  .login .loginFlex .loginFrom .remember img {
    width: 13px;
    margin-right: 5px
  }


  .login .loginFlex .loginFrom .button a {
    height: 40px;
    background: #3a88f7;
    -webkit-box-shadow: 0 5px 6px 0 rgba(94, 114, 249, .25);
    box-shadow: 0 5px 6px 0 rgba(94, 114, 249, .25);
    border-radius: 4px;
    text-align: center;
    line-height: 40px;
    font-size: 14px;
    font-family: Microsoft YaHei;
    font-weight: 400;
    color: #ffffff;
    display: block;
    -webkit-box-sizing: content-box;
    box-sizing: content-box
  }


  .login .loginFlex .loginFrom .connect div {
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    font-size: 13px;
    font-family: PingFang SC;
    font-weight: 400;
    color: #919191
  }


  .login .loginFlex .loginFrom .connect .left a {
    color: #3766FF
  }


  #logoLogin{
    width: auto;
    margin: 70px 0 0 99px;
    height: 51px;
  }
  .login .ant-form-item{
    position: relative;
    margin-bottom: 30px;
  }
  .left-icon{
    position: absolute;
    left: 0;
    top:0;
    width: 60px;
    height: 100%;
    background: #F1F1F1;
    border-radius: 4px 0px 0px 4px;
    border: 1px solid #C5CCDB;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .form-captcha{
    border: 0 !important;
    padding-left: 0 !important;
    height: 50px !important;
  }
  .right-icon{
    position: absolute;
    right: 10px;
    top: calc(50% - 11px);
  }
  @media screen and (max-height: 800px) {
    .login .loginFlex .loginFrom {
      padding: 40px 90px;
    }
  }

  .captcha-img {
    width: 120px!important;
    height: 48px!important;
  }
</style>
<div class="login container h-100 m-0 p-0" style="max-width: 100%!important;">
  <div style="width: 71.88vw;background: url('img/gtgx/bg.png') no-repeat center;background-size: 100% 100%;height: 100%;">
    <div style="position: absolute;bottom: 135px;left: 200px;color: #FFFFFF;">
      <div style="font-size: 44px;font-weight: 600;letter-spacing: 6px;text-shadow: 0px 0px 30px rgba(63,79,121,0.1);">${applicationTitle!""}后台管理系统</div>
      <div style="margin-top: 40px;font-size: 24px;font-weight: 500;letter-spacing: 37px;text-shadow: 0px 0px 30px rgba(63,79,121,0.1);">协同创造价值</div>
ly: PingFangSC-Semibold, PingFang SC;margin-bottom: 50px">
        <div style="font-size: 32px;font-weight: 600;color: #191A24;">欢迎登录<span style="color: #3C70F5">${applicationTitle!""}</span></div>
        <div style="font-size: 16px;color: #999999;margin-top: 18px">输入账号信息立即使用</div>
      </div>
      <form id="formLogin" class="ant-form ant-form-horizontal" style="margin-top: 15px;">

        <div class="ant-row ant-form-item">
          <input value="" placeholder="请输入账号" type="text" maxlength="100" autocomplete="autocomplete"
                 name="username" class="form-control" required label="用户名">
          <div class="left-icon">
            <img src="img/username.png" style="width: 20px;height: 20px;"/>
          </div>
        </div>
        <div class="ant-row ant-form-item">
          <input id="password" style="padding-right: 40px;" value="" placeholder="请输入密码" type="password" maxlength="100" autocomplete="autocomplete"
                 name="password" class="form-control" required label="密码">
          <input id="passwordtext" style="padding-right: 40px;display: none" value="" placeholder="请输入密码" type="text" maxlength="100" autocomplete="autocomplete"
                 name="passwordtext" class="form-control">
          <div class="left-icon">
            <img src="img/password.png" style="width: 20px;height: 20px;"/>
          </div>
          <div class="right-icon">
            <img src="img/gtgx/eyes.png" style="width: 22px;height: 16px;"/>
          </div>
        </div>
        <div class="ant-row ant-form-item">
          <div class="d-flex form-control" style="line-height: 42px;">
            <input style="height: 42px !important;" value="" placeholder="请输入验证码" type="text" name="captcha" class="form-captcha"
                   label="验证码">
            <div class="captcha-img" id="captchaImg">
              <img src="" width="80" height="40">
            </div>
            <div class="left-icon">
              <img src="img/password.png" style="width: 20px;height: 20px;"/>
            </div>
          </div>
        </div>
        <div class="ant-row ant-form-item">
          <div  style="display: flex;">
            <button id="buttonLogin" type="button" class="btn btn-primary" style="height: 60px;width: 100%;display: flex;align-items: center;justify-content: center;">
              <span style="font-size: 18px;font-weight: 500;margin-right: 10px;">登录系统</span>
              <img src="img/gtgx/next.png" style="height: 16px;width: auto"/>
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>

</div>

<script>
  $('#logoLogin').attr('src', 'img/' + APPID + '/logo.png');
  $('.loginTitle').css('background', 'url(img/' + APPID + '/bg.png) no-repeat');
  $(".right-icon").click(function (){

    if($(this).hasClass('open')){
      $(this).removeClass('open');
      this.innerHTML='<img src="img/${app.name}/eyes.png" style="width: 22px;height: 16px;"/>';
      $("#password").attr('type', 'password');
    }else{
      $(this).addClass('open');
      this.innerHTML='<img src="img/${app.name}/eyes1.png" style="width: 22px;height: auto;"/>';
      $("#password").attr('type', 'text');
    }
  })

  let buttonLogin = dom.find('#buttonLogin');
  $('#buttonLogin').on('click', async function () {
    buttonLogin.disabled = true;
    let errors = $('#formLogin').validate();
    if (errors && errors.length > 0) {
      dialog.error(utils.message(errors));
      buttonLogin.disabled = false;
      return;
    }
    let data = $('#formLogin').formdata();
    data.usecase = '';
    let user = await xhr.promise({
      url: '/api/v3/common/script/stdbiz-ex/sam/login',
      params: data,
    }, (err) =>  {
      if (err.message) {
        dialog.error(err.message);
      }
      buttonLogin.disabled = false
    });
    if (user.error) {
      dialog.error(user.error.message);
      return;
    }
    window.user = user;
    ajax.view({
      containerId: 'body',
      url: 'html/ylsj/main.html'
    });
  });

  $('#captchaImg img').on('click',function () { //刷新验证码
    $('#captchaImg img').attr('src', HOST + '/captcha?' + new Date().getTime());
  });

  $('#captchaImg img').attr('src', HOST + '/captcha?' + new Date().getTime());

  if (typeof CefSharp !== 'undefined') {
    // 如果是桌面端，则删除验证码
    dom.find('.captcha').style = 'display: none;'
  }
</script>