<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="../includeTop.jsp" %> 
 
<body>

<%@ include file="../header.jsp" %> 
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>${auction.title}</h2>
          <ol>
            <li><a href="/index.do">Home</a></li>
            <li>${auction.title}</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="portfolio-details-container">

          <div class="owl-carousel portfolio-details-carousel">
            <img src="${auction.img}" class="img-fluid" alt="">
            <img src="<%=request.getContextPath()%>/assets/img/portfolio-details-2.jpg" class="img-fluid" alt="">
            <img src="<%=request.getContextPath()%>/assets/img/portfolio-details-3.jpg" class="img-fluid" alt="">
          </div>

          <div class="portfolio-info">
            <h3>${auction.title}</h3>
            <ul>
              <li><strong>작성자</strong>: ${writer}</li>
              <li><strong>현재 최고 금액</strong>: ${auction.maxPrice}</li>
              <li><strong>Project date</strong>: 01 March, 2020</li>
              <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
            </ul>
          </div>

        </div>

        <div class="portfolio-description">
      		<c:if test="${auction.state eq 'proceeding'}" >
				<h2>Proceeding</h2>
			</c:if>
			<c:if test="${auction.state eq 'closed'}" >
				<h2>Closed</h2>
			</c:if>
          <p>
            <c:out value="${auction.content}" ></c:out>
          </p>
        </div>

      </div>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->
<%@ include file="../includeBottom.jsp" %> 