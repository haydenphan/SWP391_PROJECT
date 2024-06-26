package utils;

import java.math.RoundingMode;
import java.text.DecimalFormat;

public class NumberUtils {
    public static double round(double value, int places) {
        if (places < 0) throw new IllegalArgumentException();

        StringBuilder pattern = new StringBuilder("#.");
        for (int i = 0; i < places; i++) {
            pattern.append("#");
        }

        DecimalFormat df = new DecimalFormat(pattern.toString());
        df.setRoundingMode(RoundingMode.HALF_UP);
        return Double.parseDouble(df.format(value));
    }

    public static void main(String[] args) {
        double value = 3.899;
        int places = 2;
        double roundedValue = round(value, places);
        System.out.println("Rounded value: " + roundedValue); // Output: 3.14
    }
}