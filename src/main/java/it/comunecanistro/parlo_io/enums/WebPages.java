package it.comunecanistro.parlo_io.enums;

import lombok.Getter;

@Getter
public enum WebPages {

    LOGIN("login", 0),
    PASSWORD_RECOVERY("password-recovery", 6),
    PASSWORD_RECOVERY_2("password-recovery-renewal", 11),
    EMAIL_SETTINGS("email-settings", 12),
    HOMEPAGE("homepage", 1),
    USERS("users", 2),
    NEW_USERS("new-user", 5),
    WEATHER_WARNINGS("weather-warnings", 3),
    IO_SETTING("io-settings", 4),
    TELEGRAM("telegram-view", 8),
    TELEGRAM_SETTING("telegram-settings", 7),
    OPERATORS("operators", 9),
    NEW_OPERATOR("new-operator", 10);

    private final String webpage;
    private final int index;

    WebPages(String webpage, int index) {
        this.webpage = webpage;
        this.index = index;
    }

}
