<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="../includeTop.jsp" %> 

<body>

 <%@ include file="../header.jsp" %> 

  <main id="main">

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>경매</h2>
          <p>솜솜이들의 경매를 위한 공간</p>
        </div>

        <div class="form-group" align="left" style="margin-bottom:50px;">
          <a class="btn btn-primary py-3 px-5" href="<c:url value='/auction/create.do'></c:url>">경매 등록</a>
        </div>
	

        <div class="row portfolio-container">
		<c:forEach var="auction" items="${auctionList}" varStatus="status">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
            <div class="portfolio-wrap">
              <figure style="background: white; text-align: center;">
              	<a href="<c:url value='/auction/detail.do'>
					<c:param name="auctionId" value="${auction.auctionId}"/></c:url>">
					<img src="${auction.imgs_a[0].url}" class="img-fluid" alt="" style="height: 100%;">
				</a>
                <a href="<%=request.getContextPath()%>/assets/img/portfolio/portfolio-1.jpg" data-gall="portfolioGallery" class="link-preview venobox" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>
              

              <div class="portfolio-info" style="height: 105px;">
              	<%-- <div style="float:right">조회수: ${auction.count}&nbsp;&nbsp;</div> --%>
				<div>
					<%-- <div>
						<c:if test="${auction.state eq 'proceeding'}" >
							<h5>Proceeding</h5>
						</c:if>
						<c:if test="${auction.state eq 'closed'}" >
							<h5>Closed</h5>
						</c:if>
					
						<span>&nbsp; ~ <fmt:formatDate value="${auction.endDate}" pattern="yyyy-MM-dd" /></span>
					</div> --%>
              
	                <h4><a href="<c:url value='/auction/detail.do'><c:param name="auctionId" value="${auction.auctionId}"/>
								 </c:url>">${auction.title}</a></h4>
						<div style="float:left; color: #898a8c;">
							<strong>시작가</strong>: <fmt:formatNumber value="${auction.startPrice}" pattern="#,###원"/>
						</div>
						<div style="float:right; color: #898a8c;">
							<strong>최고가</strong>: <fmt:formatNumber value="${auction.maxPrice}" pattern="#,###원"/>
						</div>
						<br/>
						<div style="float:left; color: #898a8c;">
							<strong>마감일</strong>: <fmt:formatDate value="${auction.endDate}" pattern="yyyy-MM-dd" />
						</div>
						<c:if test="${auction.state eq 'proceeding'}">
							<span style ="color: #2f94d8; float:right; font-weight: bold;">진행 중</span>
						</c:if>
						<c:if test="${auction.state eq 'closed'}">
							<span style ="color: #ff5757; float:right; font-weight: bold;">마감</span>
						</c:if>
	
					<%-- <span class="mx-2">시작 가격</span> 
					<a href="#"><fmt:formatNumber value="${auction.price}" pattern="#,###원"/></a> <br/><br/>
				
					<span class="mx-2">현재 최고 금액</span> 
					<a href="#"><fmt:formatNumber value="${auction.maxPrice}" pattern="#,###원"/></a> --%>

					<%-- <p><c:out value="${auction.content}" ></c:out><p> --%>		
                <%-- <p>현재 최고 금액  <fmt:formatNumber value="${auction.maxPrice}" pattern="#,###원"/></p>
                <p class="portfolio-info-endDate">~<fmt:formatDate value="${auction.endDate}" pattern="yyyy-MM-dd" /></p> --%>
              </div>
            </div>
          </div>
         	</div>
         </c:forEach>
      	 </div>
      </div>
    </section><!-- End Portfolio Section -->

  </main><!-- End #main -->

  <%@ include file="../includeBottom.jsp" %> 