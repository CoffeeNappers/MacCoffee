package com.vkontakte.android.data;

import android.app.Activity;
import android.content.DialogInterface;
import android.widget.EditText;
import com.vkontakte.android.NewsEntry;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class Posts$$Lambda$1 implements DialogInterface.OnClickListener {
    private final NewsEntry arg$1;
    private final EditText arg$2;
    private final Activity arg$3;

    private Posts$$Lambda$1(NewsEntry newsEntry, EditText editText, Activity activity) {
        this.arg$1 = newsEntry;
        this.arg$2 = editText;
        this.arg$3 = activity;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(NewsEntry newsEntry, EditText editText, Activity activity) {
        return new Posts$$Lambda$1(newsEntry, editText, activity);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        Posts.saveRepostComment(this.arg$1, this.arg$2.getText().toString(), this.arg$3);
    }
}
