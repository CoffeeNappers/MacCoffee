package com.vkontakte.android.data;

import com.vkontakte.android.api.Group;
import com.vkontakte.android.functions.Predicate;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class Groups$$Lambda$3 implements Predicate {
    private final int arg$1;

    private Groups$$Lambda$3(int i) {
        this.arg$1 = i;
    }

    public static Predicate lambdaFactory$(int i) {
        return new Groups$$Lambda$3(i);
    }

    @Override // com.vkontakte.android.functions.Predicate
    @LambdaForm.Hidden
    public boolean f(Object obj) {
        return Groups.lambda$null$1(this.arg$1, (Group) obj);
    }
}
