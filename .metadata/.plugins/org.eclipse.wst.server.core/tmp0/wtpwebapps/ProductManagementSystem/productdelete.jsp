<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Delete Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow p-4">
        <h2 class="mb-4 text-center fw-bold">Delete Product</h2>

        <form action="DeleteProductServlet" method="post" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="id" class="form-label">Product ID to Delete</label>
                <input type="number" class="form-control" id="id" name="id" required min="1">
                <div class="invalid-feedback">Please provide Product ID.</div>
            </div>

            <div class="row mt-4">
                <div class="col-md-6 mb-2">
                    <button type="submit" class="btn btn-danger btn-lg w-100">Delete Product</button>
                </div>
                <div class="col-md-6 mb-2">
                    <a href="index.jsp" class="btn btn-primary btn-lg w-100">Home</a>
                </div>
            </div>
        </form>

        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-info mt-3"><%= request.getAttribute("message") %></div>
        <% } %>
    </div>
</div>

<script>
(() => {
  'use strict';
  const forms = document.querySelectorAll('.needs-validation');
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });
})();
</script>
</body>
</html>
