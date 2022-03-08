package it.comunecanistro.parlo_io.configurations;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class Utils {

    private static final List<String> SUPPORTED_TYPE = List.of("text/csv", "application/csv", "text/x-comma-separated-values", "text/comma-separated-values", "application/vnd.ms-excel");

    private static boolean hasCSVFormat(MultipartFile file) {
        return SUPPORTED_TYPE.contains(file.getContentType());
    }

    public static boolean checkFormat(MultipartFile file) {
        return file != null && hasCSVFormat(file);
    }

}
