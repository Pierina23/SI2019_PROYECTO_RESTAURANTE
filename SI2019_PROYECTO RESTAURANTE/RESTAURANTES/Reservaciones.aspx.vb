Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Globalization
Imports AjaxControlToolkit

Partial Class _Default
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dtb, dtborden, dtbtrans, dtba, dtbins, dtbp, dtbtt As DataTable
    Public strSQL As String
    Public tipo As String
    Public tipoint As Integer
    Public codigo As Integer
    Public idch As Integer
    Public column As DataColumn
    Public fil As DataRow
    Public tot As Double
    Public Usuario As String


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            If Session("sesUsrIniSes") <> "S" Then
                Response.Redirect("InicioSesion.aspx")
            End If
            'codigo = CInt(Session("IDEMP"))
            Usuario = Session("CodigoMesero")
            tx_CodighoMesero.Text = Session("CodigoMesero") 'Cambié aquí KP
            tx_NombreMesero.Text = Session("NombreMesero") 'Cambié aquí KP
            tx_calen.Text = Today.ToString("dd/MM/yyyy")
            cargarmesas()
            cargarplatos()
            EstructuraMedidas()
        End If
        tot = 0
    End Sub

    Public Sub cargarmesas()
        Dim intNumTotReg As Integer
        con = New SqlConnection(CStr(Session("sessStrCon")))
        Try
            con.Open()
            strSQL = "SELECT IdMesa "
            strSQL = strSQL & "FROM tbm_Mesas "
            strSQL = strSQL & "WHERE Ocupada = 1"
            sda = New SqlDataAdapter(strSQL, con)
            dtb = New DataTable
            sda.Fill(dtb) 'Se almacenan en el Dtb
            cbo_mesa.Items.Clear()
            intNumTotReg = dtb.Rows.Count
            For i = 0 To intNumTotReg - 1
                cbo_mesa.Items.Add(New ListItem("Mesa " & dtb.Rows(i).Item(0), dtb.Rows(i).Item(0)))
            Next
            dtb.Clear()
            con.Close()
        Catch ex As Exception

        End Try
    End Sub

    Public Sub cargarplatos()
        Dim intNumTotReg As Integer
        con = New SqlConnection(CStr(Session("sessStrCon")))
        Try
            con.Open()
            strSQL = "SELECT IdPlato, Nombre "
            strSQL = strSQL & "FROM tbm_Platos "
            strSQL = strSQL & "WHERE Estado = 'A'"
            sda = New SqlDataAdapter(strSQL, con)
            dtbp = New DataTable
            sda.Fill(dtbp) 'Se almacenan en el Dtb
            cbo_PlaBeb.Items.Clear()
            cbo_PlaBeb.Items.Add("---")
            intNumTotReg = dtbp.Rows.Count
            For i = 0 To intNumTotReg - 1
                cbo_PlaBeb.Items.Add(New ListItem(dtbp.Rows(i).Item(1), dtbp.Rows(i).Item(0)))
            Next
            dtbp.Clear()
            con.Close()
        Catch ex As Exception

        End Try
    End Sub

    Public Sub EstructuraMedidas()
        Dim DTabla = New DataTable()
        DTabla.Columns.Add("IdPlato", Type.GetType("System.Int32"))
        DTabla.Columns.Add("Cantidad", Type.GetType("System.Int32"))
        DTabla.Columns.Add("Nombre", Type.GetType("System.String"))
        DTabla.Columns.Add("Precio", Type.GetType("System.Double"))
        DTabla.Columns.Add("Total", Type.GetType("System.Double"))
        Session("tabla") = DTabla
    End Sub

    Protected Sub bot_Agre_Click(sender As Object, e As EventArgs) Handles bot_Agre.Click

        dtborden = Session("Tabla")
        fil = dtborden.NewRow()
        fil("IdPlato") = CInt(cbo_PlaBeb.SelectedValue)
        fil("Cantidad") = CInt(tx_can.Text)
        fil("Nombre") = cbo_PlaBeb.SelectedItem.ToString
        fil("Precio") = CDbl(tx_Precio.Text)
        fil("Total") = CDbl(CInt(tx_can.Text) * CDbl(tx_Precio.Text))
        dtborden.Rows.Add(fil)

        GridView1.DataSource = dtborden
        GridView1.DataBind()

        tot = 0
        For i = 0 To dtborden.Rows.Count - 1
            tot = tot + dtborden.Rows(i).Item(4)
        Next

        tx_subtotal.Text = CStr(tot)
        tx_iva.Text = CStr(tot * 0.12)
        tx_total.Text = CStr(tot * 1.12)

        cbo_PlaBeb.SelectedIndex = 0
        tx_Precio.Text = ""
        tx_can.Text = "0"

    End Sub

    Public Sub cbo_PlaBeb_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbo_PlaBeb.SelectedIndexChanged
        If cbo_PlaBeb.SelectedIndex > 0 Then
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Try
                con.Open()
                strSQL = "SELECT Precio "
                strSQL = strSQL & "FROM tbm_Platos "
                strSQL = strSQL & "WHERE IdPlato = " & cbo_PlaBeb.SelectedValue
                sda = New SqlDataAdapter(strSQL, con)
                dtbp = New DataTable
                sda.Fill(dtbp) 'Se almacenan en el Dtb
                tx_Precio.Text = CDbl(dtbp.Rows(0).Item(0))

                dtbp.Clear()
                con.Close()


                Dim intNumFilIns As Integer = 0
                Dim sdab As SqlDataAdapter
                Dim dtbinsb As DataTable
                con = New SqlConnection(CStr(Session("sessStrCon")))
                Usuario = Session("CodigoMesero")
                con.Open()
                Dim consulta As String = "select * from tbm_rating where Id_Plato = " & cbo_PlaBeb.SelectedValue & " and Id_Usuario = " & Usuario
                sdab = New SqlDataAdapter(consulta, con)
                dtbinsb = New DataTable
                sdab.Fill(dtbinsb)
                If dtbinsb.Rows.Count > 0 Then
                    Dim valor As Integer = Convert.ToInt32(dtbinsb.Rows(0)(3).ToString())
                    ctrRating.CurrentRating = valor
                Else
                    ctrRating.CurrentRating = 0
                End If

            Catch ex As Exception
                con.Close()
            End Try
        End If

    End Sub

    Protected Sub btnEnvio_Click(sender As Object, e As EventArgs) Handles btnEnvio.Click
        Dim intCodOrd, intCodDet As Integer
        Dim intNumFilIns As Integer = 0
        Dim fecha As Date = Nothing
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT MAX(IdOrden) FROM tbm_Ordenes"
            sda = New SqlDataAdapter(strSQL, con)
            dtbins = New DataTable
            sda.Fill(dtbins)
            intCodOrd = dtbins.Rows(0).Item(0) + 1
            dtbins.Clear()

            fecha = tx_calen.Text

            Dim cmd As New SqlCommand("SP_ins_Orden", con)

            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@IdOrden", intCodOrd)
            'cmd.Parameters.AddWithValue("@Fecha", ((tx_calen.Text)).ToString("yyyyMMdd"))
            cmd.Parameters.AddWithValue("@Fecha", fecha)
            cmd.Parameters.AddWithValue("@Cliente", tx_Cliente.Text)
            cmd.Parameters.AddWithValue("@IdMesa", CInt(cbo_mesa.SelectedValue))
            cmd.Parameters.AddWithValue("@IdEmpleado", CInt(tx_CodighoMesero.Text))
            cmd.Parameters.AddWithValue("@IdSucursal", 1)
            cmd.Parameters.AddWithValue("@Direccion", "")
            cmd.Parameters.AddWithValue("@Telefono", "")
            cmd.Parameters.AddWithValue("@Subtotal", CDbl(tx_subtotal.Text).ToString("C3", CultureInfo.CreateSpecificCulture("en-US")))
            cmd.Parameters.AddWithValue("@IVA", CDbl(tx_iva.Text).ToString("C3", CultureInfo.CreateSpecificCulture("en-US")))
            cmd.Parameters.AddWithValue("@Total", CDbl(tx_total.Text).ToString("C3", CultureInfo.CreateSpecificCulture("en-US")))

            cmd.ExecuteNonQuery()

            strSQL = "SELECT MAX(IdOrdDet) FROM tbm_Orden_Detalle"
            sda = New SqlDataAdapter(strSQL, con)
            dtbins = New DataTable
            sda.Fill(dtbins)

            intCodDet = dtbins.Rows(0).Item(0) + 1

            dtbins.Clear()

            dtborden = Session("Tabla")

            For i = 0 To dtborden.Rows.Count - 1
                strSQL = ""
                strSQL = strSQL & "INSERT INTO tbm_Orden_Detalle(IdOrdDet, IdPlato, Cantidad, Precio, Total, IdOrden)"
                strSQL = strSQL & " values("
                strSQL = strSQL & intCodDet
                strSQL = strSQL & ", " & dtborden.Rows(i).Item(0)
                strSQL = strSQL & ", " & dtborden.Rows(i).Item(1)
                strSQL = strSQL & ", " & CDbl(dtborden.Rows(i).Item(3)).ToString("C3", CultureInfo.CreateSpecificCulture("en-US"))
                strSQL = strSQL & ", " & CDbl(dtborden.Rows(i).Item(4)).ToString("C3", CultureInfo.CreateSpecificCulture("en-US"))
                strSQL = strSQL & ", " & intCodOrd
                strSQL = strSQL & ")"
                sda.InsertCommand = New SqlCommand(strSQL, con)
                intNumFilIns = sda.InsertCommand.ExecuteNonQuery()
                intCodDet = intCodDet + 1
            Next

            strSQL = "SELECT MAX(Idordendetalle) FROM tbm_transicion"
            sda = New SqlDataAdapter(strSQL, con)
            dtbins = New DataTable
            sda.Fill(dtbins)

            Dim cont As Integer
            cont = dtbins.Rows(0).Item(0) + 1

            dtbins.Clear()
            Dim sdab As SqlDataAdapter
            Dim dtbinsb As DataTable
            dtbinsb = New DataTable
            For i = 0 To dtborden.Rows.Count - 1

                Dim n As DateTime = Now
                Dim strsqlb As String
                strsqlb = "SELECT Tiempo FROM tbm_Platos where idplato= " & dtborden.Rows(i).Item(0)
                sdab = New SqlDataAdapter(strsqlb, con)

                sdab.Fill(dtbinsb)

                strSQL = ""
                strSQL = strSQL & "INSERT INTO tbm_transicion(idordendetalle,tiempo,horaarranque,horafinal,estado,idchef)"
                strSQL = strSQL & " values("
                strSQL = strSQL & cont
                strSQL = strSQL & ", " & dtbinsb.Rows(0).Item(0)
                strSQL = strSQL & ", '" & n & "'"
                strSQL = strSQL & ", '" & n & "'" '(CDate(n).AddSeconds(dtbinsb.Rows(0).Item(0))).ToString("yyyy-MM-dd HH:mm:ss") & "'"
                'strSQL = strSQL & ", ''"
                strSQL = strSQL & ", 'C'"
                strSQL = strSQL & ", " & 0
                strSQL = strSQL & ")"
                sda.InsertCommand = New SqlCommand(strSQL, con)
                intNumFilIns = sda.InsertCommand.ExecuteNonQuery()
                cont = cont + 1
            Next
            con.Close()



        Catch ex As Exception

        End Try

        Response.Redirect("Reservaciones.aspx?v1=" & tx_CodighoMesero.Text)


    End Sub
    Public Sub Rating1_Changed(ByVal sender As Object, ByVal e As RatingEventArgs)
        Try
            If cbo_PlaBeb.SelectedValue <> "---" Then
                Dim intNumFilIns As Integer = 0
                Dim sdab As SqlDataAdapter
                Dim dtbinsb As DataTable
                con = New SqlConnection(CStr(Session("sessStrCon")))
                Usuario = Session("CodigoMesero")
                con.Open()
                Dim consulta As String = "select * from tbm_rating where Id_Plato = " & cbo_PlaBeb.SelectedValue & " and Id_Usuario = " & Usuario
                sdab = New SqlDataAdapter(consulta, con)
                dtbinsb = New DataTable
                sdab.Fill(dtbinsb)
                If dtbinsb.Rows.Count > 0 Then
                    intNumFilIns = 0
                    strSQL = "UPDATE tbm_rating set Rating = " & ctrRating.CurrentRating & " where Id_Plato = " & cbo_PlaBeb.SelectedValue & " and Id_Usuario = " & Usuario
                    'sda.UpdateCommand = New SqlCommand(strSQL, con)
                    Dim actualizar As New SqlCommand(strSQL, con)
                    ' intNumFilIns = sda.UpdateCommand.ExecuteNonQuery()
                    intNumFilIns = actualizar.ExecuteNonQuery()
                    If intNumFilIns > 0 Then
                        MsgBox("Voto actualizado exitosamente.")
                    Else
                        MsgBox("Voto no se actualizo.")
                    End If
                Else
                    intNumFilIns = 0
                    strSQL = "INSERT INTO tbm_rating (Id_Plato, Id_Usuario, Rating) VALUES (" & cbo_PlaBeb.SelectedValue & "," & Usuario & "," & ctrRating.CurrentRating & ")"
                    'sda.InsertCommand = New SqlCommand(strSQL, con)
                    Dim actualizar1 As New SqlCommand(strSQL, con)
                    'count = actualizar.ExecuteNonQuery()
                    intNumFilIns = actualizar1.ExecuteNonQuery()
                    If intNumFilIns > 0 Then
                        MsgBox("Voto registrado exitosamente.")
                    Else
                        MsgBox("Voto no se registro.")
                    End If
                End If
            End If
        Catch ex As Exception

        Finally
            con.Close()
        End Try

    End Sub
End Class
