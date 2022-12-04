const replyService = (function(){
	
	function selectAll(data,callback){
		let boardnum = data.boardnum;
		let pagenum = data.pagenum;
		
//		$.getJSON("요청URI",성공시 호출할 함수).fail(실패시 호출할 함수)
		$.getJSON(
			// /reply/list/123/1.json
			"/reply/list/"+boardnum+"/"+pagenum+".json",
			//위의 uri의 JSON을 정상적으로 읽어왔다면 아래에 있는 함수를 호출해준다.
			//그 때 매개변수 data에는 읽어온 json 내용이 담기게 된다.
			function(data){
				if(callback){
					callback(data.replyCnt, data.list);
				}
			}
		).fail(function(){
			//실패시 수행할 코드 작성하기
		})
	}
	
	function insert(reply,callback){
		console.log("추가");
		$.ajax({
			type:"POST",
			url:"/reply/regist",
			data:JSON.stringify(reply),
			contentType:"application/json; charset=utf-8",
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr, status, err){
				//ajax 실패시 호출할 내용들을 작성
			}
		});
	}
	
	
	
	
	return {add:insert,getList:selectAll,remove:"",modify:"",displayTime:""};
})();






