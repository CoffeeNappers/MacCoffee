package com.vk.sharing.target;

import com.vkontakte.android.data.Groups;
import java.lang.invoke.LambdaForm;
import java.util.List;
/* loaded from: classes.dex */
final /* synthetic */ class TargetsLoader$$Lambda$1 implements Groups.SearchGroupsCallback {
    private final TargetsLoader arg$1;

    private TargetsLoader$$Lambda$1(TargetsLoader targetsLoader) {
        this.arg$1 = targetsLoader;
    }

    public static Groups.SearchGroupsCallback lambdaFactory$(TargetsLoader targetsLoader) {
        return new TargetsLoader$$Lambda$1(targetsLoader);
    }

    @Override // com.vkontakte.android.data.Groups.SearchGroupsCallback
    @LambdaForm.Hidden
    public void onResult(List list) {
        this.arg$1.lambda$searchGroups$1(list);
    }
}
