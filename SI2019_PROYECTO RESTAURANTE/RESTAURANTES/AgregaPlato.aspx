<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AgregaPlato.aspx.vb" Inherits="AgregaPlato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>Agregar plato</title>
<script type="text/javascript">
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : evt.keyCode;
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;    
         return true;
      }
   </script>
</head>    
<body>    
    <form id="form1" runat="server">
    <div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2>&nbsp;Agregar Plato</h2>                   
                </div>
            </div>
        </div>
        
        <section id="content"><div class="ic"></div>
                
        <div class="main"> </div> 
            <div class="wrapper">
                
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">Categoria</td>
                        <td>
                           <asp:DropDownList ID="cmbCategoria" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Precio:</td>
                        <td>
                            <asp:TextBox ID="txtPrecio" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Información del plato</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtObservacion" runat="server"></asp:TextBox>                            
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <%-- ConfirmButtonExtender Luis Delgado/Jaritza Orrala --%>
                            <asp:Button ID="btnAgregar" runat="server" Text="AGREGAR" OnClick="btnAgregar_Click"/>
                            <%--<ajaxToolkit:ConfirmButtonExtender ID="Button1_ConfirmButtonExtender" runat="server" ConfirmText="¿ Esta seguro de actualizar su pedido?" OnClientCancel="Operación cancelada" TargetControlID="Button1" />--%>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            </section>
    </div>
    </form>
</body>
</html>
