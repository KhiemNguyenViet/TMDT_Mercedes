<tr id="product-{id}">
    <td><img src="../hinhanh/{image}" alt="{name}" class="product-img"></td>
    <td>
        <strong>{name}</strong><br>
    </td>
    <td>{price}</td>
    <td>{description}</td>
    <td>Còn: {stock} xe</td>
    <td>
        <a href="index.php?action=edit_product&id={id}" class="btn-edit">Sửa</a>
        <button class="btn-delete" onclick="xoaSanPham({id})">Xóa</button>
    </td>
</tr>
<style>
    .btn-edit {
        display: inline-block;
        padding: 5px 10px;
        background: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 3px;
        margin-right: 5px;
    }

    .btn-edit:hover {
        background: #45a049;
    }

    .btn-delete {
        padding: 5px 10px;
        background: #f44336;
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    .btn-delete:hover {
        background: #da190b;
    }
</style>