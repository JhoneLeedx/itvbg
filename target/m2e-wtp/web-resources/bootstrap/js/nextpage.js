    var NexPage = (function(){
        var htmlModule = {
            homeAndLast : "<div class='otherBtns'><a value='首页' class='btn' href='javascript:void(0)'>首页</a><a value='上一页' class='btn' href='javascript:void(0)'>上一页</a></div>",
            center : "<div class='centerBtns'><ul> </ul> </div>",
            nextAndEnd : "<div class='otherBtns'><a value='下一页' class='btn' href='javascript:void(0)'>下一页</a> <a value='尾页' class='btn' href='javascript:void(0)'>尾页</a></div>",
            jumpBtns : "<div class='jumpBtns'><input type='text' class='jump-input'/> <a class='btn' href='javascript:void(0)' data='0'>跳转</a> </div>"
        };
        var defaults = {
            total : 10,
            showPage : 9
        };
        var nexPage;
        var allA = [];
        var pageA = [];
        var Data = {};

        function GetQueryString(name) { //获取传入此页面的url参数
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return decodeURIComponent(r[2]);
            return null;
        }
        function addCss(){
            var nod = document.createElement('style'),
                    str = "#NexPage{font-size: 13px;font-family: ΢微软雅黑;font-weight: 400;height: 32px;;}" +
                            "#NexPage ul,#NexPage li{list-style: none;margin: 0;padding : 0;}" +
                            "#NexPage .otherBtns{float: left;height: inherit;}" +
                            "#NexPage .btn{padding: 0px 8px;float: left;display: block;height: 30px;" +
                            "line-height: 30px;text-align: center;cursor: pointer;border-radius: 2px;text-decoration: none;" +
                            "user-select: none;transition: all 0.2s;background-color: rgb(255, 255, 255);margin: 0px 3px;color: rgb(0, 0, 0);border: 1px solid rgb(221, 221, 221);}" +
                            "#NexPage .centerBtns .btn,#NexPage .centerBtns .btn-current{width: 23px;font-weight: 400;}" +
                            "#NexPage .btn-current{padding: 0px 8px;float: left;display: block;height: 30px;line-height: 30px;text-align: center;" +
                            "cursor: pointer;border-radius: 2px;text-decoration: none;user-select: none;margin: 0px 3px;background-color: rgb(247, 152, 152);" +
                            "color: rgb(255, 255, 255);border: 1px solid rgb(247, 152, 152);}" +
                            "#NexPage .btn:hover{background-color: rgb(37, 221, 61);color: rgb(225, 225, 225);border: 1px solid rgb(221, 221, 221);}" +
                            "#NexPage .jump-input{width: 60px;float: left;height: 28px;outline: none;text-align: center;border-radius: 2px;" +
                            "border: 1px solid rgb(221, 221, 221);margin: 0px 3px;color: rgb(0, 0, 0);line-height: 29px;}";
            nod.type='text/css';
            if(nod.styleSheet){         //ie下
                nod.styleSheet.cssText = str;
            } else {
                nod.innerHTML = str;       //或者写成 nod.appendChild(document.createTextNode(str))
            }
            document.getElementsByTagName('head')[0].appendChild(nod);
        }
        function pageListInit(){
            nexPage = document.getElementById(Data.Div);
            nexPage.innerHTML = htmlModule.homeAndLast + htmlModule.center + htmlModule.nextAndEnd + htmlModule.jumpBtns;
            var pageList = nexPage.getElementsByTagName("ul")[0];
            var pageHtml = "";
            for(var i = 1; i <= Data.showPage; i++){
                pageHtml += "<li><a value='" + i + "' class='btn' href='javascript:void(0)'>" + i + "</a></li>"
            }
            pageList.innerHTML = pageHtml;
            allA = nexPage.getElementsByTagName("a");
            pageA = nexPage.getElementsByTagName("ul")[0].getElementsByTagName("a");
        }
        function init(data){
            Data = data;
            addCss();
            pageListInit();
            changePageNum(GetQueryString("pageNum") || 1);
            //绑定点击事件
            for(var k = 0, l = allA.length; k < l; k++){
                allA[k].onclick = function(){
                    btnClick(this.getAttribute("value"));
                };
                //跳转按钮点击事件
                if(k == l - 1){
                    allA[k].onclick = function(){
                        var jumpNum = document.getElementsByClassName("jump-input")[0].value;
                        if(0 < jumpNum && jumpNum <= Data.total){
                            btnClick(jumpNum)
                        }
                    }
                }
            }
        }
        function btnClick(str){
            console.log(str)
            var currentPage = nexPage.getElementsByClassName("btn-current")[0].innerText;
            var currentPageNum = parseInt(currentPage);
            console.log(currentPageNum)
            switch (str){
                case "首页":
                    if(currentPageNum == 1) return;
                    currentPageNum = 1;
                    break;
                case "上一页":
                    if(currentPageNum == 1) return;
                    currentPageNum -= 1;
                    break;
                case "下一页":
                    if(currentPageNum == Data.total) return;
                    currentPageNum += 1;
                    break;
                case "尾页":
                    if(currentPageNum == Data.total) return;
                    currentPageNum = Data.total;
                    break;
                default:
                    currentPageNum = str;
            }
            console.log(currentPageNum)
            changePageNum(currentPageNum);
            changePage(currentPageNum);
        }
        function changePageNum(num){
            console.log("当前" + num);
            var median = Math.floor(Data.showPage/2);
            var firstPageNum;
            console.log("median "+median);
            if(num <= median){
                firstPageNum = 1;
            }else if(num > median && num <= (Data.total - median)){
                firstPageNum = num - median;
            }else{
                firstPageNum = Data.total - Data.showPage + 1;
            }
            console.log("diyige" + firstPageNum);
            for( var i = 0; i < Data.showPage; i++){
                pageA[i].setAttribute("value",i + firstPageNum);
                pageA[i].innerText = i + firstPageNum;
                pageA[i].className = "btn";
                if(i == num - firstPageNum){
                    pageA[i].className = "btn-current"
                }
                if(Data.showPage < Data.total){
                    if(i == 0){
                        pageA[i].setAttribute("value", "1");
                        pageA[i].innerText = 1;
                    }else if(i == 1 && num > median){
                        pageA[i].innerText = "...";
                    }
                    if(i == Data.showPage - 2 && firstPageNum != Data.total - Data.showPage + 1){
                        pageA[i].innerText = "..."
                    }else if(i == Data.showPage - 1){
                        pageA[i].setAttribute("value", Data.total);
                        pageA[i].innerText = Data.total;
                    }
                }
            }
            if(num == 1){
                allA[0].style.cursor = "not-allowed";
                allA[1].style.cursor = "not-allowed";
            }else{
                allA[0].style.cursor = "pointer";
                allA[1].style.cursor = "pointer";
            }
            if(num == Data.total){
                allA[Data.showPage + 2].style.cursor = "not-allowed";
                allA[Data.showPage + 3].style.cursor = "not-allowed";
            }else{
                allA[Data.showPage + 2].style.cursor = "pointer";
                allA[Data.showPage + 3].style.cursor = "pointer";
            }
        }
        function changePage(pageNum){
            window.location.href = Data .href + pageNum;
        }
        return{
            init : init
        }
    })();
    NexPage.init({
        Div : "NexPage",
        total : 18,
        showPage : 9,
	href : ""
    })