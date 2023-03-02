<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
</main>
<!-- TOP/BOTTOM 버튼 시작 (버튼 추가) -->

<div id="topBtn">
    <ul>
        <li><a class="btnTop" title="위로"><i class="fas fa-angle-double-up"></i></a></li>
        <li><a class="btnBottom" title="아래로"><i class="fas fa-angle-double-down"></i></a></li>
    </ul>
</div>

<!-- TOP/BOTTOM 버튼 끝 (버튼 추가) -->


<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
<!-- TOP/Bottom 버튼 시작 (jQuery 세팅) -->
<script>
    $(document).ready(function() {
    	$(window).scroll(function() { 
            if ($(this).scrollTop() > 370) {
            	$('#topBtn').fadeIn();
            } else {
            	$('#topBtn').fadeOut();
            }
        });

    	$(".btnTop").click(function() {
            $('html, body').animate({
            	scrollTop: 0	
            }, 500);			
            
            return false;
    	});
        
        $(".btnBottom").click(function() {
            var height = $(document).height()
            $('html, body').animate({
                scrollTop: height
            }, 500);
            
            return false;
        });
    });
</script>
<!-- TOP/Bottom 버튼 끝 (jQuery 세팅) -->
</html>
<!-- footer -->
<div class="container" style="bottom: 0;">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="footer_policy" class="nav-link px-2 text-muted">개인정보처리방침</a></li>
      <li class="nav-item"><a href="footer_contact" class="nav-link px-2 text-muted">공연등록문의</a></li>
      
      <li class="nav-item"><a href="footer_company" class="nav-link px-2 text-muted">회사소개</a></li>
      <li class="nav-item"><a href="qna_List" class="nav-link px-2 text-muted">Q&A</a></li>
    </ul>
    <p class="text-center text-muted">&copy; 2023 Company, Inc</p>
  </footer>
</div>
<!-- footer 끝 -->