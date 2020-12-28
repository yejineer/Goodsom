<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="../includeTop.jsp"%>

<body>

	<%@ include file="../header.jsp"%>

	<main id="main">

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="section-title">
					<h2>
						<c:if test="${listType eq 1}">등록한 게시글 목록</c:if>
						<c:if test="${listType eq 2}">구매한 목록</c:if>
						<c:if test="${listType eq 3}">좋아요한 목록</c:if>
					</h2>
				</div>

				<!-- 등록한 목록 보기 -->
				<c:if test="${listType eq 1}">
					<!-- 공동구매 -->
					<h3><b>공동구매</b></h3>
					<br />
					<div class="row portfolio-container">
							<c:if test="${empty groupBuyList}">등록한 공동구매 게시글이 없습니다.</c:if>
							<c:forEach var="groupBuy" items="${groupBuyList}" varStatus="status">
							<div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
								<div class="portfolio-wrap">
									<figure style="background: white; text-align: center;">
										<img src="${groupBuy.imgs_g[0].url}" class="img-fluid" alt="" style="height: 100%;">
										<a
											href="<%=request.getContextPath()%>/assets/img/portfolio/portfolio-1.jpg"
											data-gall="portfolioGallery" class="link-preview venobox"
											title="Preview"><i class="bx bx-plus"></i></a>
										<a
											href="<c:url value='../groupBuy/detail.do'><c:param name="groupBuyId" value="${groupBuy.groupBuyId}"/></c:url>"
											class="link-details" title="More Details"><i
											class="bx bx-link"></i></a>
									</figure>

									<div class="portfolio-info" style="height: 105px;">
										<h4>
											<a
												href="<c:url value='/groupBuy/detail.do'><c:param name="groupBuyId" value="${groupBuy.groupBuyId}"/>
							</c:url>">${groupBuy.title}</a>
										</h4>

										<div>
											<span class="mx-2" style="float: left;">금액: <fmt:formatNumber
													value="${groupBuy.price}" pattern="#,###원" />
											</span> <br /> <span style="color: red; float: left;"><fmt:formatNumber
													value="${groupBuy.rate}" />% 달성</span> <span
												style="float: right;">&nbsp; 마감일: <fmt:formatDate
													value="${groupBuy.endDate}" pattern="yyyy-MM-dd" />
											</span>

										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<br>
					<br>

					<!-- 경매 -->
					<h3><b>경매</b></h3>
					<br />
					<div class="row portfolio-container">
							<c:if test="${empty auctionList}">등록한 경매 게시글이 없습니다.</c:if>
							<c:forEach var="auction" items="${auctionList}"
								varStatus="status">
							<div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
								<div class="portfolio-wrap">
									<figure style="background: white; text-align: center;">
										<a href="<c:url value='../auction/detail.do'>
											<c:param name="auctionId" value="${auction.auctionId}"/></c:url>">
											<img src="${auction.imgs_a[0].url}" class="img-fluid" alt="" style="height: 100%;">
										</a>
										<a
											href="<%=request.getContextPath()%>/assets/img/portfolio/portfolio-1.jpg"
											data-gall="portfolioGallery" class="link-preview venobox"
											title="Preview"><i class="bx bx-plus"></i></a>
										<a href="portfolio-details.html" class="link-details"
											title="More Details"><i class="bx bx-link"></i></a>
									</figure>


									<div class="portfolio-info" style="height: 105px;">
										<h4>
											<a href="<c:url value='/auction/detail.do'>
												<c:param name="auctionId" value="${auction.auctionId}"/>
								 				</c:url>">${auction.title}
								 			</a>
										</h4>
										<p>
											현재 최고 금액
											<fmt:formatNumber value="${auction.maxPrice}"
												pattern="#,###원" />
										</p>
										<p class="portfolio-info-endDate">
											~
											<fmt:formatDate value="${auction.endDate}"
												pattern="yyyy-MM-dd" />
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>

				<!-- 결제 목록 보기 -->
				<c:if test="${listType eq 2}">
					<h3><b>공동구매</b></h3>
					<br />
					<div class="row portfolio-container">
						<c:if test="${empty groupBuyOrderList}">구매한 공동구매 내역이 없습니다.</c:if>
						<c:forEach var="order" items="${groupBuyOrderList}" varStatus="status">
						<div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
				            <div class="portfolio-wrap">
				              <figure>
									<a href="<c:url value='../groupBuy/detail.do'>
												<c:param name="groupBuyId" value="${order.groupBuyId}" />
											</c:url>">
											<img src="${order.groupBuy.imgs_g[0].url}" class="img-fluid" alt="">
									</a>
							  </figure>
									<div class="portfolio-info">
										<h4> <a href="<c:url value='../groupBuy/detail.do'>
														<c:param name="groupBuyId" value="${order.groupBuyId}" />
													</c:url>">
												${order.groupBuy.title}</a>
										</h4>
									<div>
										<span class="meta d-inline-block mb-3"> 
											<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /> 
											<span class="mx-2"> 총액 : ${order.totalPrice}원</span>
											<span style="float: right;">
												<a href="<c:url value='../order/groupBuy/detail.do'>
													<c:param name="orderId" value ="${order.orderId}" />
												</c:url>">
												상세보기 > </a>
											</span>
										</span>
									</div>
									</div>
								</div>
								</div>
							</c:forEach>
						</div>

					<br>
					<br>

					<h3><b>경매</b></h3>
					<br />
					<div class="row portfolio-container">
						<c:if test="${empty auctionOrderList}">구매한 경매 내역이 없습니다.</c:if>
						<c:forEach var="order" items="${auctionOrderList}" varStatus="status">
						<div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
				            <div class="portfolio-wrap">
				              <figure>
									<a href="<c:url value='../auction/detail.do'>
												<c:param name="auctionId" value="${order.auctionId}" />
											</c:url>">
											<img src="${order.auction.imgs_a[0].url}" class="img-fluid" alt="">
									</a>
							  </figure>
									<div class="portfolio-info">
										<h4>
											<a href="<c:url value='../auction/detail.do'>
														<c:param name="auctionId" value="${order.auctionId}" />
													</c:url>">
												${order.auction.title}</a>
										</h4>
									</div>
										<span class="meta d-inline-block mb-3"> 
											<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /> 
											<span class="mx-2"> 총액 : ${order.totalPrice}원</span>
											<span style="float: right;">
												<a href="<c:url value='../order/auction/detail.do'>
														<c:param name="orderId" value ="${order.orderId}" />
													</c:url>">
													상세보기 > </a>
											</span>
										</span>
									</div>
									
								</div>
							</c:forEach>
						</div>
				</c:if>
				
				
				<!-- 좋아요한 목록 보기 -->
				<c:if test="${listType eq 3}">
					<!-- 공동구매 -->
					<h3><b>공동구매</b></h3>
					<br />
					<div class="row portfolio-container">
						<c:if test="${empty likedGroupBuyList}">좋아요한 공동구매 게시글이 없습니다.</c:if>
						<c:forEach var="groupBuy" items="${likedGroupBuyList}" varStatus="status">
							<div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
								<div class="portfolio-wrap">
									<figure style="background: white; text-align: center;">
										<img src="${groupBuy.imgs_g[0].url}" class="img-fluid" alt="" style="height: 100%;">
										<a
											href="<%=request.getContextPath()%>/assets/img/portfolio/portfolio-1.jpg"
											data-gall="portfolioGallery" class="link-preview venobox"
											title="Preview"><i class="bx bx-plus"></i></a>
										<a
											href="<c:url value='../groupBuy/detail.do'><c:param name="groupBuyId" value="${groupBuy.groupBuyId}"/></c:url>"
											class="link-details" title="More Details"><i
											class="bx bx-link"></i></a>
									</figure>
									<div class="portfolio-info" style="height: 105px;">
										<h4>
											<a href="<c:url value='/groupBuy/detail.do'>
														<c:param name="groupBuyId" value="${groupBuy.groupBuyId}"/>
													</c:url>">${groupBuy.title}</a>
										</h4>
										<div>
											<span class="mx-2" style="float: left;">금액: <fmt:formatNumber
													value="${groupBuy.price}" pattern="#,###원" />
											</span>
											<br />
											<span style="color: red; float: left;"><fmt:formatNumber
													value="${groupBuy.rate}" />% 달성
											</span>
											<span
												style="float: right;">&nbsp; 마감일: <fmt:formatDate
													value="${groupBuy.endDate}" pattern="yyyy-MM-dd" />
											</span>
	
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<br>
					<br>

					<!-- 경매 -->
					<h3><b>경매</b></h3>
					<br />
					<div class="row portfolio-container">
						<c:if test="${empty likedAuctionList}">좋아요한 경매 게시글이 없습니다.</c:if>
						<c:forEach var="auction" items="${likedAuctionList}" varStatus="status">
							<div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
								<div class="portfolio-wrap">
									<figure style="background: white; text-align: center;">
										<a href="<c:url value='../auction/detail.do'>
												<c:param name="auctionId" value="${auction.auctionId}"/></c:url>">
											<img src="${auction.imgs_a[0].url}" class="img-fluid" alt="" style="height: 100%;">
										</a>
										<a
											href="<%=request.getContextPath()%>/assets/img/portfolio/portfolio-1.jpg"
											data-gall="portfolioGallery" class="link-preview venobox"
											title="Preview"><i class="bx bx-plus"></i></a>
										<a href="portfolio-details.html" class="link-details"
											title="More Details"><i class="bx bx-link"></i></a>
									</figure>
	
	
									<div class="portfolio-info" style="height: 105px;">
										<h4>
											<a href="<c:url value='/auction/detail.do'>
												<c:param name="auctionId" value="${auction.auctionId}"/>
											</c:url>">${auction.title}</a>
										</h4>
										<p>
											현재 최고 금액 <fmt:formatNumber value="${auction.maxPrice}" pattern="#,###원" />
										</p>
										<p class="portfolio-info-endDate">
												~ <fmt:formatDate value="${auction.endDate}" pattern="yyyy-MM-dd" />
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>				


				<!-- 구현 끝 -->

				<!-- 페이징 -->
<!-- 				<div class="col-12 mt-5 text-center"> -->
<!-- 					<span class="p-3">1</span> <a href="#" class="p-3">2</a> <a -->
<!-- 						href="#" class="p-3">3</a> <a href="#" class="p-3">4</a> -->
<!-- 				</div> -->

			</div>
		</section>
		<!-- End Portfolio Section -->

	</main>
	<!-- End #main -->

	<%@ include file="../includeBottom.jsp"%>