package utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class StringExtention {

    private static Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
    private static SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

    public static String GetCurrentDate() {
        String time = formatter.format(cld.getTime());
        return time;
    }

    public static String ConverDateToString(Date date) {
        String time = formatter.format(date);
        return time;
    }

}
