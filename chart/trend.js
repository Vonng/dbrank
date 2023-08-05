var rawData = [{"lps": 10, "use": 18.5, "love": 55, "name": "mongo", "want": 20.8, "year": 2017}, {"lps": 8.4, "use": 34.1, "love": 54.2, "name": "mssql", "want": 4.6, "year": 2017}, {"lps": -0.8, "use": 43.9, "love": 49.6, "name": "mysql", "want": 8.5, "year": 2017}, {"lps": -26.2, "use": 14, "love": 36.9, "name": "oracle", "want": 3.8, "year": 2017}, {"lps": 21.6, "use": 23.3, "love": 60.8, "name": "pgsql", "want": 11.5, "year": 2017}, {"lps": 29.6, "use": 13.6, "love": 64.8, "name": "redis", "want": 10.6, "year": 2017}, {"lps": -5.6, "use": 21.6, "love": 47.2, "name": "sqlite", "want": 7.2, "year": 2017}, {"lps": 10.2, "use": 26.4, "love": 55.1, "name": "mongo", "want": 18.6, "year": 2018}, {"lps": 3.2, "use": 41.6, "love": 51.6, "name": "mssql", "want": 4.2, "year": 2018}, {"lps": -2.6, "use": 58.6, "love": 48.7, "name": "mysql", "want": 7.5, "year": 2018}, {"lps": -26.2, "use": 11.1, "love": 36.9, "name": "oracle", "want": 2.3, "year": 2018}, {"lps": 24, "use": 33.3, "love": 62, "name": "pgsql", "want": 11.4, "year": 2018}, {"lps": 29.0, "use": 18.5, "love": 64.5, "name": "redis", "want": 9.7, "year": 2018}, {"lps": -3.8, "use": 19.7, "love": 48.1, "name": "sqlite", "want": 3.3, "year": 2018}, {"lps": 19.0, "use": 26, "love": 59.5, "name": "mongo", "want": 17.8, "year": 2019}, {"lps": 15.0, "use": 34.4, "love": 57.5, "name": "mssql", "want": 3.3, "year": 2019}, {"lps": 7.8, "use": 52, "love": 53.9, "name": "mysql", "want": 8.2, "year": 2019}, {"lps": -23.6, "use": 16.4, "love": 38.2, "name": "oracle", "want": 3.4, "year": 2019}, {"lps": 39.2, "use": 36.3, "love": 69.6, "name": "pgsql", "want": 13.6, "year": 2019}, {"lps": 42.6, "use": 20.6, "love": 71.3, "name": "redis", "want": 10.7, "year": 2019}, {"lps": 11.2, "use": 30.9, "love": 55.6, "name": "sqlite", "want": 7.2, "year": 2019}, {"lps": 12, "use": 26.7, "love": 56, "name": "mongo", "want": 19.4, "year": 2020}, {"lps": 1.8, "use": 34.8, "love": 50.9, "name": "mssql", "want": 3.7, "year": 2020}, {"lps": -5.8, "use": 53.5, "love": 47.1, "name": "mysql", "want": 9, "year": 2020}, {"lps": -33.6, "use": 16.3, "love": 33.2, "name": "oracle", "want": 4.2, "year": 2020}, {"lps": 27.8, "use": 38.5, "love": 63.9, "name": "pgsql", "want": 15.6, "year": 2020}, {"lps": 33.0, "use": 20.5, "love": 66.5, "name": "redis", "want": 12.2, "year": 2020}, {"lps": -1.2, "use": 30.6, "love": 49.4, "name": "sqlite", "want": 7.7, "year": 2020}, {"lps": 20.56, "use": 28.03, "love": 60.28, "name": "mongo", "want": 17.86, "year": 2021}, {"lps": 8.16, "use": 29.43, "love": 54.08, "name": "mssql", "want": 3.11, "year": 2021}, {"lps": 2.70, "use": 48.19, "love": 51.35, "name": "mysql", "want": 9.76, "year": 2021}, {"lps": -29.64, "use": 12.89, "love": 35.18, "name": "oracle", "want": 2.8, "year": 2021}, {"lps": 40.8, "use": 44.08, "love": 70.4, "name": "pgsql", "want": 17.99, "year": 2021}, {"lps": 41.42, "use": 24.51, "love": 70.71, "name": "redis", "want": 12.58, "year": 2021}, {"lps": 8.86, "use": 30.86, "love": 54.43, "name": "sqlite", "want": 7.74, "year": 2021}, {"lps": 21.02, "use": 28.29, "love": 60.51, "name": "mongo", "want": 17.26, "year": 2022}, {"lps": 9.90, "use": 28.77, "love": 54.95, "name": "mssql", "want": 2.62, "year": 2022}, {"lps": 2.34, "use": 45.68, "love": 51.17, "name": "mysql", "want": 7.99, "year": 2022}, {"lps": -29.34, "use": 11.79, "love": 35.33, "name": "oracle", "want": 2.24, "year": 2022}, {"lps": 44.16, "use": 46.48, "love": 72.08, "name": "pgsql", "want": 19.05, "year": 2022}, {"lps": 42.08, "use": 24.97, "love": 71.04, "name": "redis", "want": 14.3, "year": 2022}, {"lps": 15.02, "use": 30.83, "love": 57.51, "name": "sqlite", "want": 8.18, "year": 2022}]


