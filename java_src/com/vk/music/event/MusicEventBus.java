package com.vk.music.event;

import android.support.annotation.NonNull;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class MusicEventBus {
    private static final Map<Class<? extends Event>, List<Subscriber<? extends Event>>> subscribersMap = new HashMap();

    public static <T extends Event> void subscribe(@NonNull Class<T> eventType, @NonNull Subscriber<T> subscriber) {
        List<Subscriber<? extends Event>> subscribers = subscribersMap.get(eventType);
        if (subscribers == null) {
            subscribers = new LinkedList<>();
            subscribersMap.put(eventType, subscribers);
        }
        subscribers.add(subscriber);
    }

    public static <T extends Event> void unsubscribe(@NonNull Class<T> eventType, @NonNull Subscriber<T> subscriber) {
        List<Subscriber<? extends Event>> subscribers = subscribersMap.get(eventType);
        if (subscribers != null) {
            subscribers.remove(subscriber);
            if (subscribers.isEmpty()) {
                subscribersMap.remove(eventType);
            }
        }
    }

    public static <T extends Event> void post(@NonNull T event) {
        List<Subscriber<? extends Event>> subscribers = subscribersMap.get(event.getClass());
        if (subscribers != null) {
            for (Subscriber subscriber : subscribers) {
                subscriber.onEvent(event);
            }
        }
    }
}
