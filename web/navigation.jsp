<div class="row breadcrumb">
            <span>Site &gt; Users &gt; i.adi</span>
        </div>
        <div class="row dmsIcons">
            <a href="mainpage.jsp"> <img title="Home" src="img/home2.png"></a>
            <a href="#" id="openSearch" onclick=""><img title="Search" src="img/search2.png"></a>
            <a href="#" id="openUpload" onclick=""><img title="Upload" onclick="" src="img/upload2.png"></a>
            <a href="upload.jsp">  <img title="Add" src="img/add2.png"></a>
            <a href="#">  <img title="MetaData" src="img/metadata.png"></a>
            <a href="#" style="float:right;" onclick=""> <img id="trigger-overlay" title="Refresh" src="img/setting.png"></a>

        </div>
        <div class="row bg-col04"> 
             <div class="row search">
                <form action="search_result.jsp" method="post"><input type="text" name="item_search">
                <input type="hidden" name="dirid" value="${param.id}">
                <input type="submit" value="Go" name="Go"><span class="search"><img src="img/search.png"></span></input>
                <div class="clear"></div></form>    
                
            </div>
        </div>