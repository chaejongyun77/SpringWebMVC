package org.fullstack4.springmvc.controller.formatter;


import org.springframework.format.Formatter;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class LocalDateFormatter implements Formatter<LocalDate>   {
    @Override
    //string을 날짜타입으로 변환
    public LocalDate parse(String text, Locale locale) throws ParseException {
        return LocalDate.parse(text.trim(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    //날짜타입을 string으로 변환
    @Override
    public String print(LocalDate object, Locale locale) {
        return DateTimeFormatter.ofPattern("yyyy-MM-dd").format(object);
    }
}
