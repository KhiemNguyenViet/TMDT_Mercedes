function editProduct(id) {
    // Redirect to edit page
    window.location.href = '/admincp/edit-product?id=' + id;
}

// Hoặc nếu muốn dùng Ajax load form:
function editProduct(id) {
    $.ajax({
        url: '/admincp/edit-product',
        type: 'GET',
        data: { id: id },
        success: function (response) {
            // Hiển thị form edit trong modal
            $('#editModal').html(response).show();
        },
        error: function (xhr, status, error) {
            alert('Có lỗi xảy ra: ' + error);
        }
    });
}

// Đóng modal
function closeEditModal() {
    $('#editModal').hide();
}

// Handle form submit
$(document).on('submit', '#editProductForm', function (e) {
    e.preventDefault();

    var formData = new FormData(this);

    $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            if (response.success) {
                alert('Cập nhật thành công!');
                closeEditModal();
                location.reload(); // Refresh lại trang
            } else {
                alert('Lỗi: ' + response.message);
            }
        },
        error: function (xhr, status, error) {
            alert('Có lỗi xảy ra: ' + error);
        }
    });
});
$(document).ready(function () {
    window.updateStatus = function (id, status) {
        // Tạo thông báo xác nhận
        let message = '';
        switch (status) {
            case 'completed':
                message = 'Xác nhận đơn đặt lịch này?';
                break;
            case 'cancelled':
                message = 'Bạn có chắc muốn hủy đơn này?';
                break;
            default:
                alert('Trạng thái không hợp lệ');
                return;
        }

        if (!confirm(message)) {
            return;
        }

        $.ajax({
            url: 'process.php',
            type: 'POST',
            data: {
                action: 'update_test_drive_status',
                id: id,
                status: status
            },
            success: function (response) {
                try {
                    let result = JSON.parse(response);
                    if (result.success) {
                        // Cập nhật trạng thái trực tiếp trên giao diện
                        let trangThai = status === 'completed' ? 'Đã hoàn thành' : 'Đã hủy';
                        let mauBadge = status === 'completed' ? 'success' : 'danger';

                        // Cập nhật text trạng thái
                        $(`#order_${id} .status-badge`).text(trangThai)
                            .removeClass('status-pending status-completed status-cancelled')
                            .addClass(`status-${status}`);

                        // Ẩn nút thao tác và hiển thị badge
                        $(`#order_${id} .action-buttons`).html(
                            `<span class="badge badge-${mauBadge}">${trangThai}</span>`
                        );

                        alert('Cập nhật trạng thái thành công!');
                    } else {
                        alert('Lỗi: ' + result.message);
                    }
                } catch (e) {
                    console.error('Lỗi xử lý:', e);
                    alert('Có lỗi xảy ra khi xử lý dữ liệu!');
                }
            },
            error: function (xhr, status, error) {
                console.error('Lỗi Ajax:', error);
                alert('Có lỗi khi kết nối đến máy chủ!');
            }
        });
    };
});