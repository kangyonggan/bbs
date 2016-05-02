package com.kangyonggan.constants;

/**
 * @author kangyonggan
 * @since 16/4/30
 */
public enum PublishedStatusEnum {
    PUBLISHED("published", "已发布"),
    UNPUBLISHED("unpublished", "未发布"),
    TRASH("trash", "回收站");

    private final String status;
    private final String value;

    private PublishedStatusEnum(String status, String value) {
        this.status = status;
        this.value = value;
    }

    public String getStatus() {
        return this.status;
    }

    public String getValue() {
        return this.value;
    }
}
