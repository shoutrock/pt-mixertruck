<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>평택 레미콘</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/jquery.modal.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/style.css">
    <script>var ctx = "${pageContext.request.contextPath}";</script>
    <script src="${pageContext.request.contextPath}/style/js/lib/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/lib/jquery.modal.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/carCreate.js"></script>
<body>
<header>
    <h1>
        <a href="carList.html">평택 레미콘</a>
    </h1>
    <ul class="login-info">
        <li class="logout-btn"><a href="#">로그아웃</a></li>
    </ul>
</header>
<nav>
    <ul>
        <li class="user-info">
            이한종 님
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/car/list.do">차량목록</a>
        </li>
        <li class="on">
            <a href="${pageContext.request.contextPath}/views/carCreate.jsp">차량등록</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/customer/list.do">고객목록</a>
        </li>
        <li>
            <a href="carRepairList.html">차량수리내역</a>
        </li>
        <li>
            <a href="#">매출</a>
        </li>
    </ul>
</nav>
<div class="contents-wrap">
    <h2 class="page-title">차량등록</h2>
    <div class="contents">
        <h4 class="form_title">차량등록</h4>
        <form action="${pageContext.request.contextPath}/car/regist.do" method="post">
            <table class="table">
                <tr>
                    <td>제조사</td>
                    <td class="alignLeft">
                        <select name="manufacturer">
                            <option>== 제조사선택 ==</option>
                            <option value="Hyundai">현대</option>
                            <option value="Daewoo">대우</option>
                            <option value="Ssangyong">쌍용</option>
                            <option value="Samsung">삼성</option>
                            <option value="Asia">아시아</option>
                            <option value="Etc">기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td class="alignLeft"><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <td>제조일자</td>
                    <td class="alignLeft"><input type="text" name="productionDate"/></td>
                </tr>
                <tr>
                    <td>구매일자</td>
                    <td class="alignLeft"><input type="text" name="purchase.purchaseDate"/></td>
                </tr>
                <tr>
                    <td>구매금액</td>
                    <td class="alignLeft"><input type="text" name="purchase.amount"/></td>
                </tr>
                <tr>
                    <td>매도인</td>
                    <td class="alignLeft">
                        <input type="hidden" name="purchase.seller.usid" id="sellerId" size="5"/>
                        <input type="text" name="purchase.seller.name" id="sellerName"/>
                        <button id="btnCustomerSearch" type="button" class="btn btn-default">검색</button>
                    </td>
                </tr>
                <tr>
                    <td>특이사항</td>
                    <td class="alignLeft"><textarea rows="3" name="purchase.seller.remark"></textarea></td>
                </tr>
            </table>
            <div class="alignRight btn-group">
                <button type="reset" class="btn btn-default">초기화</button>
                <button type="submit" class="btn btn-primary">저장</button>
            </div>
        </form>
    </div>

    <div id="detailModal" class="modal modal_wrap" style="display:none; width:560px; ">
        <div class="modal_contents">
            <h3>고객 상세정보</h3>
            <div class="modal_con">
                <h4 class="form_title">고객정보 조회</h4>
                <div class="s_box">
                    <label>
                        <span>이름</span>
                        <input type="text" id="customerName">
                    </label>
                </div>

                <div class="fixed-table-container">
                    <div class="header-background"></div>
                    <div class="fixed-table-container-inner" style="height:100px;">
                        <table id="customerList" class="table">
                            <colgroup>
                                <col width="25%"/>
                                <col width="25%"/>
                                <col width="25%"/>
                                <col width="25%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>
                                    <div class="fixed-header">
                                        <div class="th-inner">
                                            <span>번호</span>
                                        </div>
                                    </div>
                                </th>
                                <th>
                                    <div class="fixed-header">
                                        <div class="th-inner">
                                            <span>이름</span>
                                        </div>
                                    </div>
                                </th>
                                <th>
                                    <div class="fixed-header">
                                        <div class="th-inner">
                                            <span>연락처</span>
                                        </div>
                                    </div>
                                </th>
                                <th>
                                    <div class="fixed-header">
                                        <div class="th-inner">
                                            <span>주민등록번호</span>
                                        </div>
                                    </div>
                                    <div></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <%-- 검색 결과가 있을 경우 (고정 높이 초과시 스크롤) --%>
                            <tr>
                                <td>test</td>
                                <td>test</td>
                                <td>test</td>
                                <td>test</td>
                            </tr>

                            <%-- 검색 결과가 없을 경우 --%>
                            <%--<tr class="no-list">--%>
                                <%--<td colspan="4">--%>
                                    <%--검색 결과가 없습니다.--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="btn_group">
                <a href="#" rel="modal:close">
                    <button type="button" class="btn btn-default">닫기</button>
                </a>
            </div>
        </div>
    </div>

</div>
<footer>
    <p> &#169; 2016. Pyeongtaek Remicon all rights reserved.</p>
</footer>
</body>
</html>