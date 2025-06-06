// Hàm kiểm tra email hợp lệ
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}
$(document).ready(function () {
    //////////////////////
    $('.profile-form #savetk-btn').click(function () {
        // console.log('click');
        var formData = new FormData();
        var avatarFile = $('#avatarInput')[0].files[0];
        var currentAvatar = $('#currentAvatar').val().trim();

        if (avatarFile) {
            formData.append('image', avatarFile);
        } else if (!currentAvatar) {
            toastr.error('Vui lòng chọn ảnh đại diện');
            return;
        }
        formData.append('full_name', $('input[name="full_name"]').val());
        formData.append('email', $('input[name="email"]').val());
        formData.append('phone', $('input[name="phone"]').val());
        formData.append('address', $('input[name="address"]').val());
        formData.append('user_id', $('.profile-form button').attr('id_user'));
        formData.append('current_avatar', currentAvatar);
        formData.append('action', 'update_tk');
        $.ajax({
            url: '/process.php',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                // console.log(response);
                // die();
                const info = JSON.parse(response);
                if (info.ok == 1) {
                    toastr.success(info.thongbao);
                    setTimeout(function () {
                        location.reload();
                    }, 3000);
                } else {
                    toastr.error(info.thongbao);
                }
            }
        });
    });
    //////////////////////
    $('#datxe').click(function () {
        product_id = $('.info').data('product-id');
        user_id = $('.user_info').data('user-id');
        $.ajax({
            url: '/process.php',
            type: 'POST',
            data: {
                action: 'datcho',
                product_id: product_id,
                user_id: user_id
            },
            success: function (response) {
                $('body').html(response);
            }
        })
    });
    // $('.buy-btn').click(function () {
    //     product_id = $('.info').data('product-id');
    //     $.ajax({
    //         url: '/process.php',
    //         type: 'POST',
    //         data: {
    //             action: 'datcho',
    //             product_id: product_id,
    //         },
    //         success: function (response) {
    //             $('body').html(response);
    //             toastr.error('Không thể kết nối máy chủ. Mã lỗi: ' + xhr.status);
    //         }
    //     });
    // });
    // Chặn form reload
    $('#login-form').on('submit', function (e) {
        e.preventDefault();

        const username = $('input[name=username]').val();
        const password = $('input[name=password]').val();
        const remember = $('.remember').attr('value');


        $('.load_overlay').show();
        $('.load_process').fadeIn();
        $('.load_note').html('Đang xử lý đăng nhập...');

        $.ajax({
            url: "/process_login.php",
            type: "POST",
            data: {
                username: username,
                password: password,
                remember: remember
            },
            success: function (response) {
                try {
                    const info = JSON.parse(response);

                    // Hiển thị thông báo trên load_process
                    $('.load_note').html(info.thongbao || 'Đăng nhập thành công!');

                    setTimeout(function () {
                        if (info.ok == 1) {
                            $('.load_note').html('Đăng nhập thành công! Đang chuyển hướng...');
                            setTimeout(function () {
                                window.location.href = '/admin/dashboard';
                            }, 1000);
                        } else if (info.ok == 2) {
                            $('.load_note').html('Đăng nhập thành công! Đang chuyển hướng...');
                            setTimeout(function () {
                                window.location.href = '/';
                            }, 1000);
                        } else {
                            $('.load_note').html(info.thongbao || 'Đăng nhập thất bại');
                            setTimeout(function () {
                                $('.load_process').hide();
                                $('.load_overlay').hide();
                                toastr.error(info.thongbao || 'Đăng nhập thất bại');
                            }, 1000);
                        }
                    }, 1000);
                } catch (e) {
                    console.error('Lỗi:', e);
                    $('.load_note').html('Có lỗi xử lý dữ liệu');
                    setTimeout(function () {
                        $('.load_process').hide();
                        $('.load_overlay').hide();
                    }, 1000);
                }
            },
            error: function () {
                $('.load_note').html('Có lỗi xảy ra khi kết nối máy chủ');
                setTimeout(function () {
                    $('.load_process').hide();
                    $('.load_overlay').hide();
                }, 1000);
            }
        });
    });
    ///////////////////////////////////
    $(document).ready(function () {
        $('#register-form').on('submit', function (e) {
            e.preventDefault();

            // Get form input values
            var username = $('input[name=username]').val().trim();
            var password = $('input[name=password]').val().trim();
            var email = $('input[name=email]').val().trim();
            var name = $('input[name=name]').val().trim();
            var phone = $('input[name=phone]').val().trim();
            var address = $('input[name=address]').val().trim();

            // Client-side validation
            if (username.length < 4) {
                toastr.error('Tên đăng nhập phải từ 4 ký tự trở lên');
                $('input[name=username]').focus();
                return false;
            }

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                toastr.error('Email không hợp lệ');
                $('input[name=email]').focus();
                return false;
            }

            if (phone.length < 10 || phone.length > 11) {
                toastr.error('Số điện thoại phải từ 10 đến 11 số');
                $('input[name=phone]').focus();
                return false;
            }

            if (password.length < 6) {
                toastr.error('Mật khẩu phải từ 6 ký tự trở lên');
                $('input[name=password]').focus();
                return false;
            }

            // Show loading overlay
            $('.load_overlay').show();
            $('.load_process').fadeIn();
            $('.load_note').html('Đang xử lý đăng ký...');

            // AJAX request
            $.ajax({
                url: '/process_register.php',
                type: 'POST',
                data: {
                    username: username,
                    password: password,
                    email: email,
                    name: name,
                    phone: phone,
                    address: address
                },
                dataType: 'json', // Expect JSON response
                success: function (response) {
                    console.log('Response:', response);

                    // Update loading message
                    $('.load_note').html(response.thongbao || 'Đăng ký thành công!');

                    setTimeout(function () {
                        if (response.ok === 1) {
                            $('.load_note').html('Đăng ký thành công! Đang chuyển hướng...');
                            setTimeout(function () {
                                window.location.href = 'login.html';
                            }, 1000);
                        } else {
                            $('.load_note').html(response.thongbao || 'Đăng ký thất bại');
                            toastr.error(response.thongbao || 'Đăng ký thất bại');
                            $('.load_process').hide();
                            $('.load_overlay').hide();
                        }
                    }, 1000);
                },
            });
        });
    });

    /////////////////////
    // Đặt lịch lái thử xe
    // Hiển thị loading
    $('.datlich-button').off('click').on('click', function () {
        const $button = $(this);
        const originalText = $button.text();
        $button.prop('disabled', true).text('Đang xử lý...');

        // Lấy giá trị từ form
        // username = $('input[name="fullName"]').val();
        // phoneNumber = $('input[name="phoneNumber"]').val();
        // email = $('input[name="email"]').val();
        // testDriveDate = $('input[name="testDriveDate"]').val();
        // testDriveTime = $('select[name="testDriveTime"]').val();
        // notes = $('textarea[name="notes"]').val();
        // diadiem = $('select[name="location"]').val();

        const username = $('#bookingForm input[name="fullName"]').val();
        const phoneNumber = $('#bookingForm input[name="phoneNumber"]').val();
        const email = $('#bookingForm input[name="email"]').val();
        const testDriveDate = $('#bookingForm input[name="testDriveDate"]').val();
        const testDriveTime = $('#bookingForm select[name="testDriveTime"]').val();
        const notes = $('#bookingForm textarea[name="notes"]').val();
        const diadiem = $('#bookingForm select[name="location"]').val();

        // Lấy productId từ URL hoặc data attribute
        const productId = $('.info').data('product-id');

        // Validate dữ liệu
        if (username.length < 4) {
            toastr.error('Tên khách hàng phải từ 4 ký tự trở lên');
            $('#bookingForm input[name="fullName"]').focus();
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (phoneNumber.length < 10 || phoneNumber.length > 11) {
            toastr.error('Số điện thoại phải từ 10 ký tự trở lên và không quá 11 ký tự');
            $('#bookingForm input[name="phoneNumber"]').focus();
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (testDriveDate == '') {
            toastr.error('Ngày lái thử xe không được để trống');
            $('#bookingForm input[name="testDriveDate"]').focus();
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (testDriveTime == '') {
            toastr.error('Giờ lái thử xe không được để trống');
            $('#bookingForm select[name="testDriveTime"]').focus();
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (!productId) {
            toastr.error('Không tìm thấy thông tin xe. Vui lòng thử lại sau.');
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (email == '') {
            toastr.error('Email không được để trống');
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (email != '' && !isValidEmail(email)) {
            toastr.error('Email không hợp lệ. Vui lòng nhập lại.');
            $button.prop('disabled', false).text(originalText);
            return;
        }
        if (!confirm('Bạn có chắc chắn muốn đặt lịch lái thử xe này?')) {
            $button.prop('disabled', false).text(originalText);
            return;
        }

        // Gửi request đến server
        $.ajax({
            url: '../../process.php',
            method: 'POST',
            data: {
                action: 'datlich',
                fullName: username,
                phoneNumber: phoneNumber,
                email: email,
                testDriveDate: testDriveDate,
                testDriveTime: testDriveTime,
                notes: notes,
                productId: productId,
                diadiem: diadiem
            },
            dataType: 'json',
            success: function (response) {
                if (response.ok === 1) {
                    alert('Yêu cầu đặt lịch lái thử xe của Quý khách đã được gửi. Chúng tôi sẽ liên hệ lại sớm nhất, xin quý khách vui lòng để ý kiểm tra email để nhận thông báo.');
                    setTimeout(function () {
                        $('#bookingPopup').hide();
                        $('form#bookingForm')[0].reset();
                    }, 2000);

                } else {
                    if (response.trungLich) {
                        const confirmChange = confirm(response.thongbao + '\n\nBạn có muốn chọn thời gian khác không?');
                        if (confirmChange) {
                            $('input[name="testDriveDate"]').focus();
                        }
                    } else {
                        toastr.error(response.thongbao);
                    }
                }
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
                toastr.error('Có lỗi xảy ra khi gửi yêu cầu. Vui lòng thử lại sau.');
            },
            complete: function () {
                // Khôi phục trạng thái nút
                $button.prop('disabled', false).text(originalText);
            }
        });
    });

    // Xử lý nút tư vấn xe
    $('#openConsultPopupBtn').click(function () {
        const stock = parseInt($('.info').data('stock'));
        const productName = $('.info h2').text();

        if (stock === 0) {
            toastr.error('Xin lỗi, sản phẩm ' + productName + ' hiện đã hết hàng. Vui lòng liên hệ với chúng tôi để được tư vấn về các sản phẩm khác.');
            return;
        }

        // Nếu còn hàng thì mở popup tư vấn
        $('#consultPopup').css('display', 'flex');
    });

    // Xử lý nút đặt lịch lái thử
    $('#openBookingPopupBtn').click(function () {
        user_id = $('.user_info').data('user-id');
        if (user_id == '') {
            toastr.error('Hãy đăng nhập để sử dụng chức năng này');
            setTimeout(function () {
                window.location.href = '/login.php';
            }, 1000);
            return;
        }
        // Nếu đã đăng nhập thì mở popup đặt lịch
        $('#bookingPopup').css('display', 'flex');
    });

    window.kh_updateStatus = function (id, status) {
        let message = '';
        switch (status) {
            case 'processing':
                message = 'Bạn có chắc muốn hủy lịch lái thử xe này?';
                break;
        }

        if (!confirm(message)) {
            return;
        }

        $.ajax({
            url: '/process.php',
            type: 'POST',
            data: {
                action: 'kh_cancel_lichlai',
                id: id,
                status: status
            },
            success: function (response) {
                console.log(response);
                try {
                    let result = JSON.parse(response);
                    if (result.ok == 1) {
                        toastr.success(result.thongbao);
                        setTimeout(function () {
                            window.location.reload();
                        }, 3000);
                    } else {
                        toastr.error(result.thongbao);
                    }
                } catch (e) {
                    console.error('Lỗi:', e);
                }
            }
        });
    }


    // Xử lý đặt giữ chỗ xe
    // Xử lý đặt giữ chỗ xe
    // $('#xacnhan_giucho').off('click').on('click', function (e) {
    //     e.preventDefault();
    //     var form = $('#multiStepForm')[0];
    //     if (!form) {
    //         toastr.error('Không tìm thấy biểu mẫu. Vui lòng kiểm tra lại.');
    //         return;
    //     }

    //     var formData = new FormData(form);
    //     var image_thanhtoan = $('#multiStepForm #payment_image')[0].files[0];
    //     formData.append('image_thanhtoan', image_thanhtoan);
    //     formData.append('action', 'xacnhan_datcho');

    //     const product_id = $('.car-info').data('product-id');
    //     const price = $('.price').data('price');
    //     const user_id = $('.user_info').data('user-id');
    //     const pay_note = $('input[name="pay_note"]').val();
    //     const salutation = $('select[name="salutation"]').val();
    //     const username = $('input[name="fullName"]').val();
    //     const phoneNumber = $('input[name="phoneNumber"]').val();
    //     const email = $('input[name="email"]').val();
    //     const address = $('input[name="address"]').val();
    //     const bank_account_number = $('input[name="bank_account_number"]').val();
    //     const bank_account_name = $('input[name="bank_account_name"]').val();
    //     const bank_name = $('input[name="bank_name"]').val();
    //     const bank_branch = $('input[name="bank_branch"]').val();
    //     const dealer = $('input[name="dealer"]').val();
    //     const sales_person = $('input[name="sales_person"]').val();

    //     console.log(salutation, username, phoneNumber, email, bank_account_number, bank_account_name, bank_name, dealer);
    //     // Kiểm tra các trường bắt buộc
    //     if (!salutation || !username || !phoneNumber || !email || !bank_account_number || !bank_account_name || !bank_name || !dealer) {
    //         toastr.error('Vui lòng điền đầy đủ các trường bắt buộc.');
    //         return;
    //     }
    //     if (!product_id || !price || !user_id) {
    //         toastr.error('Thiếu thông tin xe hoặc người dùng.');
    //         return;
    //     }

    //     formData.append('product_id', product_id);
    //     formData.append('price', price);
    //     formData.append('pay_note', pay_note);
    //     formData.append('salutation', salutation);
    //     formData.append('username', username);
    //     formData.append('phoneNumber', phoneNumber);
    //     formData.append('email', email);
    //     formData.append('address', address);
    //     formData.append('bank_account_number', bank_account_number);
    //     formData.append('bank_account_name', bank_account_name);
    //     formData.append('bank_name', bank_name);
    //     formData.append('bank_branch', bank_branch);
    //     formData.append('dealer', dealer);
    //     formData.append('sales_person', sales_person);
    //     formData.append('user_id', user_id);

    //     $.ajax({
    //         url: '/process.php',
    //         type: 'POST',
    //         data: formData,
    //         processData: false,
    //         contentType: false,
    //         success: function (response) {
    //             const info = JSON.parse(response);
    //             if (info.ok === 1) {
    //                 toastr.success(info.thongbao);
    //                 setTimeout(function () {
    //                     window.location.href = '/cacmauxe.html';
    //                 }, 2000);
    //             } else {
    //                 toastr.error(info.thongbao);
    //             }
    //         },
    //         error: function (xhr, status, error) {
    //             console.error('Lỗi:', error);
    //             toastr.error('Có lỗi xảy ra khi gửi yêu cầu. Vui lòng thử lại sau.');
    //         }
    //     });
    // });

});
