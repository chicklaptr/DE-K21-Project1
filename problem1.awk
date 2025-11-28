BEGIN{
    FS="\\";
    OFS="\\";
}

function sol1(col16){ 
    split(col16,d,"/")
    month=d[1]
    day=d[2]
    year=d[3]
    year_sua = (year < 50 ?"20" year:"19" year)
    return year_sua "/" month "/" day
}

{
    $4 = sol1($4)
    print $0;
}


