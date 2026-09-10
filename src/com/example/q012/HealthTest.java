package com.example.q012;

public final class HealthTest {
    public static void main(String[] args) {
        String body = App.healthPayload();
        if (!body.contains("quantum-key-lease") || !body.contains("ok")) {
            throw new AssertionError("健康响应异常: " + body);
        }
    }
}
