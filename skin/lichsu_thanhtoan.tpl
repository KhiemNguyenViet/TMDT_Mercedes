<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description" content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords" content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách lịch lái thử</title>
</head> 
<body>
    <!-- Breadcrumb -->
 {header}
 <div class="container-fluid py-4 bg-light">
     <div class="container">
         <nav aria-label="breadcrumb">
             <ol class="breadcrumb">
                 <li class="breadcrumb-item"><a href="index.php">Trang chủ</a></li>
                 <li class="breadcrumb-item active" aria-current="page">Lịch sử thanh toán</li>
             </ol>
         </nav>
     </div>
 </div>
 
 <!-- Main Content -->
 <div class="container my-5">
     <h2 class="mb-4">Lịch sử thanh toán</h2>
     
     <div class="table-responsive">
         <table class="table table-striped table-hover">
             <thead class="table-dark">
                 <tr>
                     <th>Mã đơn hàng</th>
                     <th>Sản phẩm</th>
                     <th>Tổng tiền</th>
                     <th>Số tiền đặt cọc</th>
                     <th>Thông tin ngân hàng</th>
                     <th>Trạng thái</th>
                     <th>Ngày tạo</th>
                     <th>Hành động</th>
                 </tr>
             </thead>
             <tbody>
                 <!-- BEGIN: orders -->
                 <tr>
                     <td>#{orders.id}</td>
                     <td>
                         <div class="d-flex align-items-center">
                             <img src="uploads/{orders.product_image}" class="img-thumbnail me-2" style="width: 50px; height: 50px; object-fit: cover;">
                             <div>
                                 <div class="fw-bold">{orders.product_name}</div>
                                 <small class="text-muted">Mã SP: {orders.product_id}</small>
                             </div>
                         </div>
                     </td>
                     <td>{orders.total_amount} VNĐ</td>
                     <td>{orders.deposit_amount} VNĐ</td>
                     <td>
                         <small>
                             <div><strong>Ngân hàng:</strong> {orders.bank_name}</div>
                             <div><strong>Chi nhánh:</strong> {orders.bank_branch}</div>
                             <div><strong>STK:</strong> {orders.bank_account_number}</div>
                             <div><strong>Chủ TK:</strong> {orders.bank_account_name}</div>
                         </small>
                     </td>
                     <td>
                         <!-- BEGIN: status_pending -->
                         <span class="badge bg-warning">Chờ xử lý</span>
                         <!-- END: status_pending -->
                         <!-- BEGIN: status_processing -->
                         <span class="badge bg-info">Đang xử lý</span>
                         <!-- END: status_processing -->
                         <!-- BEGIN: status_completed -->
                         <span class="badge bg-success">Hoàn thành</span>
                         <!-- END: status_completed -->
                         <!-- BEGIN: status_cancelled -->
                         <span class="badge bg-danger">Đã hủy</span>
                         <!-- END: status_cancelled -->
                     </td>
                     <td>{orders.created_at}</td>
                     <td>
                         <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#orderDetail{orders.id}">
                             Chi tiết
                         </button>
                     </td>
                 </tr>
 
                 <!-- Modal Chi tiết đơn hàng -->
                 <div class="modal fade" id="orderDetail{orders.id}" tabindex="-1" aria-hidden="true">
                     <div class="modal-dialog modal-lg">
                         <div class="modal-content">
                             <div class="modal-header">
                                 <h5 class="modal-title">Chi tiết đơn hàng #{orders.id}</h5>
                                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                             </div>
                             <div class="modal-body">
                                 <div class="row">
                                     <div class="col-md-6">
                                         <h6 class="mb-3">Thông tin khách hàng</h6>
                                         <p><strong>Họ tên:</strong> {orders.salutation} {orders.full_name}</p>
                                         <p><strong>Số điện thoại:</strong> {orders.phone_number}</p>
                                         <p><strong>Email:</strong> {orders.email}</p>
                                         <p><strong>Địa chỉ:</strong> {orders.contact_address}</p>
                                     </div>
                                     <div class="col-md-6">
                                         <h6 class="mb-3">Thông tin đại lý</h6>
                                         <p><strong>Đại lý:</strong> {orders.dealer}</p>
                                         <p><strong>Nhân viên bán hàng:</strong> {orders.sales_person}</p>
                                     </div>
                                 </div>
                                 <hr>
                                 <div class="row">
                                     <div class="col-md-12">
                                         <h6 class="mb-3">Hình ảnh thanh toán</h6>
                                         <img src="uploads/{orders.image_thanhtoan}" class="img-fluid rounded" style="max-height: 300px;">
                                     </div>
                                 </div>
                                 <hr>
                                 <div class="row">
                                     <div class="col-md-12">
                                         <h6 class="mb-3">Ghi chú thanh toán</h6>
                                         <p>{orders.payment_notes}</p>
                                     </div>
                                 </div>
                             </div>
                             <div class="modal-footer">
                                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                             </div>
                         </div>
                     </div>
                 </div>
                 <!-- END: orders -->
             </tbody>
         </table>
     </div>
 
     <!-- Không có dữ liệu -->
     <!-- BEGIN: no_orders -->
     <div class="text-center py-5">
         <img src="assets/images/no-data.png" alt="No Data" style="width: 150px; opacity: 0.5;">
         <h4 class="mt-3">Chưa có lịch sử thanh toán</h4>
         <p class="text-muted">Bạn chưa thực hiện giao dịch nào</p>
         <a href="index.php" class="btn btn-primary">Khám phá xe ngay</a>
     </div>
     <!-- END: no_orders -->
 </div>    
 {footer}
</body>