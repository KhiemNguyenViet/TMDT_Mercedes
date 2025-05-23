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
function showNotification(message) {
    $('.success-notification').fadeIn(300)
        .find('.notification-text').text(message);

    setTimeout(function () {
        $('.success-notification').fadeOut(300);
    }, 3000);
}
$(document).ready(function () {
    ////////////////////////////////////////
    window.updateStatus = function (id, status) {
        // Tạo thông báo xác nhận
        let message = '';
        switch (status) {
            case 'confirmed':
                message = 'Xác nhận đơn đặt lịch này?'
                break;
            case 'completed':
                message = 'Xác nhận hoàn thành đơn đặt lịch này?';
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
                        // let trangThai = status === 'completed' ? 'Đã hoàn thành' : 'Đã hủy';
                        // let mauBadge = status === 'completed' ? 'success' : 'danger';

                        // // Cập nhật text trạng thái
                        // $(`#order_${id} .status-badge`).text(trangThai)
                        //     .removeClass('status-pending status-completed status-cancelled')
                        //     .addClass(`status-${status}`);

                        // // Ẩn nút thao tác và hiển thị badge
                        // $(`#order_${id} .action-buttons`).html(
                        //     `<span class="badge badge-${mauBadge}">${trangThai}</span>`
                        // );

                        alert(result.message);
                        location.reload();
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
    $('.button.delete').click(function () {
        var userId = $(this).closest('tr').attr('id').replace('user_', '');
        var $boxConfirm = $('.box_confirm');
        var $loadOverlay = $('.load_overlay');
        var $loadProcess = $('.load_process');
        var $loadNote = $('.load_note');

        // Show confirmation box with smooth animation
        $boxConfirm.css({
            'opacity': '0',
            'display': 'flex'
        }).animate({
            'opacity': '1'
        }, 300);

        // Handle confirm delete
        function handleDelete() {
            // Show loading with smooth transition
            $loadOverlay.fadeIn(300);
            $loadProcess.fadeIn(300);
            $loadNote.html('Đang xử lý...');

            $.ajax({
                url: 'process.php',
                type: 'POST',
                data: {
                    action: 'delete_user',
                    id: userId
                },
                dataType: 'json',
                success: function (response) {
                    $loadNote.fadeOut(200, function () {
                        $(this).html(response.message).fadeIn(200);
                    });

                    if (response.ok === 1) {
                        // Fade out the deleted row
                        $('#user_' + userId).fadeOut(500, function () {
                            $(this).remove();
                        });

                        // Hide all overlays smoothly
                        setTimeout(function () {
                            $loadProcess.fadeOut(300);
                            $loadOverlay.fadeOut(300);
                            $boxConfirm.fadeOut(300);

                            // Only reload if needed
                            setTimeout(function () {
                                location.reload();
                            }, 300);
                        }, 1000);
                    } else {
                        // Hide overlays on error
                        setTimeout(function () {
                            $loadProcess.fadeOut(300);
                            $loadOverlay.fadeOut(300);
                            $boxConfirm.fadeOut(300);
                        }, 1000);
                    }
                },
                error: function () {
                    $loadNote.fadeOut(200, function () {
                        $(this).html('Có lỗi xảy ra').fadeIn(200);
                    });

                    setTimeout(function () {
                        $loadProcess.fadeOut(300);
                        $loadOverlay.fadeOut(300);
                        $boxConfirm.fadeOut(300);
                    }, 1000);
                }
            });
        }

        // One-time event handlers
        function handleConfirm(e) {
            e.preventDefault();
            $(document).off('click', '#confirm_yes', handleConfirm);
            $(document).off('click', '#confirm_no', handleCancel);
            handleDelete();
        }

        function handleCancel(e) {
            e.preventDefault();
            $(document).off('click', '#confirm_yes', handleConfirm);
            $(document).off('click', '#confirm_no', handleCancel);
            $boxConfirm.fadeOut(300);
        }

        // Attach handlers
        $(document).on('click', '#confirm_yes', handleConfirm);
        $(document).on('click', '#confirm_no', handleCancel);
    });
    $('.btn-delete').click(function () {
        var productId = $(this).closest('tr').attr('id').replace('product-', '');
        var $boxConfirm = $('.box_confirm');

        // Hiện box confirm
        $boxConfirm.fadeIn(200).css('display', 'flex');

        // Bind event cho nút Thực hiện
        $(document).on('click', '#confirm_yes', function () {
            $('.load_overlay').show();
            $('.load_process').fadeIn();

            $.ajax({
                url: 'process.php',
                type: 'POST',
                data: {
                    action: 'delete_product',
                    id: productId
                },
                dataType: 'json',
                success: function (response) {
                    try {
                        setTimeout(function () {
                            $('.load_note').html(response.message);
                        }, 1000);

                        setTimeout(function () {
                            $('.load_process').hide();
                            $('.load_overlay').hide();
                            $boxConfirm.fadeOut(200);

                            if (response.ok === 1) {
                                $('#product-' + productId).remove(); // Xóa hàng khỏi bảng
                                location.reload(); // Reload trang
                            }
                        }, 500);
                    } catch (e) {
                        console.error('Lỗi:', e);
                        $('.load_note').html('Có lỗi xử lý dữ liệu');
                        setTimeout(function () {
                            $('.load_process').hide();
                            $('.load_overlay').hide();
                            $boxConfirm.fadeOut(200);
                        }, 500);
                    }
                },
                error: function (xhr, status, error) {
                    console.error('AJAX error:', status, error);
                    $('.load_note').html('Có lỗi xảy ra');
                    setTimeout(function () {
                        $('.load_process').hide();
                        $('.load_overlay').hide();
                        $boxConfirm.fadeOut(200);
                    }, 500);
                }
            });

            // Unbind event sau khi xử lý
            $(document).off('click', '#confirm_yes');
        });

        // Bind event cho nút Hủy
        $(document).on('click', '#confirm_no', function () {
            $boxConfirm.fadeOut(200);
            // Unbind các event
            $(document).off('click', '#confirm_yes');
            $(document).off('click', '#confirm_no');
        });
    });
    $('.btn-edit_product').click(function () {
        // Tạo FormData từ form        
        var formData = new FormData($('#productForm')[0]);
        formData.append('action', 'update_product');
        // Lấy các giá trị input        
        formData.append('name_product', $('#productForm #name').val());
        formData.append('category_id', $('#productForm #category').val());
        formData.append('price', $('#productForm #price').val());
        formData.append('stock', $('#productForm #stock').val());
        formData.append('description', $('#productForm #description').val());
        formData.append('featured', $('#productForm #featured').val());
        formData.append('engine_type', $('#productForm #engine_type').val());
        // Thêm các thông số kỹ thuật vào FormData        
        formData.append('displacement_cc', $('#productForm #displacement').val());
        formData.append('horsepower_hp', $('#productForm #horsepower').val());
        formData.append('torque_nm', $('#productForm #torque').val());
        formData.append('transmission_type', $('#productForm #transmission').val());
        formData.append('drive_type', $('#productForm #drive_type').val());
        formData.append('fuel_consumption_l_100km', $('#productForm #fuel_consumption').val());
        formData.append('acceleration_0_100_s', $('#productForm #acceleration').val());
        formData.append('length_mm', $('#productForm #length').val());
        formData.append('width_mm', $('#productForm #width').val());
        formData.append('height_mm', $('#productForm #height').val());
        formData.append('top_speed_kmh', $('#productForm #top_speed').val());
        formData.append('interior_features', $('#productForm #interior_features').val());
        formData.append('safety_features', $('#productForm #safety_features').val());
        formData.append('color_options', $('#productForm #color_options').val());
        formData.append('id', $('#productForm .form-sections').attr('id_product'));

        $.ajax({
            url: '../admin/process.php',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                let result = JSON.parse(response);
                if (result.ok == 1) {
                    toastr.success(result.message);
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                } else {
                    toastr.error(result.message);
                }
            },
            error: function (xhr, status, error) {
                toastr.error('Có lỗi xảy ra khi cập nhật sản phẩm');
            }
        });
    });
    $('.btn-add_product').click(function () {
        // Tạo FormData từ form                
        var formData = new FormData();
        // Thêm file ảnh        
        var imageFile = $('#productForm_add #image')[0].files[0];
        if (imageFile) {
            formData.append('image', imageFile);
        } else {
            toastr.error('Vui lòng chọn ảnh sản phẩm');
            return;
        }
        formData.append('action', 'add_product');
        // Lấy các giá trị input cơ bản        
        formData.append('name_product', $('#productForm_add #name').val());
        formData.append('category_id', $('#productForm_add #category').val());
        formData.append('price', $('#productForm_add #price').val().replace(/[^0-9]/g, ''));
        formData.append('stock', $('#productForm_add #stock').val());
        formData.append('description', $('#productForm_add #description').val());
        formData.append('featured', $('#productForm_add #featured').val());
        // Thông số kỹ thuật        
        formData.append('engine_type', $('#productForm_add #engine_type').val());
        formData.append('displacement_cc', $('#productForm_add #displacement').val());
        formData.append('horsepower_hp', $('#productForm_add #horsepower').val());
        formData.append('torque_nm', $('#productForm_add #torque').val());
        formData.append('transmission_type', $('#productForm_add #transmission').val());
        formData.append('drive_type', $('#productForm_add #drive_type').val());
        formData.append('fuel_consumption_l_100km', $('#productForm_add #fuel_consumption').val());
        formData.append('acceleration_0_100_s', $('#productForm_add #acceleration').val());
        // Kích thước và tính năng        
        formData.append('length_mm', $('#productForm_add #length').val());
        formData.append('width_mm', $('#productForm_add #width').val());
        formData.append('height_mm', $('#productForm_add #height').val());
        formData.append('top_speed_kmh', $('#productForm_add #top_speed').val());
        formData.append('interior_features', $('#productForm_add #interior_features').val());
        formData.append('safety_features', $('#productForm_add #safety_features').val());
        formData.append('color_options', $('#productForm_add #color_options').val());

        $.ajax({
            url: '../admin/process.php',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                let result = JSON.parse(response);
                if (result.ok == 1) {
                    toastr.success(result.message);
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                } else {
                    toastr.error(result.message);
                }
            },
            error: function (xhr, status, error) {
                toastr.error('Có lỗi xảy ra khi thêm sản phẩm');
            }
        });
    });




});
window.status_update = function (id, status) {
    let message = '';
    switch (status) {
        case 'processing':
            message = 'Xác nhận xử lý đơn hàng này?'
            break;
        case 'completed':
            message = 'Xác nhận hoàn thành đơn hàng này?';
            break;
        case 'cancelled':
            message = 'Bạn có chắc muốn hủy đơn hàng này?';
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
            action: 'update_order_status',
            id: id,
            status: status
        },
        success: function (response) {
            try {
                let result = JSON.parse(response);
                if (result.success) {
                    alert(result.message);
                    location.reload();
                } else {
                    alert('Lỗi: ' + result.message);
                }
            } catch (e) {
                console.error('Parse error:', e);
                alert('Có lỗi xảy ra khi xử lý dữ liệu!');
            }
        },
        error: function (xhr, status, error) {
            console.error('Ajax error:', error);
            alert('Có lỗi khi kết nối đến server!');
        }
    });
}

