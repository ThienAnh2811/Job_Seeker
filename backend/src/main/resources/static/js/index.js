var datePosted = '03-10-2024'; // Replace 'default' with the actual initial value
var maxSalary = '1000000'; // Replace 'default' with the actual initial valuelet date = new Date();

function loadGraph(type, fromDate, toDate) {
    $.ajax({
        url : "/get-data?type=" + type + "&fromDate=" + fromDate + "&toDate=" + toDate,
        success : function(result) {
            var categories = Object.keys(result);
            var seriesData = [];

            categories.forEach(function(category) {
                console.log(typeof result[category]); // Add this line to check the type
                var data = result[category].map(function(post) {
                    return {
                        x: new Date(post.datePosted).getTime(), // Convert datePosted to timestamp
                        y: post.maxSalary
                    };
                });

                seriesData.push({
                    name: category,
                    data: data
                });
            });

            Highcharts.chart('container-bar', {
                        chart: {
                            type: 'column',
                            style: {
                                color: '#FFFFFF',
                                backgroundColor: '#202430',
                            },
                            height: 400,
                            width: 1000
                        },
                        title: {
                            text: 'Max Salary by Date Posted',
                            style: {
                                color: '#FFFFFF' // Set title color to white
                            }
                        },
                        xAxis: {
                            type: 'datetime',
                            title: {
                                text: 'Date Posted',
                                style: {
                                    color: '#FFFFFF' // Set x-axis title color to white
                                }
                            },
                            labels: {
                                style: {
                                    color: '#FFFFFF' // Set x-axis labels color to white
                                }
                            }
                        },
                        yAxis: {
                            title: {
                                text: 'Max Salary',
                                style: {
                                    color: '#FFFFFF' // Set y-axis title color to white
                                }
                            },
                            labels: {
                                style: {
                                    color: '#FFFFFF' // Set y-axis labels color to white
                                }
                            }
                        },
                        legend: {
                            itemStyle: {
                                color: '#FFFFFF' // Set legend text color to white
                            }
                        },
                        tooltip: {
                            style: {
                                color: '#FFFFFF' // Set tooltip text color to white
                            }
                        },
                        series: seriesData
            });
        }
    });
}

$(document).ready(function() {
    var defaultToDate = new Date();
    var defaultFromDate = new Date();
    defaultFromDate.setDate(defaultFromDate.getDate() - 90);
    var toDate = defaultToDate.toISOString().split('T')[0];
    var fromDate = defaultFromDate.toISOString().split('T')[0];

    $('#to-date').val(toDate);
    $('#from-date').val(fromDate);

    loadGraph('category', fromDate, toDate);

    $('#filter-button').click(function() {
        var type = $('#type-selector').val();
        var fromDate = $('#from-date').val();
        var toDate = $('#to-date').val();

        // If fromDate is not selected, set it as 10 days before the current date
        if (!fromDate) {
            var date = new Date();
            date.setDate(date.getDate() - 90);
            fromDate = date.toISOString().split('T')[0]; // Format date as 'yyyy-mm-dd'
        }

        loadGraph(type, fromDate, toDate);
    });
});