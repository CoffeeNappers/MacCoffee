package com.vk.attachpicker.events;

import android.os.Handler;
import android.os.Looper;
import com.vkontakte.android.utils.L;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes2.dex */
public class NotificationCenter {
    private static final String KEY_DELIMITER = "-";
    public static final int NO_ID = Integer.MIN_VALUE;
    private static final String TAG = "NotificationCenter";
    private static volatile NotificationCenter instance;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Object fireRemoveSyncObject = new Object();
    private final ExecutorService backgroundFireExecutor = Executors.newSingleThreadExecutor();
    private final Set<OnNotificationListenerContainer> listeners = Collections.newSetFromMap(new ConcurrentHashMap());

    public static NotificationCenter getInstance() {
        if (instance == null) {
            synchronized (NotificationCenter.class) {
                if (instance == null) {
                    instance = new NotificationCenter();
                }
            }
        }
        return instance;
    }

    public void addListener(int eventType, int eventId, NotificationListener notificationListener) {
        if (notificationListener != null) {
            this.listeners.add(new OnNotificationListenerContainer(eventType, eventId, notificationListener, isUiThread()));
        }
    }

    public void addListener(int eventType, NotificationListener notificationListener) {
        addListener(eventType, Integer.MIN_VALUE, notificationListener);
    }

    public void removeListener(NotificationListener notificationListener) {
        Iterator<OnNotificationListenerContainer> it = this.listeners.iterator();
        while (it.hasNext()) {
            OnNotificationListenerContainer listenerContainer = it.next();
            if (listenerContainer == null) {
                it.remove();
            } else if (listenerContainer.listener == notificationListener) {
                synchronized (this.fireRemoveSyncObject) {
                    it.remove();
                    listenerContainer.setDeleted(true);
                }
            } else {
                continue;
            }
        }
    }

    public <T> void fireEvent(final int eventType, final int eventId, final T arg) {
        Iterator<OnNotificationListenerContainer> it = this.listeners.iterator();
        boolean isUiThread = isUiThread();
        while (it.hasNext()) {
            final OnNotificationListenerContainer listenerContainer = it.next();
            if (listenerContainer == null) {
                it.remove();
            } else if (listenerContainer.eventType == eventType && listenerContainer.eventId == eventId) {
                synchronized (this.fireRemoveSyncObject) {
                    if (!listenerContainer.isDeleted()) {
                        if (isUiThread && listenerContainer.wasAddedInUIThread) {
                            try {
                                listenerContainer.listener.onNotification(eventType, eventId, arg);
                            } catch (Exception e) {
                            }
                        } else {
                            Runnable fireEvent = new Runnable() { // from class: com.vk.attachpicker.events.NotificationCenter.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    synchronized (NotificationCenter.this.fireRemoveSyncObject) {
                                        if (!listenerContainer.isDeleted()) {
                                            try {
                                                listenerContainer.listener.onNotification(eventType, eventId, arg);
                                            } catch (Exception e2) {
                                            }
                                        }
                                    }
                                }
                            };
                            if (listenerContainer.wasAddedInUIThread) {
                                this.handler.post(fireEvent);
                            } else {
                                this.backgroundFireExecutor.submit(fireEvent);
                            }
                        }
                    }
                }
            }
        }
    }

    public void fireEvent(int eventType, int eventId) {
        fireEvent(eventType, eventId, null);
    }

    public <T> void fireEvent(int eventType, T obj) {
        fireEvent(eventType, Integer.MIN_VALUE, obj);
    }

    public void fireEvent(int eventType) {
        fireEvent(eventType, Integer.MIN_VALUE, null);
    }

    private String getKeyForEvent(int eventType, int eventId) {
        return eventType + KEY_DELIMITER + eventId;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class OnNotificationListenerContainer {
        volatile boolean deleted;
        int eventId;
        int eventType;
        NotificationListener listener;
        boolean wasAddedInUIThread;

        private OnNotificationListenerContainer(int eventType, int eventId, NotificationListener listener, boolean wasAddedInUIThread) {
            this.deleted = false;
            this.eventType = eventType;
            this.eventId = eventId;
            this.listener = listener;
            this.wasAddedInUIThread = wasAddedInUIThread;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            OnNotificationListenerContainer that = (OnNotificationListenerContainer) o;
            return this.eventId == that.eventId && this.eventType == that.eventType && this.listener.equals(that.listener);
        }

        public int hashCode() {
            int result = this.eventType;
            return (((result * 31) + this.eventId) * 31) + this.listener.hashCode();
        }

        public String toString() {
            return "OnNotificationListenerContainer{eventType=" + this.eventType + ", eventId=" + this.eventId + ", listener=" + this.listener + '}';
        }

        public boolean isDeleted() {
            return this.deleted;
        }

        public void setDeleted(boolean deleted) {
            this.deleted = deleted;
        }
    }

    public void printCurrentListeners() {
        synchronized (this.fireRemoveSyncObject) {
            L.d(TAG, "---------------------------------------");
            Iterator<OnNotificationListenerContainer> it = this.listeners.iterator();
            while (it.hasNext()) {
                OnNotificationListenerContainer listenerContainer = it.next();
                if (listenerContainer != null) {
                    L.d(TAG, this.listeners.toString());
                } else {
                    L.d(TAG, "Empty WeakReference, removing");
                    it.remove();
                }
            }
            L.d(TAG, "---------------------------------------");
        }
    }

    private static boolean isUiThread() {
        return Looper.getMainLooper().getThread() == Thread.currentThread();
    }
}
