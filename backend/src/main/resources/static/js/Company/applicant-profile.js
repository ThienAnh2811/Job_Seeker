document.addEventListener('DOMContentLoaded', (event) => {
    const statusSelect = document.getElementById("statusSelect");
    const interviewModal = document.getElementById("interviewModal");
    const saveButton = document.getElementById("saveButton");

    if (statusSelect && interviewModal && saveButton) {
        if (statusSelect.value === "Unsuitable" || statusSelect.value === "Accepted") {
            statusSelect.setAttribute('disabled', 'true');
            saveButton.setAttribute('disabled', 'true');  // Disable initially
        }

        statusSelect.addEventListener("change", (event) => {
            if (event.target.value === "Interview") {
                interviewModal.classList.add("show");
                saveButton.removeAttribute('disabled');
            } else {
                interviewModal.classList.remove("show");
                saveButton.setAttribute('disabled', 'true');
            }
        });

        saveButton.addEventListener("click", (event) => {
            if (statusSelect.value === "Unsuitable" || statusSelect.value === "Accepted") {
                event.preventDefault();
                return;
            }
            const interviewDate = document.getElementById("interviewDate").value;
            const interviewTime = document.getElementById("interviewTime").value;

            if (!interviewDate || !interviewTime) {
                alert("Please select both date and time.");
                return;
            }

            fetch('/updateStatus', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    'id' : parseInt(document.getElementsByName("id")[0].value),
                    'status': 'Interview', // Set the status to 'interviewed'
                    'interviewDate': interviewDate,
                    'interviewTime': interviewTime
                })
            })
                .then(response => response.text())
                .then(data => console.log(data))
                .catch((error) => {
                    console.error('Error:', error);
                });

            interviewModal.classList.remove("show");
        });
    } else {
        if (!saveButton) {
            console.error('saveButton element could not be found.');
        }
        console.error('One or more elements could not be found.');
    }
});
document.addEventListener('DOMContentLoaded', function() {
    var downloadBtn = document.getElementById('downloadBtn');
    if(downloadBtn) {
        downloadBtn.addEventListener('click', function() {
            window.scrollTo(0,0); // Scroll to the top of the page

            var element = document.querySelector('.binary-tree-leaf');  // Target the .binary-tree-leaf section

            if(element) {
                html2canvas(element, {scrollY: -window.scrollY, scrollX: -window.scrollX}).then(function(canvas) {
                    var imgData = canvas.toDataURL('image/png');

                    var pdf = new jsPDF('l', 'mm', 'a3', true);
                    pdf.addImage(imgData, 'PNG', 0, 0);

                    pdf.save("resume.pdf");
                });

                window.scrollTo(0, document.body.scrollHeight || document.documentElement.scrollHeight); // Scroll to the bottom of the page
            } else {
                console.error('.binary-tree-leaf element could not be found.');
            }
        });
    } else {
        console.error('downloadBtn element could not be found.');
    }
});