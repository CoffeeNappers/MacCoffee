package com.vk.music.fragment.menu;

import com.vk.music.view.adapter.IdResolver;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ActionsBottomSheet$$Lambda$2 implements IdResolver {
    private static final ActionsBottomSheet$$Lambda$2 instance = new ActionsBottomSheet$$Lambda$2();

    private ActionsBottomSheet$$Lambda$2() {
    }

    @Override // com.vk.music.view.adapter.IdResolver
    @LambdaForm.Hidden
    public long resolve(Object obj) {
        return ActionsBottomSheet.lambda$onCreateActionAdapter$1((Action) obj);
    }
}
