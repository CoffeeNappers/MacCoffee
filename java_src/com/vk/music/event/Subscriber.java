package com.vk.music.event;

import com.vk.music.event.Event;
/* loaded from: classes2.dex */
public interface Subscriber<T extends Event> {
    void onEvent(T t);
}
