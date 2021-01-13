$(document).ready(function() {
	$("#btn-out").on("click",function() {
		if(confirm("로그아웃하시겠습니까?")) {
			location.href="/member/logout";
			}
		})

	$("#btn-mypage").on("click",function() {
			location.href="/member/myPage";
		})
   })

