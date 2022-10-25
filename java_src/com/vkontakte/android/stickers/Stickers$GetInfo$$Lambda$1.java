package com.vkontakte.android.stickers;

import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.stickers.Stickers;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class Stickers$GetInfo$$Lambda$1 implements F1 {
    private static final Stickers$GetInfo$$Lambda$1 instance = new Stickers$GetInfo$$Lambda$1();

    private Stickers$GetInfo$$Lambda$1() {
    }

    public static F1 lambdaFactory$() {
        return instance;
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return Stickers.GetInfo.lambda$parse$0((StickerStockItem) obj);
    }
}
