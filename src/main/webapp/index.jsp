<%@ page import="java.util.ArrayList" %>
<%@ page import="com.emergentes.modelo.Student" %><%
    if(session.getAttribute("estudiantes")==null){
        ArrayList<Student> Estudiantes = new ArrayList<Student>();
        session.setAttribute("estudiantes", Estudiantes);
    }
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Principal</title>
    <link rel="stylesheet" href="resources/css/base.css">
    <link rel="stylesheet" href="resources/css/index.css">
</head>
<body>

<div class="container">
    <header>
        <img src="resources/images/logo.png" alt="Logo del sitio web">
        <h1>Seminarios Universitarios</h1>
    </header>

    <aside class="container-button">
        <button>
            <a href="lista.jsp">Ingresar</a>
        </button>
    </aside>

    <footer>
        <p>&copy; 2024 Todos los derechos reservados</p>
    </footer>
</div>

</body>
</html>
