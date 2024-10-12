document.addEventListener('DOMContentLoaded', (event) => {
    var labelWrappers = document.querySelectorAll('.label-wrapper');
    labelWrappers.forEach(function(labelWrapper) {
        labelWrapper.addEventListener('click', function() {
            var appId = this.closest('.application-history').querySelector('input[name="applicationId"]').value;
            var modal = document.getElementById('myModal' + appId);
            var span = modal.querySelector('.close');
            var time = new Date(document.getElementById('interviewTime' + appId).value);
            var formattedTime = time.toLocaleDateString('en-GB', { day: '2-digit', month: '2-digit', year: 'numeric' }) + ' : ' + time.toLocaleTimeString();
            var status = this.querySelector('.caption294').innerText;
            if (status === 'Interview') {
                modal.querySelector('#displayInterviewTime' + appId).innerText = 'Interview Time: ' + formattedTime;
                modal.style.display = "block";
            }
        });
    });

    window.onclick = function(event) {
        var modals = document.querySelectorAll('.modal');
        modals.forEach(function(modal) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        });
    }
});