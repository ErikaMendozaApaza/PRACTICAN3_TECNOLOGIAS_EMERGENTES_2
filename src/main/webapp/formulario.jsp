<%@ page import="com.emergentes.modelo.Student" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Student Estudiante = (Student)request.getAttribute("estudiante");
    String tipo = (String)request.getAttribute("tipo");
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro en Seminarios</title>
    <link rel="stylesheet" href="resources/css/base.css">
    <link rel="stylesheet" href="resources/css/formulario.css">
</head>
<body>

<div class="container">
    <header>
        <img src="resources/images/logo.png" alt="Logo del sitio web">
        <h1>Registro en Seminarios | Erika Mendoza Apaza</h1>
    </header>

    <main>
        <form id="miFormulario" action="StudentController" method="POST" accept-charset="UTF-8">
            <input type="hidden" name="tipo" value="<%= tipo %>">
            <div class="container">
                <div class="datos-personales">
                    <h2>Datos Personales</h2>
                    <div class="campo">
                        <label for="id">ID : </label>
                        <input type="number" id="id" name="id" readonly required value="<%=Estudiante.getId()%>" style="pointer-events: none;">
                    </div>
                    <div class="campo">
                        <label for="fecha">Fecha : </label>
                        <input type="date" id="fecha" name="fecha" required value="<%= new SimpleDateFormat("yyyy-MM-dd").format(Estudiante.getFecha()) %>">
                    </div>
                    <div class="campo">
                        <label for="nombre">Nombre : </label>
                        <input type="text" id="nombre" name="nombre" required value="<%=Estudiante.getNombre()%>">
                    </div>
                    <div class="campo">
                        <label for="apellidos">Apellido : </label>
                        <input type="text" id="apellidos" name="apellidos" required value="<%=Estudiante.getApellidos()%>">
                    </div>
                    <div class="campo">
                        <label>Turno : </label>
                        <input type="radio" id="mañana" name="turno" value="mañana" <%= Estudiante.getTurno().equals("mañana") ? "checked" : "" %> required>
                        <label for="mañana">Mañana</label>
                        <input type="radio" id="tarde" name="turno" value="tarde" <%= Estudiante.getTurno().equals("tarde") ? "checked" : "" %> required>
                        <label for="tarde">Tarde</label>
                        <input type="radio" id="noche" name="turno" value="noche" <%= Estudiante.getTurno().equals("noche") ? "checked" : "" %> required>
                        <label for="noche">Noche</label>
                    </div>
                </div>

                <div class="seminarios-disponibles">
                    <h2>Seminarios Disponibles</h2>
                    <%
                        String[] seminariosEstudiante = Estudiante.getSeminarios();
                        String[] seminariosDisponibles = {"inteligencia artificial", "machine learning", "simulacion con arena", "robotica educativa"};

                        for (String seminario : seminariosDisponibles) {
                            boolean checked = false;
                            if (seminariosEstudiante != null) {
                                for (String seminarioEst : seminariosEstudiante) {
                                    if (seminarioEst.equals(seminario)) {
                                        checked = true;
                                        break;
                                    }
                                }
                            }
                    %>
                    <div class="campo">
                        <input type="checkbox" id="<%= seminario %>" name="seminarios[]" value="<%= seminario %>" <%= checked ? "checked" : "" %>>
                        <label for="<%= seminario %>"><%= seminario %></label>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <button type="submit" class="btn-nuevo">Enviar Registro</button>
        </form>
    </main>

    <aside>
        <button class="btn-nuevo btn-new">
            <a href="lista.jsp">Ver Lista</a>
        </button>
    </aside>

    <footer>
        <p>&copy; 2024 Todos los derechos reservados</p>
    </footer>
</div>
<script>
    document.getElementById('miFormulario').onsubmit = function() {
        var checkboxes = document.querySelectorAll('input[name="seminarios[]"]');
        var seleccionado = false;
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                seleccionado = true;
                break;
            }
        }
        if (!seleccionado) {
            alert('Por favor, seleccione al menos un seminario.');
            return false; // Evita que se envíe el formulario si no se ha seleccionado ningún checkbox
        }
    };
</script>
</body>
</html>
