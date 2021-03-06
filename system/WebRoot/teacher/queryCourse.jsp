<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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

    <title>开课——查询课程</title>
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

  <div class="modal fade" id="myModal">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title ">过滤课程</h4>
                  </div>
                  <div class="modal-body">
                      <div class="row">
                          <div class="col-sm-6 col-sm-offset-3">
                              <form action="<c:url value='/TeacherServlet'/>" method="post">
                                  <input type="hidden" name="method" value="queryCourse"/>
                                  <div class="form-group">
                                      <label for="inputcid">课程编码</label>
                                      <input type="text" name="courseID" id="inputcid"/>
                                  </div>
                                  <div class="form-group">
                                      <label for="inputcname">课程名称</label>
                                      <input type="text" name="courseName" id="inputcname">
                                  </div>
                                  <div class="form-group">
                                      <label>课程属性</label>
                                      <label class="radio-inline">
                                          <input type="radio" name="courseAttribute" value="必修" id="bi">必修
                                      </label>
                                      <label class="radio-inline">
                                          <input type="radio" name="courseAttribute" value="选修" id="xuan"/>选修
                                      </label>
                                  </div>
                                  <div class="form-group">
                                      <label for="inputccre">课程学分</label>
                                      <input type="text" name="courseCredit" id="inputccre">
                                  </div>
                                  <button type="submit" class="btn btn-default btn-sm">查询</button>
                                  <button type="reset" class="btn btn-default btn-sm">重置</button>

                              </form>

                          </div>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
              </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->
      <script type="text/javascript">
          jQuery("#myModal").modal("show");
      </script>
  </body>
</html>
