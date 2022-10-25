package com.vk.music.model;

import com.vk.music.model.MusicModel;
import com.vk.music.model.MusicModelCatalogBlock;
import com.vk.music.model.ObservableModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicModelCatalogBlock$2$$Lambda$1 implements ObservableModel.Notification {
    private final MusicModelCatalogBlock.AnonymousClass2 arg$1;

    private MusicModelCatalogBlock$2$$Lambda$1(MusicModelCatalogBlock.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicModelCatalogBlock.AnonymousClass2 anonymousClass2) {
        return new MusicModelCatalogBlock$2$$Lambda$1(anonymousClass2);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((MusicModel.Callback) obj);
    }
}
