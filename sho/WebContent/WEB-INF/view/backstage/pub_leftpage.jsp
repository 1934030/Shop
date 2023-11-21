
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="width: 100%; background-color: #fff; padding: 50px 5px 50px 5px;">
    <div class="center-block text-center left-style" style="border-bottom: 1px solid #e0e0e0">
        <img class="img-circle" src="${pageContext.request.contextPath}/statics/uploadfiles/${adm_info.aimg }"
             width="100px" height="100px">
        <h3 style=" text-shadow: 2px 2px 0 #000; color: #ffd739; font-weight: bold">${adm_info.aname }</h3>
        <small>我的身份:
            <c:if test="${adm_info.grade==1 }" var="gradenum">总管理员</c:if>
            <c:if test="${not gradenum }">管理员</c:if>
        </small>
        <input type="file" id="inputfile" accept="image/*" style="display: none">
    </div>
    <div class="center-block text-center" style="width: 80%; padding-top: 20px;">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a href="${pageContext.request.contextPath }/admin/topage?page=index">系统信息</a>
                    </h4>
                </div>
            </div>
            <%--<div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a href="${pageContext.request.contextPath }/admin/topage?page=news">新闻公告</a>
                    </h4>
                </div>
            </div>--%>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseOne">用户模块<b class="caret"></b></a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="two-menu">
                            <li><a href="${pageContext.request.contextPath }/admin/topage?page=user_manage">用户管理</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo">商品模块<b class="caret"></b></a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="two-menu">
                            <li><a href="${pageContext.request.contextPath }/admin/topage?page=pro_manage">商品管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin/topage?page=pro_add">商品添加</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin/topage?page=pro_manage_sort">商品分类</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a href="${pageContext.request.contextPath }/adminorder/getAdminOrders">订单模块</a>
                    </h4>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a href="${pageContext.request.contextPath }/admin/topage?page=admin_manage">管理员</a>
                    </h4>
                </div>
            </div>
            <%--<div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">日志模块<b
                                class="caret"></b></a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="two-menu">
                            <li><a href="${pageContext.request.contextPath }/admin/topage?page=">日志管理</a></li>
                        </ul>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
</div>