package android.support.v4.widget;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.widget.TextView;
@RequiresApi(16)
@TargetApi(16)
/* loaded from: classes.dex */
class TextViewCompatJb {
    TextViewCompatJb() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getMaxLines(TextView textView) {
        return textView.getMaxLines();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getMinLines(TextView textView) {
        return textView.getMinLines();
    }
}
