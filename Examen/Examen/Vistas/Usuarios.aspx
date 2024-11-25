<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Examen.Vistas.Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Usuarios</h2>
            <br />
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <br />

            Codigo:
            <asp:TextBox ID="Tcodigo" type="number" runat="server"></asp:TextBox>
            <br />
            Nombre:
            <asp:TextBox ID="Tnombre" runat="server"></asp:TextBox>
             Correo:
            <asp:TextBox ID="TcorreoElectronico" runat="server"></asp:TextBox>
             Telefono:
            <asp:TextBox ID="TTelefono" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />

            <asp:Button ID="Bagregar" runat="server" Text="Agregar" OnClick="Bagregar_Click" />
            <asp:Button ID="Beliminar" runat="server" Text="Eliminar" OnClick="Beliminar_Click" />
            <asp:Button ID="BModificar" runat="server" Text="Modificar" OnClick="BModificar_Click" />


        </div>
    </form>
</body>
</html>
