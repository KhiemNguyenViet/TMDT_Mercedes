<tr id="user_{user_id}">
    <td>{user_id}</td>
    <td>{full_name}</td>
    <td>{phone}</td>
    <td>{email}</td>
    <td>{address}</td>
    <td>{username}</td>
    <td>
        <div style="display:flex; align-items:center;">
            <input type="password" value="{password}" readonly id="pw_{user_id}">
            <button class="toggle-password" onclick="togglePassword('pw_{user_id}', this)">&#128065;&#x20E0;</button>
        </div>
    </td>
    <td>
        <button class="button edit" data-id="{user_id}">Sửa</button>
        <button class="button delete" data-user-id="{user_id}">Xóa</button>
    </td>
</tr>
<div class="box_confirm" style="display: none;">
    <div class="box_confirm_content">
        <div class="title" style="color: #d9534f; font-weight: bold; text-align: center;">
            Xác nhận xóa tài khoản này không?
        </div>
        <div style="text-align: center; margin: 20px 0;">
            Bạn có chắc chắn muốn xóa tài khoản này không?
        </div>
        <div style="text-align: center;">
            <button id="confirm_yes"
                style="background: #ff0000; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; margin-right: 10px;">Thực
                hiện</button>
            <button id="confirm_no"
                style="background: #0066cc; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;">Hủy</button>
        </div>
    </div>
</div>
<div class="load_overlay" style="display: none;"></div>
<div class="load_process" style="display: none;">
    <div class="load_content">
        <img src="/hinhanh/load.gif" alt="loading" width="70">
        <div class="load_note">Hệ thống đang xử lý</div>
    </div>
</div>
<style>
    .load_overlay {
        position: fixed;
        background: #000;
        opacity: 0.8;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 9999;
        display: none;
    }

    .load_process {
        position: fixed;
        margin: auto;
        z-index: 99999;
        background: #fff;
        width: 400px;
        max-width: calc(90% - 10px);
        height: 120px;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        -webkit-border-radius: 8px;
        -moz-border-radius: 8px;
        -ms-border-radius: 8px;
        -o-border-radius: 8px;
        border-radius: 8px;
        text-align: center;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 5px;
        padding-right: 5px;
        overflow: hidden;
        display: none;
    }

    .load_note {
        margin-top: 15px;
        font-size: 15px;
        color: #444;
        line-height: 1.4;
    }


    .box_confirm {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        display: none;
    }

    .box_confirm_content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: white;
        padding: 20px;
        border-radius: 8px;
        min-width: 300px;
    }

    .box_confirm.show .box_confirm_content {
        transform: scale(1);
    }

    #confirm_yes,
    #confirm_no {
        padding: 12px 25px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 500;
        font-size: 14px;
        transition: all 0.2s ease;
    }

    #confirm_yes {
        background: #dc3545;
        color: white;
        margin-right: 12px;
    }

    #confirm_yes:hover {
        background: #c82333;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(220, 53, 69, 0.3);
    }

    #confirm_no {
        background: #0066cc;
        color: white;
    }

    #confirm_no:hover {
        background: #0056b3;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(0, 102, 204, 0.3);
    }

    .title {
        color: #dc3545;
        font-weight: bold;
        text-align: center;
        font-size: 18px;
        margin-bottom: 15px;
    }

    .button {
        padding: 8px 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.2s ease;
    }

    .button.edit {
        background: #28a745;
        color: white;
        margin-right: 8px;
    }

    .button.edit:hover {
        background: #218838;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3);
    }

    .button.delete {
        background: #dc3545;
        color: white;
    }

    .button.delete:hover {
        background: #c82333;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(220, 53, 69, 0.3);
    }

    .toggle-password {
        background: none;
        border: none;
        cursor: pointer;
        padding: 5px;
        margin-left: 5px;
        transition: all 0.2s ease;
    }

    .toggle-password:hover {
        opacity: 0.7;
        transform: scale(1.1);
    }

    .success-notification {
        position: fixed;
        top: 100px;
        right: 20px;
        color: white;
        padding: 15px 25px;
        border-radius: 4px;
        display: none;
        z-index: 9999;
        transition: all 0.3s ease;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        font-weight: 500;
        min-width: 280px;
    }

    .success-notification.error {
        background: rgba(220, 53, 69, 0.9);
    }

    .success-notification.success {
        background: rgba(40, 167, 69, 0.9);
    }

    .success-notification.show {
        display: block;
        animation: slideIn 0.5s ease;
    }
</style>