package com.vk.music.model;

import com.vk.music.model.MusicModel;
import com.vk.music.model.MusicModelCatalogBlock;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicModelCatalogBlock$2$$Lambda$3 implements ObservableModel.Notification {
    private final MusicModelCatalogBlock.AnonymousClass2 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private MusicModelCatalogBlock$2$$Lambda$3(MusicModelCatalogBlock.AnonymousClass2 anonymousClass2, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass2;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicModelCatalogBlock.AnonymousClass2 anonymousClass2, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new MusicModelCatalogBlock$2$$Lambda$3(anonymousClass2, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$2(this.arg$2, (MusicModel.Callback) obj);
    }
}
