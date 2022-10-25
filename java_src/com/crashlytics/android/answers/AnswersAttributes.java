package com.crashlytics.android.answers;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONObject;
/* loaded from: classes.dex */
class AnswersAttributes {
    final Map<String, Object> attributes = new ConcurrentHashMap();
    final AnswersEventValidator validator;

    public AnswersAttributes(AnswersEventValidator validator) {
        this.validator = validator;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void put(String key, String value) {
        if (!this.validator.isNull(key, "key") && !this.validator.isNull(value, "value")) {
            putAttribute(this.validator.limitStringLength(key), this.validator.limitStringLength(value));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void put(String key, Number value) {
        if (!this.validator.isNull(key, "key") && !this.validator.isNull(value, "value")) {
            putAttribute(this.validator.limitStringLength(key), value);
        }
    }

    void putAttribute(String key, Object value) {
        if (!this.validator.isFullMap(this.attributes, key)) {
            this.attributes.put(key, value);
        }
    }

    public String toString() {
        return new JSONObject(this.attributes).toString();
    }
}
