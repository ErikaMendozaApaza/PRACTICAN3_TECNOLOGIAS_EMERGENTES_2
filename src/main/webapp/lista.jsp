<%@ page import="com.emergentes.modelo.Student" %>
<%@ page import="java.util.List" %>
<%
  List<Student> Estudiantes = (List<Student>)session.getAttribute("estudiantes");
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Listado de Inscritos</title>
  <link rel="stylesheet" href="resources/css/base.css">
  <link rel="stylesheet" href="resources/css/lista.css">
</head>
<body>

  <div class="container">
    <header>
      <img src="resources/images/logo.png" alt="Logo del sitio web">
      <h1>Listado de Estudiantes Inscritos</h1>
    </header>

    <main>
      <table class="tabla-inscritos">
        <thead>
          <tr>
            <th>Id</th>
            <th>Fecha</th>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Turno</th>
            <th>Seminarios</th>
            <th>Editar</th>
            <th>Eliminar</th>
          </tr>
        </thead>
        <tbody>
        <%
          if (Estudiantes != null) {
            for (Student Estudiante : Estudiantes) {
        %>
        <tr>
          <td><%= Estudiante.getId()%></td>
          <td><%= Estudiante.getFormattedFecha()%></td>
          <td><%= Estudiante.getNombre()%></td>
          <td><%= Estudiante.getApellidos()%></td>
          <td><%= Estudiante.getTurno()%></td>
          <td><%= Estudiante.getSeminariosFormatted()%></td>
          <td><a href="StudentController?op=editar&id=<%= Estudiante.getId()%>" class="btn-edit">Editar</a></td>
          <td><a href="StudentController?op=eliminar&id=<%= Estudiante.getId()%>" class="btn-delete">Eliminar</a></td>
        </tr>
        <%
            }
          }
        %>
          </tbody>
      </table>
    </main>

    <aside>
        <button class="btn-nuevo btn-new">
            <a href="StudentController?op=nuevo">Registro Nuevo</a>
        </button>
    </aside>

    <footer>
      <p>&copy; 2024 Todos los derechos reservados</p>
    </footer>
  </div>

</body>
</html>
