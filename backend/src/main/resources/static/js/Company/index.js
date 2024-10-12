import Highcharts from 'highcharts';
/*<![CDATA[*/
var weeklyStatistics = /*[[${weeklyStatistics}]]*/ 'default';
var monthlyStatistics = /*[[${monthlyStatistics}]]*/ 'default';
var yearlyStatistics = /*[[${yearlyStatistics}]]*/ 'default';
/*]]>*/

Highcharts.chart('myChart', {
    chart: {
        type: 'line'
    },
    title: {
        text: 'Number of Applicants'
    },
    xAxis: {
        categories: Object.keys(weeklyStatistics)
    },
    yAxis: {
        title: {
            text: 'Number of Applicants'
        }
    },
    series: [{
        name: 'Applicants',
        data: Object.values(weeklyStatistics)
    }]
});