let currentStep = 0;
const steps = document.querySelectorAll('.form-step');
const stepNavs = document.querySelectorAll('.step-nav .step');

function showStep(stepNumber) {
    // Ẩn tất cả các bước
    steps.forEach(step => step.classList.remove('active'));
    stepNavs.forEach(nav => nav.classList.remove('active'));

    // Hiển thị bước hiện tại
    steps[stepNumber].classList.add('active');
    stepNavs[stepNumber].classList.add('active');
}

function validateStep(stepNumber) {
    const currentStep = steps[stepNumber];
    const inputs = currentStep.querySelectorAll('input[required], select[required]');
    let isValid = true;

    inputs.forEach(input => {
        if (!input.checkValidity()) {
            isValid = false;
            input.classList.add('error');
            input.reportValidity();
        } else {
            input.classList.remove('error');
        }
    });

    return isValid;
}

function nextStep() {
    if (validateStep(currentStep)) {
        if (currentStep < steps.length - 1) {
            currentStep++;
            showStep(currentStep);
        }
    }
}

function prevStep() {
    if (currentStep > 0) {
        currentStep--;
        showStep(currentStep);
    }
}

// Khởi tạo form
document.addEventListener('DOMContentLoaded', function () {
    // Thêm CSS cho validation
    const style = document.createElement('style');
    style.textContent = `
        .error {
            border-color: red !important;
        }
        .form-step {
            display: none;
        }
        .form-step.active {
            display: block;
        }
    `;
    document.head.appendChild(style);

    // Hiển thị bước đầu tiên
    showStep(0);

    // Xử lý submit form
    document.getElementById('multiStepForm').addEventListener('submit', function (e) {
        e.preventDefault();

        if (validateStep(currentStep)) {
            // Gửi form thành công
            this.style.display = 'none';
            const successMessage = document.createElement('div');
            successMessage.className = 'success-message';
            successMessage.innerHTML = '<h3>✅ Đặt giữ chỗ thành công!</h3>';
            this.parentNode.insertBefore(successMessage, this.nextSibling);
        }
    });
});

function showStep(stepIndex) {
    const steps = document.querySelectorAll(".form-step");
    const navSteps = document.querySelectorAll(".step");

    steps.forEach((step) => step.classList.remove("active"));
    navSteps.forEach((step) => step.classList.remove("active"));

    steps[stepIndex].classList.add("active");
    navSteps[stepIndex].classList.add("active");
}

function nextStep() {
    const formSteps = document.querySelectorAll(".form-step");
    const currentFormStep = formSteps[currentStep];
    const inputs = currentFormStep.querySelectorAll("input, select");

    // Kiểm tra tính hợp lệ của các input trong bước hiện tại
    for (let input of inputs) {
        if (!input.checkValidity()) {
            input.reportValidity();
            return;
        }
    }

    if (currentStep < formSteps.length - 1) {
        currentStep++;
        showStep(currentStep);
    }
}

function prevStep() {
    if (currentStep > 0) {
        currentStep--;
        showStep(currentStep);
    }
}

document.getElementById("multiStepForm").addEventListener("submit", function (e) {
    e.preventDefault();

    const allInputs = this.querySelectorAll("input, select");
    let allValid = true;

    for (let input of allInputs) {
        if (!input.checkValidity()) {
            allValid = false;
            break;
        }
    }

    // if (allValid) {
    //     this.style.display = "none";
    //     document.querySelector(".success-message").innerHTML = "<h3>✅ Đặt giữ chỗ thành công!</h3>";
    //     document.querySelector(".success-message").style.display = "block";
    // } else {
    //     document.querySelector(".success-message").innerHTML = "<h3 style='color: red;'>❌ Không thành công do thông tin bạn nhập không chính xác hoặc bị bỏ trống.</h3>";
    //     document.querySelector(".success-message").style.display = "block";
    // }
});
