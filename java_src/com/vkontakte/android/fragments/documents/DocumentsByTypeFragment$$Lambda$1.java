package com.vkontakte.android.fragments.documents;

import android.content.DialogInterface;
import com.vkontakte.android.api.Document;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DocumentsByTypeFragment$$Lambda$1 implements DialogInterface.OnClickListener {
    private final DocumentsByTypeFragment arg$1;
    private final Document arg$2;

    private DocumentsByTypeFragment$$Lambda$1(DocumentsByTypeFragment documentsByTypeFragment, Document document) {
        this.arg$1 = documentsByTypeFragment;
        this.arg$2 = document;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(DocumentsByTypeFragment documentsByTypeFragment, Document document) {
        return new DocumentsByTypeFragment$$Lambda$1(documentsByTypeFragment, document);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onDocumentLongClick$0(this.arg$2, dialogInterface, i);
    }
}
