document.addEventListener("DOMContentLoaded", function() {
    fetch('/applicationStatusCounts')
        .then(response => response.json())
        .then(data => {
            // data is the object that contains the application status counts
            createPieChart(data);
        });
});
function createPieChart(data) {
    Highcharts.chart('myChart', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie',
            width: 200,
            height: 200,
            backgroundColor: 'white'
        },
        title: {
            text: 'Application Status Counts',
            style: {
                color: 'white' // set title text color to black
            }
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>',
            style: {
                color: 'white' // set tooltip text color to black
            }
        },
        accessibility: {
            point: {
                valueSuffix: '%'
            }
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: 'white' // set data labels text color to black
                    }
                }
            }
        },
        series: [{
            name: 'Applications',
            colorByPoint: true,
            data: Object.entries(data).map(([name, y]) => ({ name, y })),
            dataLabels: {
                color: 'white' // set series data labels text color to black
            }
        }]
    });
}