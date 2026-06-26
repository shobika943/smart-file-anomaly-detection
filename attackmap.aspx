<%@ Page Language="C#" AutoEventWireup="true" CodeFile="attackmap.aspx.cs" Inherits="attackmap" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">

<title>Cyber Attack Map</title>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>

<style>

body{
background:#020617;
color:white;
font-family:Arial;
padding:30px;
}

#map{
height:600px;
width:100%;
border-radius:10px;
}

h1{
text-align:center;
color:#00c8ff;
}

</style>

<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<script>

var map;

function initMap(){

map = L.map('map').setView([20,0],2);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

loadAttacks();

}

function loadAttacks(){

fetch("GetSuspiciousLocations.aspx")

.then(response => response.json())

.then(data => {

data.forEach(function(user){

var marker = L.marker([user.Latitude,user.Longitude]).addTo(map);

marker.bindPopup(
"<b>User:</b> "+user.UserName+"<br>"+
"<b>IP:</b> "+user.IPAddress+"<br>"+
"<b>Location:</b> "+user.Location+"<br>"+
"<b>Reason:</b> "+user.Reason
);

});

});

}

</script>

</head>

<body onload="initMap()">

<form id="Form1" runat="server">

<h1>Real-Time Cyber Attack Map</h1>

<div id="map"></div>

</form>

</body>
</html>