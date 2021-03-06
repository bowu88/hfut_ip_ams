﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta lang="zh-CN">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--CSS-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/starter-template.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/commen.css">

	<!--JavaScript-->
	<script src="${pageContext.request.contextPath}/jquery/jquery-2.2.2.js"  type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/jquery/jquery.backstretch.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/login_scripts.js" type="text/javascript"></script>
	<script type="text/javascript">
    		function add()
    		{
    			var bool = true;
    			if(!$(":checkbox[name=studentID]").is(':checked'))
    			{
    				bool = false;
    				var error = document.getElementById("error");
    				error.innerHTML="没有添加学生不能提交";
    			}
    			if(bool)    	
    			{
    				$("form").submit();
    			}
    		}
</script>
	<title>选择学生</title>
</head>
  <body>

  <nav class="navbar navbar-inverse navbar-fixed-top" >
	  <div class="container">
		  <div class="navbar-header">
			  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					  data-target="#navbar" aria-expanded="false" aria-controls="navbar" >
				  <span class="sr-only">Toggle navigation</span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
			  </button>
			  <a href="/system/index.jsp" class="navbar-brand">考勤管理系统</a>
		  </div>
		  <div class="collapse navbar-collapse" id="navbar">
			  <ul class="nav navbar-nav">
				  <li><a href="<c:url value='/teacher/teacherIndex.jsp'/>">主页</a></li>
				  <li>
					  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						 aria-haspopup="true" aria-expanded="false">修改信息<span class="caret"></span></a>
					  <ul class="dropdown-menu dropdown-menu-inverse">
						  <li><a href="<c:url value='/teacher/changeInfo.jsp'/>">修改个人信息</a></li>
						  <li><a href="<c:url value='/teacher/changePassword.jsp'/>">修改密码</a></li>
					  </ul>
				  </li>
				  <li><a href="<c:url value='/teacher/queryCourse.jsp'/>">开设课程</a></li>
				  <li><a href="<c:url value='/teacher/queryCttime.jsp'/>">已开课程</a></li>
				  <li><a href="<c:url value='/teacher/queryGrade.jsp'/>">成绩及缺勤</a></li>
				  <li><a href="<c:url value='/Exit'/>">退出</a></li>
			  </ul>
		  </div>
	  </div>
  </nav>

  <hr>
	  <div class="container">
		  <div class="row">
			  <div class="col-sm-8 col-sm-offset-2">
				  <div class="panel panel-default">
					  <div class="panel-heading"><h4 class="centerh"><strong>选择学生</strong></h4></div>
					  <div class="table table-responsive">
						  <form action="<c:url value='/TeacherServlet'/>" method="post">
							  <input type="hidden" name="method" value="addGrade"/>
							  <input type="hidden" name="crID" value="${cr.courseID }" />
							  <input type="hidden" name="crClass" value="${cr.courseClass }"/>
							  <input type="hidden" name="crName" value="${cr.crName}"/>
							  <div class="table table-responsive">
								  <table class="table table-bordered table-striped table-hover">
									  <tr>
										  <th>学生学院</th>
										  <th>学生学号</th>
										  <th>学生姓名</th>
										  <th>学生班级</th>
										  <th>添加</th>
									  </tr>
									  <c:forEach items="${requestScope.stList}" var="stList">
										  <tr>
											  <td>${stList.stCollege}</td>
											  <td>${stList.stID}</td>
											  <td>${stList.stName}</td>
											  <td>${stList.stClass}</td>
											  <td><input type="checkbox" name="studentID" value="${stList.stID}"/></td>
										  </tr>
									  </c:forEach>
								  </table>
							  </div>
							  <br/>
							  <span id="error" >&nbsp;</span>
							  <div class="form-group">
								  <input type="button" value="添加" onclick="add()" class="btn btn-default btn-sm"/>
								  <input type="reset" value="重置" class="btn btn-default btn-sm"/>
							  </div>
						  </form>
					  </div>
				  </div>
			  </div>
		  </div>
	  </div>
  </body>
</html>
