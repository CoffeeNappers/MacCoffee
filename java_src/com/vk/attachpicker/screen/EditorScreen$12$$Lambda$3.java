package com.vk.attachpicker.screen;

import android.app.Activity;
import android.widget.Toast;
import com.vkontakte.android.R;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$12$$Lambda$3 implements Consumer {
    private final Activity arg$1;

    private EditorScreen$12$$Lambda$3(Activity activity) {
        this.arg$1 = activity;
    }

    public static Consumer lambdaFactory$(Activity activity) {
        return new EditorScreen$12$$Lambda$3(activity);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        Throwable th = (Throwable) obj;
        Toast.makeText(this.arg$1, (int) R.string.picker_loading_sticker_error, 0).show();
    }
}
