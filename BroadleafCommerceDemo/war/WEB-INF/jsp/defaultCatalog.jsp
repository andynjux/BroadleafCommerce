<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:insertDefinition name="baseNoSide">
	<tiles:putAttribute name="mainContent" type="string">

	<span id="greeting">Logged in as <b><security:authentication property="principal.username" /></b></span>

	<h1>Default Category View For: <c:out value="${currentCategory.name}"/></h1>

	Breadcrumb: <blc:breadcrumb categoryList="${breadcrumbCategories}" />
	<br />
	Category: <blc:categoryLink category="${currentCategory}" />
	
	<c:choose>
		<c:when test="${fn:length(currentCategory.childCategories) > 0}">
			<h2>Here is a list of its sub-categories:</h2>

			<br/>
			
			<table border="0">
			<tr>
				<th>Name</th>
			</tr>
			<c:forEach var="child" items="${currentCategory.childCategories}" varStatus="status">
				<tr>
					<td><blc:categoryLink category="${currentCategory}" /></td>
				</tr>
			</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h2>This category has no sub-categories</h2>
		</c:otherwise>	
	</c:choose>
	
	<c:choose>
		<c:when test="${fn:length(currentProducts) > 0}">
			<h2>Here is a list of products under this category:</h2>
		
			<table border="0">
			<tr>
				<th>Name</th>
			</tr>
			<c:forEach var="product" items="${currentProducts}" varStatus="status">
				<tr>
					<td><blc:productLink product="${product}" /></td>
				</tr>
			</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h2>This category has no products</h2>
		</c:otherwise>	
	</c:choose>

	</tiles:putAttribute>
</tiles:insertDefinition>