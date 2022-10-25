package com.vkontakte.android.navigation;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
/* loaded from: classes3.dex */
public class Navigator implements ArgKeys {
    @NonNull
    protected final Bundle args;
    @Nullable
    private final Bundle mActivityArgs;
    @NonNull
    final Class<? extends Fragment> mFragmentClazz;
    @NonNull
    final Class<? extends Activity> mTargetActivity;

    public Navigator(@NonNull Class<? extends Fragment> clazz) {
        this(clazz, null, null, null);
    }

    public Navigator(@NonNull Class<? extends Fragment> clazz, @Nullable Bundle args) {
        this(clazz, null, args, null);
    }

    public Navigator(@NonNull Class<? extends Fragment> clazz, @NonNull Class<? extends Activity> targetActivity) {
        this(clazz, targetActivity, null, null);
    }

    public Navigator(@NonNull Class<? extends Fragment> clazz, @NonNull Class<? extends Activity> targetActivity, @Nullable Bundle args) {
        this(clazz, targetActivity, args, null);
    }

    public Navigator(@NonNull Class<? extends Fragment> clazz, @NonNull ActivityNavigator targetActivity) {
        this(clazz, targetActivity.mTargetActivity, null, targetActivity.args);
    }

    public Navigator(@NonNull Class<? extends Fragment> clazz, @NonNull ActivityNavigator targetActivity, @Nullable Bundle args) {
        this(clazz, targetActivity.mTargetActivity, args, targetActivity.args);
    }

    /* JADX WARN: Incorrect type for immutable var: ssa=java.lang.Class<? extends android.app.Activity>, code=java.lang.Class, for r2v0, types: [java.lang.Class<? extends android.app.Activity>] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private Navigator(@android.support.annotation.NonNull java.lang.Class<? extends android.app.Fragment> r1, @android.support.annotation.Nullable java.lang.Class r2, @android.support.annotation.Nullable android.os.Bundle r3, @android.support.annotation.Nullable android.os.Bundle r4) {
        /*
            r0 = this;
            r0.<init>()
            r0.mFragmentClazz = r1
            if (r2 != 0) goto L9
            java.lang.Class<com.vkontakte.android.FragmentWrapperActivity> r2 = com.vkontakte.android.FragmentWrapperActivity.class
        L9:
            r0.mTargetActivity = r2
            if (r3 != 0) goto L12
            android.os.Bundle r3 = new android.os.Bundle
            r3.<init>()
        L12:
            r0.args = r3
            r0.mActivityArgs = r4
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.navigation.Navigator.<init>(java.lang.Class, java.lang.Class, android.os.Bundle, android.os.Bundle):void");
    }

    public final Intent intent(Context context) {
        Intent intent = new Intent(context, this.mTargetActivity);
        if (this.mActivityArgs != null) {
            intent.putExtras(this.mActivityArgs);
        }
        intent.putExtra("class", this.mFragmentClazz);
        intent.putExtra("args", this.args);
        return intent;
    }

    public final boolean go(Context context) {
        if (isValidNavigator()) {
            context.startActivity(intent(context));
            return true;
        }
        return false;
    }

    public final boolean go(Activity act, boolean overlay, int inAnim, int outAnim) {
        if (isValidNavigator()) {
            Intent intent = new Intent(act, this.mTargetActivity);
            intent.putExtra("class", this.mFragmentClazz);
            intent.putExtra("args", this.args);
            intent.putExtra("overlaybar", overlay);
            if (inAnim != -1 && outAnim != -1) {
                intent.putExtra("in_anim", inAnim);
                intent.putExtra("out_anim", outAnim);
            }
            act.startActivity(intent);
            return true;
        }
        return false;
    }

    public final boolean go(Fragment fragment) {
        if (isValidNavigator()) {
            fragment.startActivity(intent(fragment.getActivity()));
            return true;
        }
        return false;
    }

    public final boolean forResult(Activity context, int requestCode) {
        if (isValidNavigator()) {
            context.startActivityForResult(intent(context), requestCode);
            return true;
        }
        return false;
    }

    public final boolean forResult(Fragment fragment, int requestCode) {
        if (isValidNavigator()) {
            fragment.startActivityForResult(intent(fragment.getActivity()), requestCode);
            return true;
        }
        return false;
    }

    protected boolean isValidNavigator() {
        return true;
    }

    /* loaded from: classes3.dex */
    public static abstract class ActivityNavigator {
        protected final Bundle args;
        @NonNull
        final Class<? extends Activity> mTargetActivity;

        public ActivityNavigator(@NonNull Class<? extends Activity> clazz) {
            this(clazz, new Bundle());
        }

        ActivityNavigator(@NonNull Class<? extends Activity> clazz, @NonNull Bundle args) {
            this.mTargetActivity = clazz;
            this.args = args;
        }
    }
}
