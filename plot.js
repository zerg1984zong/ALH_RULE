function plot(res,flag) {
    $(flag).highcharts({
        chart: {
            type: 'spline'
        },
        title: {
            text: 'ALH Rule Performance'
        },
        subtitle: {
            text: 'test'
        },
        xAxis: {
            categories: res.res_x
        },
        yAxis: {
            title: {
                text: res.res_n
            }            
        },
        tooltip: {
            crosshairs: false,
            shared: false
        },

        legend:{
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'top', 
          borderWidth: 0
        },

        plotOptions: {
            spline: {
                marker: {
                    radius: 4,
                    lineColor: '#666666',
                    lineWidth: 1
                }
            }
        },
        series: res.res_s
    });
}


