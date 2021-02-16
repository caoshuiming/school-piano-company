<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	String path=request.getContextPath();
	// 添加属性
	application.setAttribute("test", "value");
	// 修改属性
	application.setAttribute("test", "value1");
	// 删除属性
	application.removeAttribute("test");

%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="css/style.css"/>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		<script src="js/jquery-1.9.1.min.js"></script>        
        <script src="assets/layer/layer.js" type="text/javascript"></script>
<title>登录</title>

	<script type="text/javascript" src="jquery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">

		function changeImg() {
			console.log("图片被点击！");
			// 再次请求一次“校验码图片”，我们通过重新设置SRC属性。
			var img = document.getElementById("image");
			// 重新设置了图片的属性，等于刷新图片。
			img.src = "<%=path%>/image?t=" + new Date();
			// 上面代码不生效，JavaScript不生效，然后servlet没有接收到请求。
			// 问题来了？谁在搞鬼。
			// 问题出在：浏览器，问题在于浏览器给予性能考虑它进行缓存。
		}
	</script>
</head>

<body class="login-layout Reg_log_style">
<div class="logintop">    
    <span>欢迎后台管理界面平台</span>    
    <ul>
    <li><a href="login_admi.jsp">返回登录</a></li>
    </ul>    
    </div>
    <div class="loginbody">
<div class="login-container">
	<div class="center">
	     <img src="images/logo1.png" />
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box widget-box no-border visible">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												管理员注册
											</h4>

											<form class="form-horizontal" method="post" action="<%=path%>/addmanager_zc.action">
												<div class="form-group">
													<div class="text-center col-md-8">
														<h3>管理员添加</h3>
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 text-right">
														管理员名
													</label>
													<div class="col-md-5">
														<input class="form-control" id="m_name" name="m_name" placeholder="姓名" required />
													</div>
													<div class="col-md-2 text-left">
														<span id="managernameTip" style="display: none">用户名已经被占用！</span>
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 text-right">
														密码
													</label>
													<div class="col-md-5">
														<input class="form-control" id="password" name="password" placeholder="密码" required />
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 text-right">是否设置为超级管理员</label>
													<div class="col-md-5">
														<select id="flag" name="flag" class="form-control" required>
															<option value="1">否</option>
															<option value="0">是</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<div class="col-md-5 col-md-offset-3">
														<button class="btn btn-primary" type="submit" id="m_tj">添加</button>
														<button class="btn btn-primary" type="reset">重置</button>
													</div>
												</div>
											</form>

											<div class="social-or-login center">
												<span class="bigger-110">通知</span>
											</div>

											<div class="social-login center">
											本网站系统不再对IE8以下浏览器支持，请见谅。
											</div>
										</div><!-- /widget-main -->

										<div class="toolbar clearfix">
										</div>
									</div><!-- /widget-body -->
								</div><!-- /login-box -->
							</div><!-- /position-relative -->
						</div>
                        </div>
                        <div class="loginbm">版权所有  2016  <a href="">南京思美软件系统有限公司</a> </div><strong></strong>
</body>
</html>
<script>
$('#login_btn').on('click', function(){
	     var num=0;
		 var str="";
     $("input[type$='text'],input[type$='password']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('登录成功！',{
               title: '提示框',				
			   icon:1,		
			  });
	          location.href="index.html";
			   layer.close(index);	
		  }		  		     						
		
	});
  $(document).ready(function(){
	 $("input[type='text'],input[type='password']").blur(function(){
        var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_error');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_error');
        }
    });
	$("input[type='text'],input[type='password']").focus(function(){		
		var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_errors');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_errors');
        } else{
			 $parent.attr('class','frame_style').removeClass(' form_errors');
		}
		});
	  })

</script>