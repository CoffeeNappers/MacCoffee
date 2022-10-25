package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ObservableModel$$Lambda$1 implements Runnable {
    private final ObservableModel arg$1;
    private final ObservableModel.Notification arg$2;

    private ObservableModel$$Lambda$1(ObservableModel observableModel, ObservableModel.Notification notification) {
        this.arg$1 = observableModel;
        this.arg$2 = notification;
    }

    public static Runnable lambdaFactory$(ObservableModel observableModel, ObservableModel.Notification notification) {
        return new ObservableModel$$Lambda$1(observableModel, notification);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$notifyObservers$0(this.arg$2);
    }
}
