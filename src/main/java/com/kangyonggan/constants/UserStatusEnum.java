package com.kangyonggan.constants;

/**
 * @author kangyonggan
 * @since 16/4/30
 */
public enum UserStatusEnum {
    LOCK("lock", "已锁定"),
    UNLOCK("unlock", "未锁定");

    private final String status;
    private final String value;

    private UserStatusEnum(String status, String value) {
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
