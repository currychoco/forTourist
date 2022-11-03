<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
    <div>
        <input type="date" id="date" />
        <button onclick="searchFestival()">search</button>
    </div>

    <div>
        <table>
            <tbody class="container">
                <tr>
                </tr>
            </tbody>
        </table>
    </div>

    <script src="resources/search_festival.js"></script>
</body>
</html>