data = {
    counties: ['pgsql', 'mysql', 'sqlite', 'mssql', 'mongo', 'redis', 'maria', 'es', 'oracle', 'dynamo'],
    timeline: [2017, 2018, 2019, 2020, 2021, 2022],
    series: [[[23.3, 60.8, "pgsql", 11.5, 2017], [43.9, 49.6, "mysql", 8.5, 2017], [21.6, 47.2, "sqlite", 7.2, 2017], [34.1, 54.2, "mssql", 4.6, 2017], [18.5, 55, "mongo", 20.8, 2017], [13.6, 64.8, "redis", 10.6, 2017], [0, 0, "es", null, 2017], [14, 36.9, "oracle", 8.5, 2017], [0, 0, "dynamo", 8.5, 2017], [0, 0, "dynamo", 8.5, 2017]], [[33.3, 62, "pgsql", 11.4, 2018], [58.6, 48.7, "mysql", 7.5, 2018], [19.7, 48.1, "sqlite", 3.3, 2018], [41.6, 51.6, "mssql", 4.2, 2018], [26.4, 55.1, "mongo", 18.6, 2018], [18.5, 64.5, "redis", 9.7, 2018], [14.4, 59.9, "es", 12.2, 2018], [11.1, 36.9, "oracle", 7.5, 2018], [5.3, 50.9, "dynamo", 7.5, 2018], [5.3, 50.9, "dynamo", 7.5, 2018]], [[36.3, 69.6, "pgsql", 13.6, 2019], [52, 53.9, "mysql", 8.2, 2019], [30.9, 55.6, "sqlite", 7.2, 2019], [34.4, 57.5, "mssql", 3.3, 2019], [26, 59.5, "mongo", 17.8, 2019], [20.6, 71.3, "redis", 10.7, 2019], [15.9, 63.6, "es", 11.1, 2019], [16.4, 38.2, "oracle", 8.2, 2019], [6.8, 54.7, "dynamo", 8.2, 2019], [6.8, 54.7, "dynamo", 8.2, 2019]], [[38.5, 63.9, "pgsql", 15.6, 2020], [53.5, 47.1, "mysql", 9, 2020], [30.6, 49.4, "sqlite", 7.7, 2020], [34.8, 50.9, "mssql", 3.7, 2020], [26.7, 56, "mongo", 19.4, 2020], [20.5, 66.5, "redis", 12.2, 2020], [15.5, 58.7, "es", 12.2, 2020], [16.3, 33.2, "oracle", 9, 2020], [7.8, 50.7, "dynamo", 9, 2020], [7.8, 50.7, "dynamo", 9, 2020]], [[44.08, 70.4, "pgsql", 17.99, 2021], [48.19, 51.35, "mysql", 9.76, 2021], [30.86, 54.43, "sqlite", 7.74, 2021], [29.43, 54.08, "mssql", 3.11, 2021], [28.03, 60.28, "mongo", 17.86, 2021], [24.51, 70.71, "redis", 12.58, 2021], [15.72, 56.7, "es", 10.52, 2021], [12.89, 35.18, "oracle", 9.76, 2021], [8.7, 55.29, "dynamo", 9.76, 2021], [8.7, 55.29, "dynamo", 9.76, 2021]], [[46.48, 72.08, "pgsql", 19.05, 2022], [45.68, 51.17, "mysql", 7.99, 2022], [30.83, 57.51, "sqlite", 8.18, 2022], [28.77, 54.95, "mssql", 2.62, 2022], [28.29, 60.51, "mongo", 17.26, 2022], [24.97, 71.04, "redis", 14.3, 2022], [13.9, 55.92, "es", 8.29, 2022], [11.79, 35.33, "oracle", 7.99, 2022], [9.42, 53.63, "dynamo", 7.99, 2022], [9.42, 53.63, "dynamo", 7.99, 2022]]]
};


