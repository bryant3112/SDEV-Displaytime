package chapter38;

import java.util.Locale;
import java.util.TimeZone;

public class TimeBean {

    public String[] getAllLocale() {
        Locale[] locales = Locale.getAvailableLocales();
        String[] localeNames = new String[locales.length];
        for (int i = 0; i < locales.length; i++) {
            localeNames[i] = locales[i].toString();
        }
        return localeNames;
    }

    public String[] getAllTimeZone() {
        String[] timeZones = TimeZone.getAvailableIDs();
        return timeZones;
    }
}