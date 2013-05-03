package com.xuyuan.spring3.recipes.beanconfig.t5;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * prefix generation could be customized with some kind of programming logic
 * One prefix generation strategy is to use a particular pattern to format the current system date.
 */
public class DatePrefixGenerator implements PrefixGenerator {

    /**
	 * @uml.property  name="formatter"
	 */
    private DateFormat formatter;

    public void setPattern(String pattern) {
        this.formatter = new SimpleDateFormat(pattern);
    }

    public String getPrefix() {
        return formatter.format(new Date());
    }
}
