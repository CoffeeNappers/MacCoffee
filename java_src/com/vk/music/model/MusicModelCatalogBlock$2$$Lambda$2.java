package com.vk.music.model;

import com.vk.music.dto.Section;
import com.vk.music.model.MusicModel;
import com.vk.music.model.MusicModelCatalogBlock;
import com.vk.music.model.ObservableModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicModelCatalogBlock$2$$Lambda$2 implements ObservableModel.Notification {
    private final MusicModelCatalogBlock.AnonymousClass2 arg$1;
    private final Section arg$2;

    private MusicModelCatalogBlock$2$$Lambda$2(MusicModelCatalogBlock.AnonymousClass2 anonymousClass2, Section section) {
        this.arg$1 = anonymousClass2;
        this.arg$2 = section;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicModelCatalogBlock.AnonymousClass2 anonymousClass2, Section section) {
        return new MusicModelCatalogBlock$2$$Lambda$2(anonymousClass2, section);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, (MusicModel.Callback) obj);
    }
}
