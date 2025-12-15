<%@ page import="java.sql.*,com.myapp.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fb;
            font-family: Arial, sans-serif;
        }
        .page-wrapper {
            min-height: 100vh;
        }
        .card {
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }
        .form-label {
            font-weight: 600;
        }
    </style>
</head>

<body>

<%
    String id = request.getParameter("id");

    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM profiles WHERE id = ?");
    ps.setInt(1, Integer.parseInt(id));
    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<div class="page-wrapper d-flex align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">

                <div class="card p-4">
                    <h3 class="mb-3">Edit Profile</h3>
                    <p class="text-muted mb-4">
                        Update the profile details below and save changes.
                    </p>

                    <form action="UpdateProfileServlet" method="post">

                        <!-- Hidden ID -->
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" class="form-control"
                                   value="<%= rs.getString("name") %>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Student ID</label>
                            <input type="text" name="studentId" class="form-control"
                                   value="<%= rs.getString("studentId") %>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Program</label>
                            <input type="text" name="program" class="form-control"
                                   value="<%= rs.getString("program") %>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control"
                                   value="<%= rs.getString("email") %>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Hobbies</label>
                            <input type="text" name="hobbies" class="form-control"
                                   value="<%= rs.getString("hobbies") %>">
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Self Introduction</label>
                            <textarea name="intro" rows="4" class="form-control"
                                      required><%= rs.getString("intro") %></textarea>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="viewProfile.jsp" class="btn btn-outline-secondary">
                                Cancel
                            </a>

                            <button type="submit" class="btn btn-success">
                                Update Profile
                            </button>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>
</div>

<%
    con.close();
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
