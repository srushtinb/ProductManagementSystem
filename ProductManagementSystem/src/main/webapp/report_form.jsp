<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String type = (String) request.getAttribute("type");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Report Criteria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="card mx-auto" style="max-width: 600px;">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Enter Criteria for Report</h4>
        </div>
        <div class="card-body">
            <form action="ReportServlet" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="type" value="<%= type %>"/>

                <% if ("price".equals(type)) { %>
                    <div class="mb-3">
                        <label for="price" class="form-label">Price Greater Than</label>
                        <input type="number" step="0.01" class="form-control" id="price" name="price" required min="0">
                        <div class="invalid-feedback">Please enter a valid price.</div>
                    </div>
                <% } else if ("category".equals(type)) { %>
                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <input type="text" class="form-control" id="category" name="category" required maxlength="50">
                        <div class="invalid-feedback">Please enter a category.</div>
                    </div>
                <% } else if ("top".equals(type)) { %>
                    <div class="mb-3">
                        <label for="limit" class="form-label">Top N Products (by Quantity)</label>
                        <input type="number" class="form-control" id="limit" name="limit" required min="1" max="100">
                        <div class="invalid-feedback">Please enter a valid number between 1 and 100.</div>
                    </div>
                <% } else { %>
                    <div class="alert alert-danger">Invalid report type selected.</div>
                <% } %>

                <div class="d-flex justify-content-between mt-4">
                    <button type="submit" class="btn btn-success">Generate Report</button>
                    <a href="reports.jsp" class="btn btn-secondary">Back</a>
                </div>
            </form>
        </div>
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
