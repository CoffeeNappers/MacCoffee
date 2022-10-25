package com.vkontakte.android.fragments.documents;

import android.view.View;
import android.widget.AdapterView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DocumentsViewFragment$$Lambda$1 implements AdapterView.OnItemClickListener {
    private final DocumentsViewFragment arg$1;

    private DocumentsViewFragment$$Lambda$1(DocumentsViewFragment documentsViewFragment) {
        this.arg$1 = documentsViewFragment;
    }

    public static AdapterView.OnItemClickListener lambdaFactory$(DocumentsViewFragment documentsViewFragment) {
        return new DocumentsViewFragment$$Lambda$1(documentsViewFragment);
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    @LambdaForm.Hidden
    public void onItemClick(AdapterView adapterView, View view, int i, long j) {
        this.arg$1.lambda$onClick$0(adapterView, view, i, j);
    }
}
