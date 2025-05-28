<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 1rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="card mx-auto" style="max-width: 600px;">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Generate Product Report</h4>
        </div>
        <div class="card-body">
            <form action="ReportCriteriaServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Select Report Type</label>
                    <select name="type" class="form-select" required>
                        <option value="" selected disabled>--Choose--</option>
                        <option value="price">Products with Price Greater than</option>
                        <option value="category">Products in Specific Category</option>
                        <option value="top">Top N Products by Quantity</option>
                    </select>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-success">Next</button>
                    <a href="index.jsp" class="btn btn-secondary">Home</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
