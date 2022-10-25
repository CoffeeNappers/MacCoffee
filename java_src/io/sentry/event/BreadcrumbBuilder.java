package io.sentry.event;

import io.sentry.event.Breadcrumb;
import java.util.Date;
import java.util.Map;
/* loaded from: classes3.dex */
public class BreadcrumbBuilder {
    private String category;
    private Map<String, String> data;
    private Breadcrumb.Level level;
    private String message;
    private Date timestamp;
    private Breadcrumb.Type type;

    public BreadcrumbBuilder setType(Breadcrumb.Type newType) {
        this.type = newType;
        return this;
    }

    public BreadcrumbBuilder setTimestamp(Date newTimestamp) {
        this.timestamp = new Date(newTimestamp.getTime());
        return this;
    }

    public BreadcrumbBuilder setLevel(Breadcrumb.Level newLevel) {
        this.level = newLevel;
        return this;
    }

    public BreadcrumbBuilder setMessage(String newMessage) {
        this.message = newMessage;
        return this;
    }

    public BreadcrumbBuilder setCategory(String newCategory) {
        this.category = newCategory;
        return this;
    }

    public BreadcrumbBuilder setData(Map<String, String> newData) {
        this.data = newData;
        return this;
    }

    public Breadcrumb build() {
        return new Breadcrumb(this.type, this.timestamp, this.level, this.message, this.category, this.data);
    }
}
