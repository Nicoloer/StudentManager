
function submit(){
    alert("开始验证");
    var id=document.forms[0].login_id.value;
    var reg0=/^[0-9]{8,16}$/;
    if(id.length<=0) alert("账号不能为空");
    if(!reg0.test(id)) alert("账号格式错误");
    else document.forms[0].submit();
}
// function submit(){
//     var id=document.forms[0].login_id.value;
//
// }