colors = ['#4F668A', '#C48E40', '#83BCE4', '#D6D9D2', '#679443', '#C73D2D', '#AD735A', '#64B1A7', '#C6352F', '#5D8BC0'];

routes = {
    "pgsql": {
        symbolSize: 12,
        symbol: 'rect',
        showAllSymbol: true,
        type: 'line',
        lineStyle: { color: colors[0] + '44' },
        itemStyle: {},
        showSymbol: true,
        data: [[23.3, 60.8], [33.3, 62], [36.3, 69.6], [38.5, 63.9], [44.08, 70.4], [46.48, 72.08]]
    },

    "mysql": {
        symbolSize: 20,
        symbol: 'circle',
        type: 'line',
        lineStyle: { color: colors[1] + '44' },
        data: [[43.9, 49.6], [58.6, 48.7], [52, 53.9], [53.5, 47.1], [48.19, 51.35], [45.68, 51.17]]
    }

}



var itemStyle = {
    opacity: 0.8
};
var sizeFunction = function (x) {
    return Math.sqrt(x) * 16 + 1;
};
// Schema:
var schema = [{ name: '使用率', index: 0, text: '使用率', unit: '%' }, {
    name: '喜爱度', index: 1, text: '喜爱度', unit: '%'
}, { name: '数据库', index: 2, text: '数据库', unit: '' }, { name: '需求度', index: 3, text: '需求度', unit: '' }];


option = {
    baseOption: {
        timeline: {
            axisType: 'category',
            orient: 'vertical',
            autoPlay: true,
            inverse: true,
            playInterval: 1200,
            left: null,
            right: 0,
            top: 100,
            bottom: 100,
            width: 60,
            height: null,
            symbol: 'none',
            checkpointStyle: {
                borderWidth: 2
            },
            controlStyle: {
                showNextBtn: false, showPrevBtn: false
            },
            data: []
        }, title: [{
            text: data.timeline[0], textAlign: 'center', left: '63%', top: '55%', textStyle: {
                fontSize: 100
            }
        }, { text: 'StackOverflow 2017-2022 数据库流行度/喜爱度趋势', left: 'center', top: 10, textStyle: { fontWeight: 'normal', fontSize: 20 } }],
        tooltip: {
            padding: 5, borderWidth: 1, formatter: function (obj) {
                var value = obj.value;
                // prettier-ignore
                return schema[2].text + '：' + value[2] + '<br>' + schema[1].text + '：' + value[1] + schema[1].unit + '<br>' + schema[0].text + '：' + value[0] + schema[0].unit + '<br>'

            }
        }, grid: {
            top: 100, containLabel: true, left: 30, right: '110'
        }, xAxis: {
            name: '流行度', max: 60, min: 0, nameGap: 10,
            nameTextStyle: {
                fontSize: 18
            }, splitLine: {
                show: false
            }, axisLine: {
                show: true
            }, axisLabel: {
                formatter: '{value} %'
            }
        }, yAxis: {
            type: 'value', name: '喜爱度', max: 80, min: 0, nameTextStyle: {
                fontSize: 18
            }, splitLine: {
                show: false
            }, axisLabel: {
                formatter: '{value} %'
            }
        }, visualMap: [{
            show: false, dimension: 2, categories: data.counties, inRange: {
                color: (function () {
                    return colors.concat(colors);
                })()
            }
        }], series: [
            routes['pgsql'], routes['mysql'],

            {
                type: 'scatter', itemStyle: itemStyle, data: data.series[0], label: {
                    show: true, // offset: [35, -40],
                    offset: [0, 0], formatter: function (obj) {
                        var value = obj.value;
                        return value[2];
                    }
                }, symbolSize: function (val) {
                    return sizeFunction(val[0]);
                }
            }

        ], animationDurationUpdate: 1000, animationEasingUpdate: 'quinticInOut'
    }, options: []
};
for (var n = 0; n < data.timeline.length; n++) {
    option.baseOption.timeline.data.push(data.timeline[n]);
    option.options.push({
        title: {
            show: true,
            text: data.timeline[n] + ''
        }, series: [
            routes['pgsql'], routes['mysql'],
            {
                name: data.timeline[n],
                type: 'scatter',
                itemStyle: itemStyle,
                data: data.series[n],
                symbolSize: function (val) {
                    return sizeFunction(val[0]);
                }
            }]
    });
}

// return option;
// https://echarts.apache.org/examples/zh/editor.html?c=scatter-life-expectancy-timeline
// myChart.setOption(option);
