<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dummyDownload.aspx.cs" Inherits="dummyDownload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>Downloading...</title>
    <script>
        function playAndDownload() {

            // 🔊 play audio
            var audio = new Audio('audio/voice.mp3');
            audio.play().catch(function () { });

            // ⏳ after 1 second start download
            setTimeout(function () {
                window.location = 'dummyDownload.aspx?download=1';
            }, 1000);
        }
    </script>
</head>
<body onload="playAndDownload()">

<form id="form1" runat="server">

     <h3>Processing...</h3>
</form>

</body>
</html>
