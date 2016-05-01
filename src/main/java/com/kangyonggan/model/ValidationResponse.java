package com.kangyonggan.model;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
public class ValidationResponse {

    private String status;
    private String errorMessage;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
