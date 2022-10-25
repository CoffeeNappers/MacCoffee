package com.vkontakte.android.ui.holder.gamepage;

import com.vkontakte.android.ui.widget.SubPagerOfList;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GameGenresHolder$$Lambda$1 implements SubPagerOfList.IScrollToPageView {
    private final GameGenresHolder arg$1;
    private final SubPagerOfList.ArrayListWithIndex arg$2;

    private GameGenresHolder$$Lambda$1(GameGenresHolder gameGenresHolder, SubPagerOfList.ArrayListWithIndex arrayListWithIndex) {
        this.arg$1 = gameGenresHolder;
        this.arg$2 = arrayListWithIndex;
    }

    public static SubPagerOfList.IScrollToPageView lambdaFactory$(GameGenresHolder gameGenresHolder, SubPagerOfList.ArrayListWithIndex arrayListWithIndex) {
        return new GameGenresHolder$$Lambda$1(gameGenresHolder, arrayListWithIndex);
    }

    @Override // com.vkontakte.android.ui.widget.SubPagerOfList.IScrollToPageView
    @LambdaForm.Hidden
    public void scrollToPageView() {
        this.arg$1.lambda$onBind$0(this.arg$2);
    }
}
