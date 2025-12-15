<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #eaf1ff;
            font-family: Arial, sans-serif;
        }
        .page-wrapper {
            min-height: 100vh;
        }
        .profile-card {
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        }
        .info-label {
            font-weight: 600;
            color: #555;
        }
        .info-value {
            color: #222;
        }
    </style>
</head>
<body>
<div class="page-wrapper d-flex align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="card profile-card p-4">
                    <div class="alert alert-success mb-4" role="alert">
                        Profile submitted successfully!
                    </div>

                    <h3 class="mb-3">Your Personal Profile</h3>
                    <p class="text-muted mb-4">Here are the details you submitted.</p>

                    <dl class="row">
                        <dt class="col-sm-4 info-label">Name</dt>
                        <dd class="col-sm-8 info-value">${name}</dd>

                        <dt class="col-sm-4 info-label">Student ID</dt>
                        <dd class="col-sm-8 info-value">${studentId}</dd>

                        <dt class="col-sm-4 info-label">Program</dt>
                        <dd class="col-sm-8 info-value">${program}</dd>

                        <dt class="col-sm-4 info-label">Email</dt>
                        <dd class="col-sm-8 info-value">${email}</dd>

                        <dt class="col-sm-4 info-label">Hobbies</dt>
                        <dd class="col-sm-8 info-value">${hobbies}</dd>

                        <dt class="col-sm-4 info-label">Self Introduction</dt>
                        <dd class="col-sm-8 info-value">
                            <p class="mb-0">${intro}</p>
                        </dd>
                    </dl>

                    <hr class="my-4"/>
                    <div class="d-flex justify-content-between">
                        <!-- Back to home (form) -->
                        <a href="index.html" class="btn btn-outline-secondary">
                            Back to Home
                        </a>
                        <a href="index.html" class="btn btn-primary">
                            Submit Another Profile
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
