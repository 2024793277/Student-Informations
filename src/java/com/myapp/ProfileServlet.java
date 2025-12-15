package com.myapp;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProfileBean p = new ProfileBean();
        p.setStudentId(request.getParameter("studentId"));
        p.setName(request.getParameter("name"));
        p.setProgram(request.getParameter("program"));
        p.setEmail(request.getParameter("email"));
        p.setHobbies(request.getParameter("hobbies"));
        p.setIntro(request.getParameter("intro"));

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO profiles (studentId, name, program, email, hobbies, intro) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, p.getStudentId());
            ps.setString(2, p.getName());
            ps.setString(3, p.getProgram());
            ps.setString(4, p.getEmail());
            ps.setString(5, p.getHobbies());
            ps.setString(6, p.getIntro());

            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("profile", p);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
