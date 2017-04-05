<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="HappyValleyKennels.controls.LoginControl" %>
 <div id="login">
            <asp:Label ID="lblHeader" runat="server" Text=""><h1><img src="images/logo.png" id="logo"/>HVK Login</h1></asp:Label>
                
            <div id="loginInfo">
                 <p>
            <asp:Label ID="lblUser" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </p>
                 <p>
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
            </p>
                <asp:Button ID="btnLogin"  CssClass="btn btn-default" runat="server" Text="Log In" OnClick="btnLogin_Click" />
                <asp:Label ID="lblInvalidLogin" CssClass="errors" runat="server" Text="Invalid email address"></asp:Label>
                <p id="lblCreateAccountBlock"><asp:Label ID="lblCreateAccount" runat="server" Text="Don't have an account? ">
                  
                </asp:Label></p>
                <p id="lBtnCreateAccountBlock"><asp:LinkButton ID="lBtnCreateAccount" runat="server" OnClick="lBtnCreateAccount_Click">create one now!</asp:LinkButton></p>
                </div>
        </div>
<asp:SqlDataSource ID="dsEmail" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
     SelectCommand="SELECT OWNER_EMAIL FROM HVK_OWNER WHERE (OWNER_EMAIL = :OWNER_EMAIL)">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtEmail" Name="OWNER_EMAIL" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:GridView ID="gvEmail" Visible="false" runat="server" AutoGenerateColumns="False" DataSourceID="dsEmail">
    <Columns>
        <asp:BoundField DataField="OWNER_EMAIL" HeaderText="OWNER_EMAIL" SortExpression="OWNER_EMAIL" />
    </Columns>
</asp:GridView>


