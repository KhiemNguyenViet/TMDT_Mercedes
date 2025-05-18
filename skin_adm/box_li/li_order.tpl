<tr id="order_{id}">
    <td>{id}</td>
    <td>
        <strong>{full_name}</strong>
    </td>
    <td>
        <div>{phone_number}</div>
        <div>{email}</div>
    </td>
    <td>{product_name}</td>
    <td>
        <div>{preferred_date}</div>
        <div>{preferred_time}</div>
    </td>
    <td>{location}</td>
    <td>
        <span class="status-badge status-{status}">{status_text}</span>
    </td>
    <td>{notes}</td>
    <td class="action-buttons">
        {action_buttons}
    </td>
</tr>
<style>
    .action-buttons button {
        padding: 6px 12px;
        margin: 0 3px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 13px;
        display: inline-flex;
        align-items: center;
        gap: 5px;
    }

    .btn-confirm {
        background: #28a745;
        color: white;
    }

    .btn-confirm:hover {
        background: #218838;
    }

    .btn-cancel {
        background: #dc3545;
        color: white;
    }

    .btn-cancel:hover {
        background: #c82333;
    }

    .btn-complete {
        background: #007bff;
        color: white;
    }

    .btn-complete:hover {
        background: #0056b3;
    }

    .badge {
        padding: 5px 10px;
        border-radius: 15px;
        font-size: 12px;
    }

    .badge-success {
        background: #d4edda;
        color: #155724;
    }

    .badge-danger {
        background: #f8d7da;
        color: #721c24;
    }
</style>