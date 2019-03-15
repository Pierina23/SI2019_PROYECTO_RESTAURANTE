
Imports System.Data
Imports System.Data.SqlClient

Partial Class AgregaPlato
    Inherits System.Web.UI.Page
    Public Idplato As String
    Public nombrePlato As String
    Public con As SqlConnection
    Public sda, sdaA As SqlDataAdapter
    Public dtb, dtbA As DataTable
    Public cate, strSQL, strSQL2, strSQL3 As String
    Public count As Integer

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Idplato = Request.QueryString.GetValues("V1")(0)
            nombrePlato = Request.QueryString.GetValues("V2")(0)
            cmbCategoria.DataSource = cargaCategoria()
            cmbCategoria.DataValueField = "IdPlatCat"
            cmbCategoria.DataTextField = "Nombre"
            cmbCategoria.DataBind()
        End If
    End Sub
    Private Function cargaCategoria() As DataTable
        con = New SqlConnection(CStr(Session("sessStrCon")))
        Dim dt As DataTable = New DataTable()
        con.Open()
        strSQL = "SELECT IdPlatCat, Nombre "
        strSQL = strSQL & " FROM tbm_Platos_Categoria WHERE Estado = 'A'"
        sdaA = New SqlDataAdapter(strSQL, con)
        sdaA.Fill(dt)
        Return dt
    End Function
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Dim valor1 As String = Request.QueryString.GetValues("V1")(0)
        Dim valor2 As String = Request.QueryString.GetValues("V2")(0)
        con = New SqlConnection(CStr(Session("sessStrCon")))
        con.Open()
        strSQL2 = "select MAX(IdPlato) + 1 from [tbm_Platos]"
        sda = New SqlDataAdapter(strSQL2, con)
        dtb = New DataTable()
        sda.Fill(dtb)
        Dim maximo As String = dtb.Rows(0)(0).ToString()
        strSQL = "INSERT INTO tbm_Platos(IdPlato, Nombre, Estado, CreadoDate, CreadoPor, IdPlatCat, Precio, Informacion) "
        strSQL = strSQL & " VALUES(" & maximo & ",'" & valor2 & "','" & "A" & "','" & DateTime.Now.Date.ToString("yyyy-MM-dd") & "','" & "Plato Sugerido" & "','" & cmbCategoria.SelectedValue & "','" & txtPrecio.Text & "','" & txtObservacion.Text & "')"
        Dim insertar As New SqlCommand(strSQL, con)
        count = insertar.ExecuteNonQuery()
        strSQL3 = "UPDATE [tbm_sugerirplato] set Estado = 'A' where Codigo_Plato = " & valor1
        Dim actu As New SqlCommand(strSQL3, con)
        count = actu.ExecuteNonQuery()
        con.Close()
        If count > 0 Then
            MsgBox("Plato agregado con éxito!!!")
        Else
            MsgBox("Plato no se agregó!!!")
        End If
        Me.Page.ClientScript.RegisterStartupScript(Me.GetType(), "Close_Window", "self.close();", True)
        Response.Redirect("Platos_Solicitados.aspx")
    End Sub
End Class
