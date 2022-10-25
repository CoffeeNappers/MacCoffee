package android.support.v4.view.accessibility;

import android.os.Build;
import android.view.accessibility.AccessibilityEvent;
/* loaded from: classes.dex */
public final class AccessibilityEventCompat {
    public static final int CONTENT_CHANGE_TYPE_CONTENT_DESCRIPTION = 4;
    public static final int CONTENT_CHANGE_TYPE_SUBTREE = 1;
    public static final int CONTENT_CHANGE_TYPE_TEXT = 2;
    public static final int CONTENT_CHANGE_TYPE_UNDEFINED = 0;
    private static final AccessibilityEventVersionImpl IMPL;
    public static final int TYPES_ALL_MASK = -1;
    public static final int TYPE_ANNOUNCEMENT = 16384;
    public static final int TYPE_ASSIST_READING_CONTEXT = 16777216;
    public static final int TYPE_GESTURE_DETECTION_END = 524288;
    public static final int TYPE_GESTURE_DETECTION_START = 262144;
    public static final int TYPE_TOUCH_EXPLORATION_GESTURE_END = 1024;
    public static final int TYPE_TOUCH_EXPLORATION_GESTURE_START = 512;
    public static final int TYPE_TOUCH_INTERACTION_END = 2097152;
    public static final int TYPE_TOUCH_INTERACTION_START = 1048576;
    public static final int TYPE_VIEW_ACCESSIBILITY_FOCUSED = 32768;
    public static final int TYPE_VIEW_ACCESSIBILITY_FOCUS_CLEARED = 65536;
    public static final int TYPE_VIEW_CONTEXT_CLICKED = 8388608;
    public static final int TYPE_VIEW_HOVER_ENTER = 128;
    public static final int TYPE_VIEW_HOVER_EXIT = 256;
    public static final int TYPE_VIEW_SCROLLED = 4096;
    public static final int TYPE_VIEW_TEXT_SELECTION_CHANGED = 8192;
    public static final int TYPE_VIEW_TEXT_TRAVERSED_AT_MOVEMENT_GRANULARITY = 131072;
    public static final int TYPE_WINDOWS_CHANGED = 4194304;
    public static final int TYPE_WINDOW_CONTENT_CHANGED = 2048;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface AccessibilityEventVersionImpl {
        void appendRecord(AccessibilityEvent accessibilityEvent, Object obj);

        int getAction(AccessibilityEvent accessibilityEvent);

        int getContentChangeTypes(AccessibilityEvent accessibilityEvent);

        int getMovementGranularity(AccessibilityEvent accessibilityEvent);

        Object getRecord(AccessibilityEvent accessibilityEvent, int i);

        int getRecordCount(AccessibilityEvent accessibilityEvent);

        void setAction(AccessibilityEvent accessibilityEvent, int i);

        void setContentChangeTypes(AccessibilityEvent accessibilityEvent, int i);

        void setMovementGranularity(AccessibilityEvent accessibilityEvent, int i);
    }

    /* loaded from: classes.dex */
    static class AccessibilityEventStubImpl implements AccessibilityEventVersionImpl {
        AccessibilityEventStubImpl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public void appendRecord(AccessibilityEvent event, Object record) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public Object getRecord(AccessibilityEvent event, int index) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public void setContentChangeTypes(AccessibilityEvent event, int types) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public int getRecordCount(AccessibilityEvent event) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public int getContentChangeTypes(AccessibilityEvent event) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public void setMovementGranularity(AccessibilityEvent event, int granularity) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public int getMovementGranularity(AccessibilityEvent event) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public void setAction(AccessibilityEvent event, int action) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public int getAction(AccessibilityEvent event) {
            return 0;
        }
    }

    /* loaded from: classes.dex */
    static class AccessibilityEventIcsImpl extends AccessibilityEventStubImpl {
        AccessibilityEventIcsImpl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventStubImpl, android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public void appendRecord(AccessibilityEvent event, Object record) {
            AccessibilityEventCompatIcs.appendRecord(event, record);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventStubImpl, android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public Object getRecord(AccessibilityEvent event, int index) {
            return AccessibilityEventCompatIcs.getRecord(event, index);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventStubImpl, android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public int getRecordCount(AccessibilityEvent event) {
            return AccessibilityEventCompatIcs.getRecordCount(event);
        }
    }

    /* loaded from: classes.dex */
    static class AccessibilityEventJellyBeanImpl extends AccessibilityEventIcsImpl {
        AccessibilityEventJellyBeanImpl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventStubImpl, android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public void setMovementGranularity(AccessibilityEvent event, int granularity) {
            AccessibilityEventCompatJellyBean.setMovementGranularity(event, granularity);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventStubImpl, android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public int getMovementGranularity(AccessibilityEvent event) {
            return AccessibilityEventCompatJellyBean.getMovementGranularity(event);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventStubImpl, android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public void setAction(AccessibilityEvent event, int action) {
            AccessibilityEventCompatJellyBean.setAction(event, action);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventStubImpl, android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public int getAction(AccessibilityEvent event) {
            return AccessibilityEventCompatJellyBean.getAction(event);
        }
    }

    /* loaded from: classes.dex */
    static class AccessibilityEventKitKatImpl extends AccessibilityEventJellyBeanImpl {
        AccessibilityEventKitKatImpl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventStubImpl, android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public void setContentChangeTypes(AccessibilityEvent event, int types) {
            AccessibilityEventCompatKitKat.setContentChangeTypes(event, types);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventStubImpl, android.support.v4.view.accessibility.AccessibilityEventCompat.AccessibilityEventVersionImpl
        public int getContentChangeTypes(AccessibilityEvent event) {
            return AccessibilityEventCompatKitKat.getContentChangeTypes(event);
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 19) {
            IMPL = new AccessibilityEventKitKatImpl();
        } else if (Build.VERSION.SDK_INT >= 16) {
            IMPL = new AccessibilityEventJellyBeanImpl();
        } else if (Build.VERSION.SDK_INT >= 14) {
            IMPL = new AccessibilityEventIcsImpl();
        } else {
            IMPL = new AccessibilityEventStubImpl();
        }
    }

    private AccessibilityEventCompat() {
    }

    public static int getRecordCount(AccessibilityEvent event) {
        return IMPL.getRecordCount(event);
    }

    public static void appendRecord(AccessibilityEvent event, AccessibilityRecordCompat record) {
        IMPL.appendRecord(event, record.getImpl());
    }

    public static AccessibilityRecordCompat getRecord(AccessibilityEvent event, int index) {
        return new AccessibilityRecordCompat(IMPL.getRecord(event, index));
    }

    public static AccessibilityRecordCompat asRecord(AccessibilityEvent event) {
        return new AccessibilityRecordCompat(event);
    }

    public static void setContentChangeTypes(AccessibilityEvent event, int changeTypes) {
        IMPL.setContentChangeTypes(event, changeTypes);
    }

    public static int getContentChangeTypes(AccessibilityEvent event) {
        return IMPL.getContentChangeTypes(event);
    }

    public void setMovementGranularity(AccessibilityEvent event, int granularity) {
        IMPL.setMovementGranularity(event, granularity);
    }

    public int getMovementGranularity(AccessibilityEvent event) {
        return IMPL.getMovementGranularity(event);
    }

    public void setAction(AccessibilityEvent event, int action) {
        IMPL.setAction(event, action);
    }

    public int getAction(AccessibilityEvent event) {
        return IMPL.getAction(event);
    }
}
