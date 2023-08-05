// Check https://db-engines.com/en/ranking_trend
// run `parse.js` in console to get the raw csv data
// please write data to data/db_engine.csv

var names = []; // { name: data}
var datas = []; // { name: data}
var n = dbe_data.length; // number of databases
var m = dbe_data[0]["data"].length // number of data points

for (i = 0; i < dbe_data.length; i++) {
    var name = dbe_data[i]["name"]
    var datapoint = dbe_data[i]["data"]
    names.push(name);
    datas.push(datapoint)
}

res = []
var header = ["Date/DB"]
for (i = 0; i < names.length; i++) {
    header.push(names[i])
}
res.push(header)

var dt = new Date(dbe_startdate);
for (j = 0; j < m; j++) {
    var ds = dt.toISOString().split('T')[0];
    var line = [ds]

    for (i = 0; i < names.length; i++) {
        line.push(datas[i][j])
    }
    res.push(line)
    dt.setMonth(dt.getMonth() + 1);
}

csv = []
m = res.length
n = res[0].length
for (i = 1; i < n; i++) { // column
    for (j = 1; j < m; j++) { // row
        csv.push([res[j][0], '"' + res[0][i] + '"', res[j][i]])
    }
}
copy(csv.join('\n'))