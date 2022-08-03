<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body bgcolor="cyan">
		<h1>PREGUNTA 2 - BASE DE DATOS REMOTA EN AZURE</h1>
		<table border="1">
			<tr>
				<th>CODIGO</th>
				<th>NOMBRES</th>
				<th>DISTRITO</th>
				<th>MONTO</th>
			</tr>
			<%@ page import="java.sql.*" %>
			<% 
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			
				ResultSet rs;	//Guardar datos en memoria rs
				Statement cmd;	//Vamos a usar comandos sql en la variable cmd
				Connection cn;
				
				cn = java.sql.DriverManager.getConnection("jdbc:sqlserver://servidor-remoto.database.windows.net:1433;database=bdremotadistritos;user=renzochip@servidor-remoto;password=renzo123//;encrypt=true;trustServerCertificate=true;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
				
				cmd = cn.createStatement();	// Se va a crear una sentencia sql
				//Con la base de datos que esta en cn
				rs = cmd.executeQuery("select * from distrito");
				//rs va a contener todos los datos de la tabla distrito
				double acu=0;
				while(rs.next()){
					out.print("<tr>");
					out.print("<td>"+rs.getString("codven")+"</td>");
					out.print("<td>"+rs.getString("nomven")+"</td>");
					out.print("<td>"+rs.getString("distven")+"</td>");
					out.print("<td>"+rs.getInt("monto")+"</td>");
					out.print("</tr>");
					acu=acu+rs.getInt("monto");
				}
			%>
		</table>
		<%out.print("EL MONTO TOTAL ES: "+acu);%>
	</body>
</html>