<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <title>套餐编辑</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script src="../js/jquery.min63b9.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min14ed.js?v=3.3.6"></script>
    <script>
        //移动选中
        function moveSelected(srcClass, targetClass) {
            $("." + srcClass + " option:selected").appendTo($("." + targetClass));
        }

        //移动全部
        function moveAll(srcClass, targetClass) {
            $("." + srcClass + " option").appendTo($("." + targetClass));
        }


        $(function () {
            //获取右边框中option的value,存到数组中
            var ids = [];
            $.each($(".selfRoles option"), function (index, option) {
                ids.push(option.value);
            })
            console.log(ids);
            console.log(12333333);
        })

        $(function () {
            //排重
            var ids = $.map($(".selfRoles option"), function (item) {
                return item.value;
            })
            //遍历左边框中的所有option,判断其value值是否在上面的数组中
            //在,则删除
            $.each($(".allRoles option"), function (index, item) {
                if ($.inArray(item.value, ids) >= 0) {
                    $(item).remove();
                }
            })

            //提交表单
            $("#submitBtn").click(function () {
                $(".selfRoles option").prop("selected", true);
                $("#editForm").submit();
            })
        })
    </script>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>套餐编辑</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t" id="editForm" method="post" action="/setmeal/saveOrUpdate">
                        <input type="hidden" id="setmealId" name="setmealId" value="${setmeal.setmealId}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="setmealCode">套餐编码：</label>
                            <div class="col-sm-8">
                                <input id="setmealCode" name="setmealCode" class="form-control" type="text"
                                       value="${setmeal.setmealCode}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="setmealName">套餐名称：</label>
                            <div class="col-sm-8">
                                <input id="setmealName" name="setmealName" class="form-control" type="text"
                                       aria-required="true" aria-invalid="false" class="valid"
                                       value="${setmeal.setmealName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="helpcode">助记码：</label>
                            <div class="col-sm-8">
                                <input id="helpcode" name="helpcode" class="form-control" type="text"
                                       value="${setmeal.helpcode}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">适用性别：</label>
                            <div class="col-sm-8">
                                <label>
                                    <input id="setmealSex1" name="setmealSex" type="radio" value="1"> 男
                                </label>
                                <label>
                                    <input id="setmealSex2" name="setmealSex" type="radio" value="2"> 女
                                </label>
                                <label>
                                    <input id="setmealSex3" name="setmealSex" type="radio" value="3"> 不限
                                </label>

                            </div>
                            <script>
                                $("input[value='${setmeal.setmealSex}']").prop("checked", true)
                            </script>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="setmealAge">适用年龄：</label>
                            <div class="col-sm-8">
                                <input id="setmealAge" name="setmealAge" class="form-control" type="text"
                                       value="${setmeal.setmealAge}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="setmealPrice">套餐价格：</label>
                            <div class="col-sm-8">
                                <input id="setmealPrice" name="setmealPrice" class="form-control" type="text"
                                       value="${setmeal.setmealPrice}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="attention">注意事项：</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" id="attention"
                                          name="attention">${setmeal.attention}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="remark">说明：</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" id="remark" name="remark">${setmeal.remark}</textarea>
                            </div>
                        </div>

                        <div class="form-group " id="role">
                            <label for="role" class="col-sm-3 control-label">检查组：</label><br/>
                            <div class="row" style="margin-top: 10px">
                                <div class="col-sm-3 col-sm-offset-3" >
                                    <select multiple class="form-control allRoles" size="15">
                                        <c:forEach items="${checkGroups}" var="r">
                                            <option value="${r.groupId}">${r.groupName}</option>
                                        </c:forEach>
                                    </select>
                                </div>


                                <div class="col-sm-1" style="margin-top: 60px;" align="center">
                                    <div>
                                        <a type="button" class="btn btn-primary  " style="margin-top: 10px" title="右移动"
                                           onclick="moveSelected('allRoles', 'selfRoles')">
                                            <span class="glyphicon glyphicon-menu-right"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a type="button" class="btn btn-primary " style="margin-top: 10px" title="左移动"
                                           onclick="moveSelected('selfRoles', 'allRoles')">
                                            <span class="glyphicon glyphicon-menu-left"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a type="button" class="btn btn-primary " style="margin-top: 10px" title="全右移动"
                                           onclick="moveAll('allRoles', 'selfRoles')">
                                            <span class="glyphicon glyphicon-forward"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a type="button" class="btn btn-primary " style="margin-top: 10px" title="全左移动"
                                           onclick="moveAll('selfRoles', 'allRoles')">
                                            <span class="glyphicon glyphicon-backward"></span>
                                        </a>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <select multiple class="form-control selfRoles" size="15" name="groupIds">
                                        <c:forEach items="${setmeal.checkGroups}" var="r">
                                            <option value="${r.groupId}">${r.groupName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-6">
                                <button id="submitBtn" class="btn btn-primary" type="submit">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
