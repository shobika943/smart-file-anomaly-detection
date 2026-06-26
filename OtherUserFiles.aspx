<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OtherUserFiles.aspx.cs" Inherits="DCOICLOUD.OtherUserFiles" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Other User Files</title>
</head>
<body>
    <form id="form1" runat="server">

        <h2>Other Users Files</h2>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="filename" HeaderText="File Name" />
                <asp:BoundField DataField="uploadedby" HeaderText="Uploaded By" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:HyperLink 
                            ID="lnkView" 
                            runat="server"
                            Text="View / Download"
                            NavigateUrl='<%# "CaptchaVerify.aspx?fileid=" + Eval("fileid") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>

    </form>
</body>
</html>
