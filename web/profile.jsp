<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Profile</title>

    <style>
        body { font-family: Arial; background: #e8f0fe; padding: 20px; }
        .card {
            background: white; width: 600px; margin: auto; padding: 20px;
            border-radius: 12px; box-shadow: 0 3px 10px rgba(0,0,0,0.2);
        }
        h2 { color: #333; }
        .info { margin-top: 15px; }
        .label { font-weight: bold; color: #555; }
    </style>
</head>

<body>
    <div class="card">
        <h2>Your Personal Profile</h2>

        <div class="info"><span class="label">Name:</span> ${name}</div>
        <div class="info"><span class="label">Student ID:</span> ${studentId}</div>
        <div class="info"><span class="label">Program:</span> ${program}</div>
        <div class="info"><span class="label">Email:</span> ${email}</div>
        <div class="info"><span class="label">Hobbies:</span> ${hobbies}</div>

        <div class="info">
            <span class="label">Self Introduction:</span>
            <p>${intro}</p>
        </div>
    </div>
</body>
</html>
