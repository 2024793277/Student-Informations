package com.myapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE profiles SET name=?, studentId=?, program=?, email=?, hobbies=?, intro=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("studentId"));
            ps.setString(3, request.getParameter("program"));
            ps.setString(4, request.getParameter("email"));
            ps.setString(5, request.getParameter("hobbies"));
            ps.setString(6, request.getParameter("intro"));
            ps.setInt(7, Integer.parseInt(request.getParameter("id")));

            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to list page
        response.sendRedirect("viewProfile.jsp");
    }
}
