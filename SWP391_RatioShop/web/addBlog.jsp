<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Blog</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
        }

        .container-co {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 70%;
        }

        .form-heading {
            background-color: #007bff;
            color: #fff;
            border-radius: 10px 10px 0 0;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container-co">
        <div class="form-container">
            <div class="form-heading">
                <h3 style="color: white">Add Blog</h3>
            </div>
            <form action="add-blog" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Title</label>${titleErrorMessage}
                    <div>
                        <input type="text" class="form-control" name="title" id="title" placeholder="Enter title here.....">
                    </div>
                </div>
                <div class="form-group">
                    <label for="content">Content</label>${contentErrorMessage}
                    <div>
                        <textarea name="content" style="min-height: 120px" class="form-control" placeholder="Enter content here...."></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="image">Image</label>${imageErrorMessage}
                    <div>
                        <input type="file" class="form-control" name="image" id="imageInput">
                        <img id="imagePreview" src="#" alt="Selected Image" style="display: none; max-width: 300px; max-height: 300px;">
                    </div>
                </div>                    
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>
    <footer style="margin-top: 25%;background: black; padding-top: 30px">
        <%@include file="../footer.jsp" %>
    </footer>
    <script>
    document.getElementById('imageInput').addEventListener('change', function(event) {
        var image = document.getElementById('imagePreview');
        var file = event.target.files[0];

        var reader = new FileReader();
        reader.onload = function(e) {
            image.src = e.target.result;
            image.style.display = 'block';
        };

        reader.readAsDataURL(file);
    });
</script>
</body>
</html>
