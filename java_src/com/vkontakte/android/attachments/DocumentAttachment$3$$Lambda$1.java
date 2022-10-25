package com.vkontakte.android.attachments;

import com.vkontakte.android.attachments.DocumentAttachment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.animation.MovieDrawable;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DocumentAttachment$3$$Lambda$1 implements VoidF1 {
    private final DocumentAttachment.AnonymousClass3 arg$1;

    private DocumentAttachment$3$$Lambda$1(DocumentAttachment.AnonymousClass3 anonymousClass3) {
        this.arg$1 = anonymousClass3;
    }

    public static VoidF1 lambdaFactory$(DocumentAttachment.AnonymousClass3 anonymousClass3) {
        return new DocumentAttachment$3$$Lambda$1(anonymousClass3);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onPostExecute$0((MovieDrawable) obj);
    }
}
