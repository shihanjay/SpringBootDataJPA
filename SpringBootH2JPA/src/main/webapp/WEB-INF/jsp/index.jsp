<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-3.2.0.js"></script>
 <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
 <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
 <script>
  var id=1;
 $(document).ready(function() {
	 $( "#datepicker" ).datepicker({
	      changeMonth: true,
	      changeYear: true
	    });
	 
	 
//呼叫 coindesk API
$('#form').click(function(event){
	  var querycoin=$('input:radio:checked[name="coin"]').val();
        //alert("querycoin:"+querycoin);
        var url="https://api.coindesk.com/v1/bpi/currentprice.json";
        
	   $.ajax({
			url:url,
			dataType:"json",
			success:function(json){
				var jsonstring=JSON.stringify(json);
				var jsonMovieObject=JSON.parse(jsonstring);
				if(querycoin=="USD"){
					
					$("h2").text(jsonMovieObject.bpi.USD.code);
					$("h2").append(jsonMovieObject.bpi.USD.symbol);
					$("h2").append(jsonMovieObject.bpi.USD.rate);
					$("h2").append(jsonMovieObject.bpi.USD.description);
					$("h2").append(jsonMovieObject.bpi.USD.rate_float);
				   }else if(querycoin=="GBP"){
					  // alert("222querycoin:"+querycoin);
					 //  alert(jsonMovieObject.bpi.GBP.code);
					   $("h2").text(jsonMovieObject.bpi.GBP.code);
						$("h2").append(jsonMovieObject.bpi.GBP.symbol);
						$("h2").append(jsonMovieObject.bpi.GBP.rate);
						$("h2").append(jsonMovieObject.bpi.GBP.description);
						$("h2").append(jsonMovieObject.bpi.GBP.rate_float);
				   }else{
					   //alert("222querycoin:"+querycoin);
					   //alert(jsonMovieObject.bpi.EUR.code);
					   $("h2").text(jsonMovieObject.bpi.EUR.code);
						$("h2").append(jsonMovieObject.bpi.EUR.symbol);
						$("h2").append(jsonMovieObject.bpi.EUR.rate);
						$("h2").append(jsonMovieObject.bpi.EUR.description);
						$("h2").append(jsonMovieObject.bpi.EUR.rate_float);
				   }
				
				
			}
		});

	   
	   
	 });//$('#form').click

     //新增幣別資料
	 $('#insert').click(function(event){
		 var code=$('input[name="code"]').val();
		 alert("code:"+code);
		var symbol=$('input[name="symbol"]').val();
		 alert("symbol:"+symbol);
		 var rate=$('input[name="rate"]').val();
		 alert("rate:"+rate);
		 var description=$('input[name="description"]').val();
		 alert("description:"+description);
		var rate_float=$('input[name="rate_float"]').val();
		 alert("rate_float:"+rate_float);
		 
		 
		 if(!(code=="USD"||code=="GBP"||code=="EUR")){
			 alert("code必須是USD或GBP或EUR");
			 return null;
		 }
		 
	
		 
		 
		 var params={
				 code:code,
				 symbol:symbol,
				 rate:rate,
				 description:description,
				 rate_float:rate_float
		 };
		 
		var url="http://localhost:8080/SpringBootH2JPA/insert";
		 
		 $.ajax({
				url: url,	
				contentType:"application/json",
				data:JSON.stringify(params),
				type:"post",
				dataType:"text",                                            
				success:function(json){
					//var jsonstring=JSON.stringify(json);
					//var jsonMovieObject=JSON.parse(jsonstring);
					alert("RESULT:"+json);
					alert("RESULT:"+"新增成功");
					
				}
			});
	 }); //$('#insert').click
	 
	 //更新時間
	 $('#time').click(function(event){
		 var time=$('input[name="time"]').val();
	        alert("time:"+time);
	        
	        var url="http://localhost:8080/SpringBootH2JPA/updatetime";
	        
	        
	        $.ajax({
	            url: url,                 // url位置
	            type: "get",              // post/get       
	            data: { time: time },     // 輸入的資料
	            //error: function (xhr) { },      // 錯誤後執行的函數
	            success: function (response) {
	            	
	            	alert(response);
	            }// 成功後要執行的函數
	        });
		 
	 });// $('#time').click
	 
	 //更新幣別資料
	 $('#updatecoin').click(function(event){
		 const formElement = document.getElementById("formUpdateCoin");
		 var id=formElement[0].value;
		 alert("id:"+id);
		 var code=formElement[1].value;
		 alert("code:"+code);
		 var symbol=formElement[2].value;
		 
		 var rate=formElement[3].value;
		 
		 var description=formElement[4].value;
		 
		 var rate_float=formElement[5].value;
	/* 	
		if(code=="USD"||code=="GBP"){
			 alert("code必須是USD或GBP或EUR");
		}else if(!code=="EUR"){
			 alert("code必須是USD或GBP或EUR");
		}
		 */
		 if(!(code=="USD"||code=="GBP"||code=="EUR")){
			 alert("code必須是USD或GBP或EUR");
			 return null;
		 }
		
		 
		 var url="http://localhost:8080/SpringBootH2JPA/updatecoin";
		
		   $.ajax({
	            url: url,                 // url位置
	            type: "get",              // post/get       
	            data: {id:id,
	            	code:code,
	            	symbol:symbol,
	            	rate:rate,
	            	description:description,
	            	rate_float:rate_float 
	            	},     // 輸入的資料
	            //error: function (xhr) { },      // 錯誤後執行的函數
	            success: function (response) {
	            	
	            	alert(response.code);
         	    	alert(response.symbol);
         	    	alert(response.description);
	            	//alert(response);
	            }// 成功後要執行的函數
	        });
		 
		 
		
	 });//$('#updatecoin').click
	 
	 
	// 刪除幣別資料
	 $('#deletecoin').click(function(event){
		 const formElement = document.getElementById("formDeleteCoin");
		 var id=formElement[0].value;
		 var code=formElement[1].value;
		 
		 var url="http://localhost:8080/SpringBootH2JPA/deletecoin";
		 
		 if(!(code=="USD"||code=="GBP"||code=="EUR")){
			 alert("code必須是USD或GBP或EUR");
			 return null;
		 }
		 
		 
		 
		 
		   $.ajax({
	            url: url,                 // url位置
	            type: "get",              // post/get       
	            data: { id:id,code:code },     // 輸入的資料
	            //error: function (xhr) { },      // 錯誤後執行的函數
	            success: function (response) {
	            	
	            	alert(response);
	            }// 成功後要執行的函數
	        });
		 
		 
		 
	 
	 });// $('#deletecoin').click
	 
	 
	//查詢幣別
	 $('#querycoin').click(function(event){
		 
		 var querycoin=$('input:radio:checked[name="qcoin"]').val();
		 
		 
		 var url="http://localhost:8080/SpringBootH2JPA/querycoin";
		 
		   $.ajax({
	            url: url,                 // url位置
	            type: "get",              // post/get       
	            data: { querycoin: querycoin },     // 輸入的資料
	            //error: function (xhr) { },      // 錯誤後執行的函數
	            success: function (response) {
	            	/*
	         	    $("h2").text(response.code);
	         	    $("h2").append(response.symbol);
	         	    $("h2").append(response.rate);
	         	    $("h2").append(response.description);
	         	    $("h2").append(response.rate_float);
	         	    */
	         	    var j=2;
	         	    jQuery.each(response,function(i,item){
	         	    	 
	         	    	   
	         	    	$("h"+j).text(item.code);
	 	         	    $("h"+j).append(item.symbol);
	 	         	    $("h"+j).append(item.rate);
	 	         	    $("h"+j).append(item.description);
	 	         	    $("h"+j).append(item.rate_float);
	         	    	//alert(item.code);
	         	    	//alert(item.symbol);
	         	    	//alert(item.description);
	 	         	        j++;
	         	     });
					
	            }// 成功後要執行的函數
	        });

		 
	 });
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
 });
 
 
 
 
 

 
 
 
 </script>
 
