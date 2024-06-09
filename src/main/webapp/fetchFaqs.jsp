<%@ page import="java.util.List,java.util.Map,org.springframework.jdbc.core.JdbcTemplate,org.springframework.web.context.WebApplicationContext,org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
    WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(application);
    JdbcTemplate jdbcTemplate = (JdbcTemplate) context.getBean("jdbcTemplate");
    List<Map<String, Object>> faqs = jdbcTemplate.queryForList("SELECT * FROM faq WHERE status='answered'");
    for (Map<String, Object> faq : faqs) {
%>
<button class="accordion"><%= faq.get("query") %></button>
<div class="panel">
    <p><%= faq.get("response") %></p>
    <p>Answered on: <%= faq.get("date_answered") %></p>
</div>
<%
    }
%>
