package com.vkontakte.android.audio.events;
/* loaded from: classes2.dex */
public abstract class StaticObservableEvent<Handler, Sender, Argument> extends ObservableEventBase<Handler, Sender, Argument> {
    @Override // com.vkontakte.android.audio.events.ObservableEventBase
    public void fire(Sender sender, Argument args) {
        super.fire(sender, args);
    }
}