</head>
<body>


 <div id="pageContent">
        
      <h1>Choose your boots</h1>
      <h2></h2>
      <h3></h3>
      <h4></h4>
      <h5></h5>
      <h6></h6>
      
<table>
    <thead>
        <tr>
            <th colspan="2">國泰世華 JAVA engineer 線上作業</th>
        </tr>
    </thead>
    <tbody>
   
        <tr>
            <td>
            <form>
                       <center>請選擇查詢幣別(查詢H2資料庫)</center>
             <input type="radio" name="qcoin" value="USD">美元 <br>
             <input type="radio" name="qcoin" value="GBP"> 英鎊<br>
              <input type="radio" name="qcoin" value="EUR"> 歐元<br>
              <input type="button" id="querycoin" name="quc" value="查詢幣別">
              </form>
             </td>
            <td>
            <form>
                       <center>新增幣別資料</center>
              code ：<input type="text" name="code"value="" ><br>
             symbol：<input type="text" name="symbol" value=""><br>
               rate：<input type="text" name="rate" value="" ><br>
        description：<input type="text" name="description" value="" ><br>
         rate_float：<input type="text" name="rate_float" value="" ><br>
             <input id="insert" type="button" value="新增">
             </form>
            </td>
         </tr>
          <tr>
            <td>
            <form>
                     <center>更新時間</center>
          <!-- <input type="text" name="time" value="">時間 <br> -->
                 日期：<input type="text" name="time" value="" id="datepicker"><br>
           <input type="button" id="time"  name="updt" value="更新時間">
             </form>
             </td>
            <td>
           <form name="form" id="formUpdateCoin">
                     <center>更新幣別資料</center>
              id：<input type="text" name="id" value="" ><br>
            code：<input type="text" name="code"value="" ><br>
          symbol：<input type="text" name="symbol" value=""><br>
            rate：<input type="text" name="rate" value="" ><br>
     description：<input type="text" name="description" value="" ><br>
      rate_float：<input type="text" name="rate_float" value="" ><br>
           <input id="updatecoin" type="button" value="更新幣別">
           </form>
            </td>
         </tr>
          <tr>
            <td>
         <form name="form" id="formDeleteCoin">
                 <center>刪除幣別資料</center>
               id：<input type="text" name="id" value="" ><br>
              code：<input type="text" name="code"value="" ><br>
            <!-- symbol：<input type="text" name="symbol" value=""><br> -->
           <!-- rate：<input type="text" name="rate" value="" ><br> -->
        <!--      description：<input type="text" name="description" value="" ><br> -->
           <!-- rate_float：<input type="text" name="rate_float" value="" ><br>  -->
           <input id="deletecoin" type="button" value="刪除幣別">
            </form>
             </td>
             <td>
              <form>
                       <center>呼叫 coindesk 資料轉換(呼叫currentprice.json)</center>
             <input type="radio" name="coin" value="USD">美元 <br>
             <input type="radio" name="coin" value="GBP"> 英鎊<br>
              <input type="radio" name="coin" value="EUR"> 歐元<br>
              <input type="button" id="form"  name="SB" value="呼叫 coindesk">
              </form>
             </td>
             
             
         </tr>
    </tbody>
</table>      
      
      
      
      
   


</div>

</body>
</html>