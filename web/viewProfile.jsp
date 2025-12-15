<%@ page import="java.sql.*,com.myapp.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f5f7fb;
        }
        .card {
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }
        .table thead {
            background-color: #0d6efd;
            color: white;
        }
    </style>
</head>

<body>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-11">

            <div class="card p-4">

                <h3 class="mb-3">All Student Profiles</h3>
                <p class="text-muted">Search, edit, or delete student profile records.</p>

                <!-- SEARCH FORM -->
                <form method="get" class="row g-2 mb-4">
                    <div class="col-md-6">
                        <input type="text" name="search" class="form-control"
                               placeholder="Search by Student ID or Name"
                               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100">
                            Search
                        </button>
                    </div>
                    <div class="col-md-2">
                        <a href="viewProfile.jsp" class="btn btn-secondary w-100">
                            Reset
                        </a>
                    </div>
                </form>

                <!-- TABLE -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle text-center">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Program</th>
                            <th>Email</th>
                            <th>Hobbies</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>

<%
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();

    String search = request.getParameter("search");
    String sql;

    if (search == null || search.trim().isEmpty()) {
        sql = "SELECT * FROM profiles";
    } else {
        sql = "SELECT * FROM profiles WHERE studentId LIKE '%" + search + "%' OR name LIKE '%" + search + "%'";
    }

    ResultSet rs = st.executeQuery(sql);

    while (rs.next()) {
%>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("studentId") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("program") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("hobbies") %></td>
                            <td>
                                <a href="editProfile.jsp?id=<%= rs.getInt("id") %>"
                                   class="btn btn-sm btn-warning me-1">
                                    Edit
                                </a>

                                <a href="DeleteProfileServlet?id=<%= rs.getInt("id") %>"
                                   onclick="return confirm('Are you sure you want to delete this record?');"
                                   class="btn btn-sm btn-danger">
                                    Delete
                                </a>
                            </td>
                        </tr>
<%
    }
    con.close();
%>
                        </tbody>
                    </table>
                </div>

                <div class="mt-4 text-end">
                    <a href="index.html" class="btn btn-outline-secondary">
                       Back to Home
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
