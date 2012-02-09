<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<c:set var="len" value="${fn:length(list)-1}" ></c:set>
[
<c:forEach items="${list}" var="obj" varStatus="i">
{
	id:'${obj.id}',
	text:'${obj.title}',
	<c:if test="${obj.leaf == 1}">
		leaf:true,
	</c:if>
	singleClickExpand:true
}
	<c:if test="${i.index<len}">,</c:if>
</c:forEach>
]