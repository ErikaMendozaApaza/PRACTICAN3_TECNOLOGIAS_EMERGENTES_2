package com.emergentes.controlador;

import com.emergentes.modelo.Student;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "StudentController", urlPatterns = {"/StudentController"})
public class StudentController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = (request.getParameter("op").equals(""))? "listar" : request.getParameter("op");
        int id;
        String[] seminarios = {};
        Date fecha = new Date();
        Student objetoEstudiante = new Student(0,fecha,"","",seminarios,"");

        HttpSession ses = request.getSession();
        List<Student> estudiantes = (List<Student>) ses.getAttribute("estudiantes");
        switch(op)
        {
            case "nuevo":
                if(estudiantes.size()==0)
                {
                    objetoEstudiante.setId(1);
                }
                else
                {
                    objetoEstudiante.setId(estudiantes.get(estudiantes.size()- 1).getId()+ 1);
                }
                request.setAttribute("estudiante", objetoEstudiante);
                request.setAttribute("tipo", "new");
                request.getRequestDispatcher("formulario.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                objetoEstudiante = buscarNodo(id,request);
                request.setAttribute("estudiante", objetoEstudiante);
                request.setAttribute("tipo","edit");
                request.getRequestDispatcher("formulario.jsp").forward(request, response);
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                objetoEstudiante = buscarNodo(id,request);
                estudiantes.remove(objetoEstudiante);
                response.sendRedirect("lista.jsp");
                break;
            case "listar":
                request.setAttribute("estudiantes", estudiantes);
                request.getRequestDispatcher("lista.jsp").forward(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String fechaString = request.getParameter("fecha");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = null;
        try {
            fecha = dateFormat.parse(fechaString);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String turno = request.getParameter("turno");
        String[] seminarios = request.getParameterValues("seminarios[]");
        String tipo = request.getParameter("tipo");

        Student objetoEstudiante = new Student();
        objetoEstudiante.setId(id);
        objetoEstudiante.setFecha(fecha);
        objetoEstudiante.setNombre(nombre);
        objetoEstudiante.setApellidos(apellidos);
        objetoEstudiante.setTurno(turno);
        objetoEstudiante.setSeminarios(seminarios);

        HttpSession ses = request.getSession();
        List<Student> estudiantes = (List<Student>)ses.getAttribute("estudiantes");

        if(tipo.equals("new"))
        {
            estudiantes.add(objetoEstudiante);
        }
        else
        {
            int pos = posNodo(id,request);
            estudiantes.set(pos, objetoEstudiante);
        }
        response.sendRedirect("lista.jsp");
    }

    public Student buscarNodo(int id,HttpServletRequest request)
    {
        Student aux = new Student();
        HttpSession ses = request.getSession();
        List<Student> estudiantes = (List<Student>)ses.getAttribute("estudiantes");
        for(Student obj : estudiantes)
        {
            if(obj.getId()==id)
            {
                aux=obj;
                break;
            }
        }
        return aux;
    }

    public int posNodo(int id, HttpServletRequest request)
    {
        int index =-1;
        HttpSession ses = request.getSession();
        List<Student> estudiantes = (List<Student>)ses.getAttribute("estudiantes");
        for(int i=0;i< estudiantes.size();i++)
        {
            if(estudiantes.get(i).getId()==id)
            {
                index = i;
                break;
            }
        }
        return index;
    }
}
