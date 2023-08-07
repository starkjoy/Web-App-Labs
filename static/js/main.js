document.addEventListener("DOMContentLoaded", function() {
    const nameInput = document.getElementById("name-input");
    const nameDisplay = document.querySelector(".name");

    nameInput.addEventListener("keyup", function(event) {
        if (event.key === "Enter") {
            nameDisplay.textContent = nameInput.value;
        }
    });
});
