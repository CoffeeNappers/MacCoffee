package io.sentry.event;

import com.facebook.common.util.UriUtil;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import java.io.Serializable;
import java.util.Date;
import java.util.Map;
/* loaded from: classes3.dex */
public class Breadcrumb implements Serializable {
    private final String category;
    private final Map<String, String> data;
    private final Level level;
    private final String message;
    private final Date timestamp;
    private final Type type;

    /* loaded from: classes3.dex */
    public enum Level {
        DEBUG("debug"),
        INFO(UserNotification.LAYOUT_NEWSFEED_INFO),
        WARNING("warning"),
        ERROR("error"),
        CRITICAL("critical");
        
        private final String value;

        Level(String value) {
            this.value = value;
        }

        public String getValue() {
            return this.value;
        }
    }

    /* loaded from: classes3.dex */
    public enum Type {
        DEFAULT("default"),
        HTTP(UriUtil.HTTP_SCHEME),
        NAVIGATION("navigation"),
        USER(ProfileGiftsFragment.Extra.User);
        
        private final String value;

        Type(String value) {
            this.value = value;
        }

        public String getValue() {
            return this.value;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Breadcrumb(Type type, Date timestamp, Level level, String message, String category, Map<String, String> data) {
        timestamp = timestamp == null ? new Date() : timestamp;
        if (message == null && (data == null || data.size() < 1)) {
            throw new IllegalArgumentException("one of 'message' or 'data' must be set");
        }
        this.type = type;
        this.timestamp = timestamp;
        this.level = level;
        this.message = message;
        this.category = category;
        this.data = data;
    }

    public Type getType() {
        return this.type;
    }

    public Date getTimestamp() {
        return this.timestamp;
    }

    public Level getLevel() {
        return this.level;
    }

    public String getMessage() {
        return this.message;
    }

    public String getCategory() {
        return this.category;
    }

    public Map<String, String> getData() {
        return this.data;
    }
}
