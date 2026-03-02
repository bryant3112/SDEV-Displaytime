<%@ page import="chapter38.TimeBean" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="timeBeanId"
             class="chapter38.TimeBean"
             scope="application" >
</jsp:useBean>

<%
    // Get the selected indexes from the form
    int localeIndex = Integer.parseInt(request.getParameter("localeIndex"));
    int timeZoneIndex = Integer.parseInt(request.getParameter("timeZoneIndex"));

    // Get the selected locale and time zone
    String selectedLocaleStr = timeBeanId.getAllLocale()[localeIndex];
    String selectedTimeZoneID = timeBeanId.getAllTimeZone()[timeZoneIndex];

    // Convert to Locale object
    String[] parts = selectedLocaleStr.split("_");
    Locale selectedLocale;
    if (parts.length == 1) {
        selectedLocale = new Locale(parts[0]);
    } else if (parts.length == 2) {
        selectedLocale = new Locale(parts[0], parts[1]);
    } else {
        selectedLocale = new Locale(parts[0], parts[1], parts[2]);
    }

    // Get the time in the selected time zone
    Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone(selectedTimeZoneID), selectedLocale);
    Date currentTime = calendar.getTime();
    String formattedTime = java.text.DateFormat.getDateTimeInstance(
            java.text.DateFormat.FULL, java.text.DateFormat.FULL, selectedLocale).format(currentTime);
%>

<html>
<head>
    <title>Display Time</title>
</head>
<body>
    <h3>Current Time</h3>
    <p>Locale: <%= selectedLocaleStr %></p>
    <p>Time Zone: <%= selectedTimeZoneID %></p>
    <p>Current Time: <%= formattedTime %></p>
    <br />
    <a href="DisplayTimeForm.jsp">Go Back</a>
</body>
</html>