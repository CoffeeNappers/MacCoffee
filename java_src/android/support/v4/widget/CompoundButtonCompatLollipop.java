package android.support.v4.widget;

import android.annotation.TargetApi;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.support.annotation.RequiresApi;
import android.widget.CompoundButton;
@RequiresApi(21)
@TargetApi(21)
/* loaded from: classes.dex */
class CompoundButtonCompatLollipop {
    CompoundButtonCompatLollipop() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setButtonTintList(CompoundButton button, ColorStateList tint) {
        button.setButtonTintList(tint);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static ColorStateList getButtonTintList(CompoundButton button) {
        return button.getButtonTintList();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setButtonTintMode(CompoundButton button, PorterDuff.Mode tintMode) {
        button.setButtonTintMode(tintMode);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static PorterDuff.Mode getButtonTintMode(CompoundButton button) {
        return button.getButtonTintMode();
    }
}
