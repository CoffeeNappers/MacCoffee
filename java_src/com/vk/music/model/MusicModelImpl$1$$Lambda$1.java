package com.vk.music.model;

import com.vk.music.model.MusicModel;
import com.vk.music.model.MusicModelImpl;
import com.vk.music.model.ObservableModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicModelImpl$1$$Lambda$1 implements ObservableModel.Notification {
    private final MusicModelImpl.AnonymousClass1 arg$1;

    private MusicModelImpl$1$$Lambda$1(MusicModelImpl.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicModelImpl.AnonymousClass1 anonymousClass1) {
        return new MusicModelImpl$1$$Lambda$1(anonymousClass1);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((MusicModel.Callback) obj);
    }
}
