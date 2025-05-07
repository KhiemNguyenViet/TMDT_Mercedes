<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xin chào Admin</title>
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css"> <!-- Liên kết CSS hiện có -->
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        .dichvu-slider {
            display: flex;
            overflow-x: auto;
            scroll-behavior: smooth;
            gap: 1rem;
            padding-bottom: 1rem;
        }

        .dichvu-slider::-webkit-scrollbar {
            height: 8px;
        }

        .dichvu-slider:hover {
            cursor: grab;
        }

        .user-dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 90px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .dropdown-content ul li {
            text-align: center;
            padding: 7px;
        }
        .dropdown-content ul li a {
            text-decoration: none;
            color: black;
        }
        .user-dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>
    {header}
    Xin chào Admin
    {footer}
</body>
</html>