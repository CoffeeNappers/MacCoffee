package com.vkontakte.android.ui.holder.gamepage;

import android.view.View;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.ui.holder.gamepage.GameBannersHolder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GameBannersHolder$AppsAdapter$$Lambda$1 implements View.OnClickListener {
    private final GameBannersHolder.AppsAdapter arg$1;
    private final ApiApplication arg$2;

    private GameBannersHolder$AppsAdapter$$Lambda$1(GameBannersHolder.AppsAdapter appsAdapter, ApiApplication apiApplication) {
        this.arg$1 = appsAdapter;
        this.arg$2 = apiApplication;
    }

    public static View.OnClickListener lambdaFactory$(GameBannersHolder.AppsAdapter appsAdapter, ApiApplication apiApplication) {
        return new GameBannersHolder$AppsAdapter$$Lambda$1(appsAdapter, apiApplication);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$instantiateItem$0(this.arg$2, view);
    }
}
