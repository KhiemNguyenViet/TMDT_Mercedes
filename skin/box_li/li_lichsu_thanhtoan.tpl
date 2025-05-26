<tr>
    <td style="text-align: center;">#{id}</td>
    <td>
        <div class="d-flex align-items-center">
            <img src="../uploads/{product_image}" class="img-thumbnail me-2" style="width: 50px; height: 50px; object-fit: cover;">
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
    <td>
        {orders.status}
    </td>   
    <td>{created_at}</td>
    <td>
        <button type="button" class="btn btn-sm btn-primary" onclick="openPopup('orderDetail{orders.id}')">Chi tiết</button>
    </td>
</tr>