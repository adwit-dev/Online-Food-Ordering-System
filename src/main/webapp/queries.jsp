<%@ page import="java.util.List,java.util.Map,org.springframework.jdbc.core.JdbcTemplate,org.springframework.web.context.WebApplicationContext,org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
    WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(application);
    JdbcTemplate jdbcTemplate = (JdbcTemplate) context.getBean("jdbcTemplate");
    List<Map<String, Object>> queries = jdbcTemplate.queryForList("SELECT * FROM faq WHERE status='pending' OR status='answered'");
    for (Map<String, Object> row : queries) {
%>
<tr>
    <td><%= row.get("id") %></td>
    <td><%= row.get("query") %></td>
    <td><%= row.get("status") %></td>
    <td><%= row.get("date_posted") %></td>
    <td>
        <% if ("pending".equals(row.get("status").toString())) { %>
            <form action="submitResponse" method="post">
                <input type="hidden" name="id" value="<%= row.get("id") %>">
                <textarea name="response" rows="3" cols="30"></textarea>
                <input type="submit" value="Submit Response">
            </form>
        <% } %>
        <a href="deleteQuery?id=<%= row.get("id") %>">Delete</a>
    </td>
</tr>
<%
    }
%>

