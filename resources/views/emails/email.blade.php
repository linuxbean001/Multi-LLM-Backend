<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Email</title>
</head>
<body>
    <h1>Welcome to Multi LLM</h1>
    <p>Hello, {{ $user->f_name }}!</p>
    <p>First Name, {{ $user->f_name }}</p>
    <p>Last Name, {{ $user->l_name }}</p>
    <p>Email, {{ $user->email }}</p>
    <p>Thank you for registering with us.</p>
</body>
</html>
