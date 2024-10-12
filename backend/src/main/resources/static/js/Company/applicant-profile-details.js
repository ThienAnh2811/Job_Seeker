window.onload = function() {
    var downloadBtn = document.getElementById('downloadBtn');
    if(downloadBtn) {
        downloadBtn.addEventListener('click', function() {
            window.scrollTo(0,0); // Scroll to the top of the page

            var element = document.querySelector('.parent-div');

            if(element) {
                html2canvas(element, {scrollY: -window.scrollY, scrollX: -window.scrollX}).then(function(canvas) {
                    var imgData = canvas.toDataURL('image/png');

                    var pdf = new jsPDF('l', 'mm', [823, 1744]);

                    pdf.addImage(imgData, 'PNG', 0, 0, 823, 1744);

                    pdf.save("download.pdf");

                    window.scrollTo(0, document.body.scrollHeight || document.documentElement.scrollHeight); // Scroll to the bottom of the page
                });
            } else {
                console.error('.parent-div element could not be found.');
            }
        });
    } else {
        console.error('downloadBtn element could not be found.');
    }
};