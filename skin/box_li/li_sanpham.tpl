<div class="product-card" data-id="{id}" data-category-id="{category_id}" onclick="window.location.href='product/{id}.html'" style="cursor: pointer;">
    <img src="uploads/{image}" alt="{name}">
    <div class="product-info">
        <h3>{name}</h3>
        <p class="price">
            <span class="new">{price} VND</span>
        </p>
        <p class="description">{description}</p>
        <p class="stock">Còn lại: {stock} xe</p>
    </div>
    <div class="product-actions">
        <a href="product/{id}.html" class="btn-detail">Chi tiết</a>
    </div>
</div>