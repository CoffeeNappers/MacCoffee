package com.vkontakte.android.ui.holder.documents;

import com.vkontakte.android.ui.widget.SubPagerOfList;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DocumentsTabbedHolder$$Lambda$1 implements SubPagerOfList.IScrollToPageView {
    private final DocumentsTabbedHolder arg$1;
    private final SubPagerOfList.ArrayListWithIndex arg$2;

    private DocumentsTabbedHolder$$Lambda$1(DocumentsTabbedHolder documentsTabbedHolder, SubPagerOfList.ArrayListWithIndex arrayListWithIndex) {
        this.arg$1 = documentsTabbedHolder;
        this.arg$2 = arrayListWithIndex;
    }

    public static SubPagerOfList.IScrollToPageView lambdaFactory$(DocumentsTabbedHolder documentsTabbedHolder, SubPagerOfList.ArrayListWithIndex arrayListWithIndex) {
        return new DocumentsTabbedHolder$$Lambda$1(documentsTabbedHolder, arrayListWithIndex);
    }

    @Override // com.vkontakte.android.ui.widget.SubPagerOfList.IScrollToPageView
    @LambdaForm.Hidden
    public void scrollToPageView() {
        this.arg$1.lambda$onBind$0(this.arg$2);
    }
}
