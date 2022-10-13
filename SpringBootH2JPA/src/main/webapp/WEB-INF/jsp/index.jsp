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
	 
	 
//�I�s coindesk API
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

     //�s�W���O���
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
			 alert("code�����OUSD��GBP��EUR");
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
					alert("RESULT:"+"�s�W���\");
					
				}
			});
	 }); //$('#insert').click
	 
	 //��s�ɶ�
	 $('#time').click(function(event){
		 var time=$('input[name="time"]').val();
	        alert("time:"+time);
	        
	        var url="http://localhost:8080/SpringBootH2JPA/updatetime";
	        
	        
	        $.ajax({
	            url: url,                 // url��m
	            type: "get",              // post/get       
	            data: { time: time },     // ��J�����
	            //error: function (xhr) { },      // ���~����檺���
	            success: function (response) {
	            	
	            	alert(response);
	            }// ���\��n���檺���
	        });
		 
	 });// $('#time').click
	 
	 //��s���O���
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
			 alert("code�����OUSD��GBP��EUR");
		}else if(!code=="EUR"){
			 alert("code�����OUSD��GBP��EUR");
		}
		 */
		 if(!(code=="USD"||code=="GBP"||code=="EUR")){
			 alert("code�����OUSD��GBP��EUR");
			 return null;
		 }
		
		 
		 var url="http://localhost:8080/SpringBootH2JPA/updatecoin";
		
		   $.ajax({
	            url: url,                 // url��m
	            type: "get",              // post/get       
	            data: {id:id,
	            	code:code,
	            	symbol:symbol,
	            	rate:rate,
	            	description:description,
	            	rate_float:rate_float 
	            	},     // ��J�����
	            //error: function (xhr) { },      // ���~����檺���
	            success: function (response) {
	            	
	            	alert(response.code);
         	    	alert(response.symbol);
         	    	alert(response.description);
	            	//alert(response);
	            }// ���\��n���檺���
	        });
		 
		 
		
	 });//$('#updatecoin').click
	 
	 
	// �R�����O���
	 $('#deletecoin').click(function(event){
		 const formElement = document.getElementById("formDeleteCoin");
		 var id=formElement[0].value;
		 var code=formElement[1].value;
		 
		 var url="http://localhost:8080/SpringBootH2JPA/deletecoin";
		 
		 if(!(code=="USD"||code=="GBP"||code=="EUR")){
			 alert("code�����OUSD��GBP��EUR");
			 return null;
		 }
		 
		 
		 
		 
		   $.ajax({
	            url: url,                 // url��m
	            type: "get",              // post/get       
	            data: { id:id,code:code },     // ��J�����
	            //error: function (xhr) { },      // ���~����檺���
	            success: function (response) {
	            	
	            	alert(response);
	            }// ���\��n���檺���
	        });
		 
		 
		 
	 
	 });// $('#deletecoin').click
	 
	 
	//�d�߹��O
	 $('#querycoin').click(function(event){
		 
		 var querycoin=$('input:radio:checked[name="qcoin"]').val();
		 
		 
		 var url="http://localhost:8080/SpringBootH2JPA/querycoin";
		 
		   $.ajax({
	            url: url,                 // url��m
	            type: "get",              // post/get       
	            data: { querycoin: querycoin },     // ��J�����
	            //error: function (xhr) { },      // ���~����檺���
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
					
	            }// ���\��n���檺���
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
            <th colspan="2">����@�� JAVA engineer �u�W�@�~</th>
        </tr>
    </thead>
    <tbody>
   
        <tr>
            <td>
            <form>
                       <center>�п�ܬd�߹��O(�d��H2��Ʈw)</center>
             <input type="radio" name="qcoin" value="USD">���� <br>
             <input type="radio" name="qcoin" value="GBP"> �^��<br>
              <input type="radio" name="qcoin" value="EUR"> �ڤ�<br>
              <input type="button" id="querycoin" name="quc" value="�d�߹��O">
              </form>
             </td>
            <td>
            <form>
                       <center>�s�W���O���</center>
              code �G<input type="text" name="code"value="" ><br>
             symbol�G<input type="text" name="symbol" value=""><br>
               rate�G<input type="text" name="rate" value="" ><br>
        description�G<input type="text" name="description" value="" ><br>
         rate_float�G<input type="text" name="rate_float" value="" ><br>
             <input id="insert" type="button" value="�s�W">
             </form>
            </td>
         </tr>
          <tr>
            <td>
            <form>
                     <center>��s�ɶ�</center>
          <!-- <input type="text" name="time" value="">�ɶ� <br> -->
                 ����G<input type="text" name="time" value="" id="datepicker"><br>
           <input type="button" id="time"  name="updt" value="��s�ɶ�">
             </form>
             </td>
            <td>
           <form name="form" id="formUpdateCoin">
                     <center>��s���O���</center>
              id�G<input type="text" name="id" value="" ><br>
            code�G<input type="text" name="code"value="" ><br>
          symbol�G<input type="text" name="symbol" value=""><br>
            rate�G<input type="text" name="rate" value="" ><br>
     description�G<input type="text" name="description" value="" ><br>
      rate_float�G<input type="text" name="rate_float" value="" ><br>
           <input id="updatecoin" type="button" value="��s���O">
           </form>
            </td>
         </tr>
          <tr>
            <td>
         <form name="form" id="formDeleteCoin">
                 <center>�R�����O���</center>
               id�G<input type="text" name="id" value="" ><br>
              code�G<input type="text" name="code"value="" ><br>
            <!-- symbol�G<input type="text" name="symbol" value=""><br> -->
           <!-- rate�G<input type="text" name="rate" value="" ><br> -->
        <!--      description�G<input type="text" name="description" value="" ><br> -->
           <!-- rate_float�G<input type="text" name="rate_float" value="" ><br>  -->
           <input id="deletecoin" type="button" value="�R�����O">
            </form>
             </td>
             <td>
              <form>
                       <center>�I�s coindesk ����ഫ(�I�scurrentprice.json)</center>
             <input type="radio" name="coin" value="USD">���� <br>
             <input type="radio" name="coin" value="GBP"> �^��<br>
              <input type="radio" name="coin" value="EUR"> �ڤ�<br>
              <input type="button" id="form"  name="SB" value="�I�s coindesk">
              </form>
             </td>
             
             
         </tr>
    </tbody>
</table>      
      
      
      
      
   


</div>

</body>
</html>