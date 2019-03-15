<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="InicioSesion.aspx.vb" Inherits="InicioSesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <%-- <style type="text/css">
        .auto-style7 {width: 60%; margin: 0 auto;}
        .auto-style9 {
            border: 6px solid #808080;
            padding-left: 4px;
            padding-right: 3px;
            padding-top: 4px;
            padding-bottom: 4px;
        }
        </style>--%>
    <style type="text/css">
        div{
            width: 80%;
            height: 90%;
            /*margin-top: 10px;*/
            display: inline-block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        div{
            width: 80%;
            height: 80%;
            /*margin-top: 10px;*/
            display: inline-block;
        }
    </style>
    <div class="row-bot">
        <div class="row-bot-bg">
            <div class="main">
                <h2>Ingreso al <span>Sistema</span></h2>
            </div>
        </div>
        <br />
    </div>
    
    <section id="content">
        <div class="main2">
            <div>
                <div >
                    <asp:Image ID="Image1" runat="server" Height="30%" ImageUrl="~/images/Login_Icon.png" Width="30%"/>
                </div>
                <div>                        
                    <asp:Login ID="Login" runat="server" BackColor="#FF6600" BorderColor="Black" BorderStyle="Inset"
                        BorderWidth="2px" Font-Names="Verdana" Font-Size="1.0em" Height="300px" Width="550px"
                        BorderPadding="6" TitleText="Inicio sesión" ForeColor="#333333" CssClass="auto-style9" >
                        <CheckBoxStyle ForeColor="Silver" />
                        <HyperLinkStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <LabelStyle Font-Size="Medium" />
                        <FailureTextStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="Medium" ForeColor="#1C5E55" Font-Overline="False" />
                        <TextBoxStyle Font-Size="Large" />
                        <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="#FFFFFF" Font-Size="X-Large" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:Login>
                </div>                
            </div>
        </div>
    </section>

</asp:Content>

