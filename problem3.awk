BEGIN {
    FS="\\";
    min = 1/0;
    max = -1/0;
}
function sol3(col) {
    col = col + 0
    if(col > max) max = col
    if(col < min) min = col
}
NR > 1 {
    sol3($3) 
}
END {
    printf("Max doanh thu: %.0f\n", max)
    printf("Min doanh thu: %.0f\n", min)
}

