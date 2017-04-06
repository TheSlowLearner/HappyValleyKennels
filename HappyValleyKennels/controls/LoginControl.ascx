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
                <p id="lblCreateAccountBlock"><asp:Label ID="lblCreateAccount" runat="server" Text="Don't have an account? ">
                   <asp:Label ID="lblInvalidLogin" CssClass="errors" runat="server" Text="*Invalid email address"></asp:Label>
                </asp:Label></p>
                <p id="lBtnCreateAccountBlock"><asp:LinkButton ID="lBtnCreateAccount" runat="server" OnClick="lBtnCreateAccount_Click">create one now!</asp:LinkButton></p>
               
                 </div>
                    

        </div>

