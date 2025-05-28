<tr>
    <td style="text-align: center;">#{id}</td>
    <td>
        <div class="d-flex align-items-center">
            <img src="../Uploads/{product_image}" class="img-thumbnail me-2" style="width: 50px; height: 50px; object-fit: cover;">
            <div>
                <div class="fw-bold">{product_name}</div>
                <small class="text-muted">Mã SP: {product_id}</small>
            </div>
        </div>
    </td>
    <td>{total_amount} VNĐ</td>
    <td>{deposit_amount} VNĐ</td>
    <td>
        <small>
            <div><strong>Ngân hàng:</strong> {bank_name}</div>
            <div><strong>Chi nhánh:</strong> {bank_branch}</div>
            <div><strong>STK:</strong> {bank_account_number}</div>
            <div><strong>Chủ TK:</strong> {bank_account_name}</div>
        </small>
    </td>
    <td>{orders.status}</td>   
    <td>{created_at}</td>
    <td>
        <button type="button" class="btn btn-sm btn-primary" onclick="openPopup('orderDetail{id}')">Chi tiết</button>
    </td>
</tr>
<div class="popup" id="orderDetail{id}">
    <div class="popup-content">
        <div class="popup-header">
            <h5 class="popup-title">Chi tiết đơn hàng #{id}</h5>
            <button type="button" class="popup-close" onclick="closePopup('orderDetail{id}')">×</button>
        </div>
        <div class="popup-body">
            <div class="row">
                <div class="col-md-6">
                    <h6 class="mb-3">Thông tin khách hàng</h6>
                    <p><strong>Họ tên:</strong> {orders.salutation} {fullname}</p>
                    <p><strong>Số điện thoại:</strong> {phone_number}</p>
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
                    <img src="Uploads/{orders.image_thanhtoan}" class="img-fluid rounded" alt="Hình ảnh thanh toán">
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <h6 class="mb-3">Ghi chú thanh toán</h6>
                    <p>{payment_notes}</p>
                </div>
            </div>
        </div>
        <div class="popup-footer">
            <button type="button" class="btn btn-secondary" onclick="closePopup('orderDetail{id}')">Đóng</button>
        </div>
    </div>
</div>