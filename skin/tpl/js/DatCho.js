let currentStep = 0;

function showStep(stepIndex) {
    const steps = document.querySelectorAll(".form-step");
    const navSteps = document.querySelectorAll(".step");

    // Ẩn tất cả bước và loại bỏ active
    steps.forEach((step) => step.classList.remove("active"));
    navSteps.forEach((step) => step.classList.remove("active"));

    // Hiện bước hiện tại
    steps[stepIndex].classList.add("active");
    navSteps[stepIndex].classList.add("active");
}

function nextStep() {
    const steps = document.querySelectorAll(".form-step");
    if (currentStep < steps.length - 1) {
        currentStep++;
        showStep(currentStep);
    }
}

document.getElementById("multiStepForm").addEventListener("submit", function (e) {
    e.preventDefault();

    // Ẩn form và hiển thị thông báo thành công
    this.style.display = "none";
    document.querySelector(".success-message").style.display = "block";
});
function prevStep() {
    const steps = document.querySelectorAll(".form-step");
    if (currentStep > 0) {
        currentStep--;
        showStep(currentStep);
    }
}
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

    if (allValid) {
        this.style.display = "none";
        document.querySelector(".success-message").innerHTML = "<h3>✅ Đặt giữ chỗ thành công!</h3>";
        document.querySelector(".success-message").style.display = "block";
    } else {
        document.querySelector(".success-message").innerHTML = "<h3 style='color: red;'>❌ Không thành công do thông tin bạn nhập không chính xác hoặc bị bỏ trống.</h3>";
        document.querySelector(".success-message").style.display = "block";
    }
});
