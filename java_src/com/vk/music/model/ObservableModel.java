package com.vk.music.model;

import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes.dex */
public abstract class ObservableModel<Observer> implements ActiveModel {
    private Handler handler = new Handler(Looper.getMainLooper());
    private List<Observer> observers;

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public interface Notification<T> {
        void accept(T t);
    }

    public void subscribe(@NonNull Observer observer) {
        if (this.observers == null) {
            this.observers = new LinkedList();
        }
        this.observers.add(observer);
    }

    public void unsubscribe(@NonNull Observer observer) {
        if (this.observers != null) {
            this.observers.remove(observer);
        }
    }

    @Override // com.vk.music.model.ActiveModel
    public void clearCallbacks() {
        if (this.observers != null) {
            this.observers.clear();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void notifyObservers(@NonNull Notification<Observer> notification) {
        if (this.observers != null) {
            this.handler.post(ObservableModel$$Lambda$1.lambdaFactory$(this, notification));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$notifyObservers$0(@NonNull Notification notification) {
        for (Observer observer : this.observers) {
            notification.accept(observer);
        }
    }
}
