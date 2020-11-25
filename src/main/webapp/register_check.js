
    function functi(){

    var id=document.forms[0].id.value;
    var sex=document.forms[0].sex;
    <!-- sex设置标志量 遍历单选框 判断是否被选择-->
    var flags = false;
    for(var i=0; i<sex.length; i ++){
    if(sex[i].checked==true){
    flags = true;
    }
    }
    var name=document.forms[0].username.value;
    var birthday=document.forms[0].userbirthday.value;
    var pwd=document.forms[0].userpwd.value;
    var pwd1=document.forms[0].userpwd1.value;
    var accept=document.forms[0].accept.checked;
    var reg0=/^[0-9]{8,16}$/;
    var reg2=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
    <!--reg2密码-->
    var reg3=/^(((?:19|20)\d\d)-(0?[1-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01]))$/;
    <!--reg3生日-->
    var reg4 = /[\u4e00-\u9fa5\u4dae\uE863]/;

    if(id.length<=0) alert("账号不能为空");
    else if(!reg0.test(id)) alert("账号格式错误");
    else if(!reg4.test(name)) alert("姓名格式错误");
    else if(flags==false) alert("请选择您的性别");
    else if(!reg3.test(birthday)) alert("出生年月请按2000-01-01格式输入");
    else if(!reg2.test(pwd)) alert("密码长度长度不能小于6且不大于20 同时包含数字和字母");
    else if(pwd!=pwd1) alert("两次密码输入不一致");
    else if(accept==false) alert("您需要仔细阅读并同意接受用户使用协议！");
    else document.forms[0].submit();
}
