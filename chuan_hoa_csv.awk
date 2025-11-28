function join_lines(line,    c, i, in_var, out_var, state, record, buffer)
{
    in_var  = 0
    out_var = 1
    state   = out_var
    buffer  = ""

    for (i = 1; i <= length(line); i++) {
        c = substr(line, i, 1)

        # trạng thái OUT
        if (state == out_var) {
            if (c == "\"") {
                state = in_var
            }
            buffer = buffer c

        # trạng thái IN
        } else if (state == in_var) {
            if (c == "\"") {
                state = out_var
            }
            buffer = buffer c
        }
    }

    if (state == in_var) {
        buffer = buffer " "
        return ""
    } else {
        record = buffer
        buffer = ""
        return record
    }
}

{
	r=join_lines($0);
	if(r!="")
	print  r;
}





