package com.vkontakte.android;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.AttrRes;
import android.support.annotation.ColorInt;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.app.AppCompatCallback;
import android.support.v7.view.ActionMode;
import android.support.v7.view.StandaloneActionMode;
import android.support.v7.widget.ActionBarContextView;
import android.support.v7.widget.PopupMenu;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.functions.VoidF0;
import com.vkontakte.android.ui.drawables.TypingDrawable;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
/* loaded from: classes2.dex */
public class ViewUtils {
    private static Handler handler = new Handler(Looper.getMainLooper());
    private static HashMap<View, ObjectAnimator> visibilityAnims = new HashMap<>();

    /* loaded from: classes2.dex */
    public static abstract class ActionModeCallback implements ActionMode.Callback {
    }

    public static Drawable getDrawable(@NonNull Context ctx, @DrawableRes int res) {
        return Build.VERSION.SDK_INT >= 21 ? ctx.getDrawable(res) : ctx.getResources().getDrawable(res);
    }

    public static void dismissDialogSafety(@Nullable Dialog dialog) {
        if (dialog != null) {
            if (Looper.myLooper() == handler.getLooper()) {
                try {
                    dialog.dismiss();
                    return;
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                    return;
                }
            }
            handler.post(ViewUtils$$Lambda$1.lambdaFactory$(dialog));
        }
    }

    public static /* synthetic */ void lambda$dismissDialogSafety$0(@Nullable Dialog dialog) {
        try {
            dialog.dismiss();
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public static void dismissDialogSafety(@Nullable PopupMenu dialog) {
        if (dialog != null) {
            if (Looper.myLooper() == handler.getLooper()) {
                try {
                    dialog.dismiss();
                    return;
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                    return;
                }
            }
            handler.post(ViewUtils$$Lambda$2.lambdaFactory$(dialog));
        }
    }

    public static /* synthetic */ void lambda$dismissDialogSafety$1(@Nullable PopupMenu dialog) {
        try {
            dialog.dismiss();
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public static void showDialogSafety(@Nullable Dialog dialog) {
        if (dialog != null) {
            if (Looper.myLooper() == handler.getLooper()) {
                try {
                    dialog.show();
                    return;
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                    return;
                }
            }
            handler.post(ViewUtils$$Lambda$3.lambdaFactory$(dialog));
        }
    }

    public static /* synthetic */ void lambda$showDialogSafety$2(@Nullable Dialog dialog) {
        try {
            dialog.show();
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public static void fixActionModeCallback(AppCompatActivity activity, ActionMode mode) {
        if (Build.VERSION.SDK_INT >= 21 && (mode instanceof StandaloneActionMode)) {
            try {
                Field mCallbackField = mode.getClass().getDeclaredField("mCallback");
                mCallbackField.setAccessible(true);
                Object mCallback = mCallbackField.get(mode);
                Field mWrappedField = mCallback.getClass().getDeclaredField("mWrapped");
                mWrappedField.setAccessible(true);
                final ActionMode.Callback mWrapped = (ActionMode.Callback) mWrappedField.get(mCallback);
                Field mDelegateField = AppCompatActivity.class.getDeclaredField("mDelegate");
                mDelegateField.setAccessible(true);
                final Object mDelegate = mDelegateField.get(activity);
                mCallbackField.set(mode, new ActionMode.Callback() { // from class: com.vkontakte.android.ViewUtils.1
                    @Override // android.support.v7.view.ActionMode.Callback
                    public boolean onCreateActionMode(ActionMode mode2, Menu menu) {
                        return mWrapped.onCreateActionMode(mode2, menu);
                    }

                    @Override // android.support.v7.view.ActionMode.Callback
                    public boolean onPrepareActionMode(ActionMode mode2, Menu menu) {
                        return mWrapped.onPrepareActionMode(mode2, menu);
                    }

                    @Override // android.support.v7.view.ActionMode.Callback
                    public boolean onActionItemClicked(ActionMode mode2, MenuItem item) {
                        return mWrapped.onActionItemClicked(mode2, item);
                    }

                    @Override // android.support.v7.view.ActionMode.Callback
                    public void onDestroyActionMode(final ActionMode mode2) {
                        Class mDelegateClass = mDelegate.getClass().getSuperclass();
                        Window mWindow = null;
                        PopupWindow mActionModePopup = null;
                        Runnable mShowActionModePopup = null;
                        ActionBarContextView mActionModeView = null;
                        AppCompatCallback mAppCompatCallback = null;
                        ViewPropertyAnimatorCompat mFadeAnim = null;
                        ActionMode mActionMode = null;
                        Field mFadeAnimField = null;
                        Field mActionModeField = null;
                        while (mDelegateClass != null) {
                            try {
                                if (TextUtils.equals("AppCompatDelegateImplV9", mDelegateClass.getSimpleName())) {
                                    Field mActionModePopupField = mDelegateClass.getDeclaredField("mActionModePopup");
                                    mActionModePopupField.setAccessible(true);
                                    mActionModePopup = (PopupWindow) mActionModePopupField.get(mDelegate);
                                    Field mShowActionModePopupField = mDelegateClass.getDeclaredField("mShowActionModePopup");
                                    mShowActionModePopupField.setAccessible(true);
                                    mShowActionModePopup = (Runnable) mShowActionModePopupField.get(mDelegate);
                                    Field mActionModeViewField = mDelegateClass.getDeclaredField("mActionModeView");
                                    mActionModeViewField.setAccessible(true);
                                    mActionModeView = (ActionBarContextView) mActionModeViewField.get(mDelegate);
                                    mFadeAnimField = mDelegateClass.getDeclaredField("mFadeAnim");
                                    mFadeAnimField.setAccessible(true);
                                    mFadeAnim = (ViewPropertyAnimatorCompat) mFadeAnimField.get(mDelegate);
                                    mActionModeField = mDelegateClass.getDeclaredField("mActionMode");
                                    mActionModeField.setAccessible(true);
                                    mActionMode = (ActionMode) mActionModeField.get(mDelegate);
                                } else if (TextUtils.equals("AppCompatDelegateImplBase", mDelegateClass.getSimpleName())) {
                                    Field mAppCompatCallbackField = mDelegateClass.getDeclaredField("mAppCompatCallback");
                                    mAppCompatCallbackField.setAccessible(true);
                                    mAppCompatCallback = (AppCompatCallback) mAppCompatCallbackField.get(mDelegate);
                                    Field mWindowField = mDelegateClass.getDeclaredField("mWindow");
                                    mWindowField.setAccessible(true);
                                    mWindow = (Window) mWindowField.get(mDelegate);
                                }
                                mDelegateClass = mDelegateClass.getSuperclass();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        if (mActionModePopup != null) {
                            mWindow.getDecorView().removeCallbacks(mShowActionModePopup);
                        }
                        if (mActionModeView != null) {
                            if (mFadeAnim != null) {
                                mFadeAnim.cancel();
                            }
                            final ViewPropertyAnimatorCompat mFadeAnim2 = ViewCompat.animate(mActionModeView).alpha(0.0f);
                            final PopupWindow mActionModePopupFinal = mActionModePopup;
                            final ActionBarContextView mActionModeViewFinal = mActionModeView;
                            final AppCompatCallback mAppCompatCallbackFinal = mAppCompatCallback;
                            final ActionMode mActionModeFinal = mActionMode;
                            final Field mFadeAnimFieldFinal = mFadeAnimField;
                            final Field mActionModeFieldFinal = mActionModeField;
                            mFadeAnim2.setListener(new ViewPropertyAnimatorListenerAdapter() { // from class: com.vkontakte.android.ViewUtils.1.1
                                {
                                    AnonymousClass1.this = this;
                                }

                                @Override // android.support.v4.view.ViewPropertyAnimatorListenerAdapter, android.support.v4.view.ViewPropertyAnimatorListener
                                public void onAnimationEnd(View view) {
                                    mActionModeViewFinal.setVisibility(8);
                                    if (mActionModePopupFinal != null) {
                                        mActionModePopupFinal.dismiss();
                                    } else if (mActionModeViewFinal.getParent() instanceof View) {
                                        ViewCompat.requestApplyInsets((View) mActionModeViewFinal.getParent());
                                    }
                                    mActionModeViewFinal.removeAllViews();
                                    mFadeAnim2.setListener(null);
                                    try {
                                        if (mFadeAnimFieldFinal != null) {
                                            mFadeAnimFieldFinal.set(mDelegate, null);
                                        }
                                    } catch (IllegalAccessException e2) {
                                        e2.printStackTrace();
                                    }
                                    mWrapped.onDestroyActionMode(mode2);
                                    if (mAppCompatCallbackFinal != null) {
                                        mAppCompatCallbackFinal.onSupportActionModeFinished(mActionModeFinal);
                                    }
                                    try {
                                        if (mActionModeFieldFinal != null) {
                                            mActionModeFieldFinal.set(mDelegate, null);
                                        }
                                    } catch (IllegalAccessException e3) {
                                        e3.printStackTrace();
                                    }
                                }
                            });
                        }
                    }
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static int getResFromTheme(Context ctx, @AttrRes int attr) {
        TypedArray a = ctx.getTheme().obtainStyledAttributes(new int[]{attr});
        int resourceId = a.getResourceId(0, 0);
        a.recycle();
        return resourceId;
    }

    public static boolean getBoolFromTheme(Context ctx, @AttrRes int attr) {
        TypedArray a = ctx.getTheme().obtainStyledAttributes(new int[]{attr});
        boolean value = a.getBoolean(0, false);
        a.recycle();
        return value;
    }

    @Nullable
    public static SpannableString getTypingText(@Nullable Context ctx, int peer, List<? extends Object> users, @Nullable SparseArray<UserProfile> prMap, @NonNull final VoidF0 f, int color) {
        String text;
        if (ctx == null || users == null || users.size() == 0) {
            return null;
        }
        if (peer < 2000000000) {
            text = ctx.getString(R.string.typing_empty);
        } else if (users.size() == 1) {
            text = ctx.getString(R.string.typing_one, getTypingUserName(users.get(0), prMap));
        } else if (users.size() == 2) {
            text = ctx.getString(R.string.typing_two, getTypingUserName(users.get(0), prMap), getTypingUserName(users.get(1), prMap));
        } else {
            text = ctx.getResources().getQuantityString(R.plurals.typing_more, users.size() - 1, getTypingUserName(users.get(0), prMap), Integer.valueOf(users.size() - 1));
        }
        SpannableString ss = new SpannableString(text + " ...");
        TypingDrawable d = new TypingDrawable(color) { // from class: com.vkontakte.android.ViewUtils.2
            @Override // android.graphics.drawable.Drawable
            public void invalidateSelf() {
                super.invalidateSelf();
                f.f();
            }
        };
        d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
        ss.setSpan(new ImageSpan(d, 1), text.length() + 1, text.length() + 4, 17);
        return ss;
    }

    @NonNull
    private static CharSequence getTypingUserName(@Nullable Object o, @Nullable SparseArray<UserProfile> profileMap) {
        UserProfile up = (!(o instanceof Integer) || profileMap == null) ? null : profileMap.get(((Integer) o).intValue());
        if (o instanceof UserProfile) {
            up = (UserProfile) o;
        }
        if (up != null) {
            String ret = up.firstName.length() > 16 ? up.firstName.substring(0, 16) : up.firstName;
            return ret + (TextUtils.isEmpty(up.lastName) ? "" : MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + up.lastName.charAt(0) + ".");
        }
        return "?";
    }

    public static void invalidateViewCascade(View view) {
        if (view instanceof ViewGroup) {
            for (int i = ((ViewGroup) view).getChildCount(); i >= 0; i--) {
                invalidateViewCascade(((ViewGroup) view).getChildAt(i));
            }
        }
        if (view != null) {
            view.invalidate();
        }
    }

    public static void setText(@Nullable TextView textView, Object text) {
        setText(textView, text, false);
    }

    public static void setText(@Nullable TextView textView, Object text, boolean useHideIfEmpty) {
        if (textView != null) {
            if (text instanceof Integer) {
                textView.setText(((Integer) text).intValue());
            } else {
                textView.setText((CharSequence) text);
            }
            if (useHideIfEmpty) {
                textView.setVisibility(textView.getText().length() == 0 ? 8 : 0);
            }
        }
    }

    public static void scrollBy(@Nullable View view, int x, int y) {
        if (view != null) {
            view.scrollBy(x, y);
        }
    }

    public static void setTranslationY(@Nullable View view, float translationY) {
        if (view != null) {
            view.setTranslationY(translationY);
        }
    }

    public static void setPadding(@Nullable View view, int l, int t, int b, int r) {
        if (view != null) {
            view.setPadding(l, t, b, r);
        }
    }

    public static void setLeftPadding(@Nullable View view, int p) {
        if (view != null) {
            view.setPadding(p, view.getPaddingTop(), view.getPaddingRight(), view.getPaddingBottom());
        }
    }

    public static void setTopPadding(@Nullable View view, int p) {
        if (view != null) {
            view.setPadding(view.getPaddingLeft(), p, view.getPaddingRight(), view.getPaddingBottom());
        }
    }

    public static void setRightPadding(@Nullable View view, int p) {
        if (view != null) {
            view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), p, view.getPaddingBottom());
        }
    }

    public static void setBottomPadding(@Nullable View view, int p) {
        if (view != null) {
            view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), p);
        }
    }

    public static void setVisibility(@Nullable View view, int visibility) {
        if (view != null) {
            view.setVisibility(visibility);
        }
    }

    public static void invalidate(@Nullable View view) {
        if (view != null) {
            view.invalidate();
        }
    }

    public static void postDelayed(Runnable r, long delay) {
        handler.postDelayed(r, delay);
    }

    public static void post(Runnable r) {
        handler.post(r);
    }

    public static void removeCallbacks(Runnable runnable) {
        handler.removeCallbacks(runnable);
    }

    public static void runOnUiThread(@Nullable Context ctx, Runnable action) {
        if (ctx != null) {
            if (!Looper.getMainLooper().equals(Looper.myLooper())) {
                handler.post(action);
            } else {
                action.run();
            }
        }
    }

    public static void runOnUiThread(Runnable action) {
        if (!Looper.getMainLooper().equals(Looper.myLooper())) {
            handler.post(action);
        } else {
            action.run();
        }
    }

    public static void setEnabled(@Nullable View view, boolean enable) {
        if (view != null) {
            view.setEnabled(enable);
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = viewGroup.getChildCount() - 1; i >= 0; i--) {
                setEnabled(viewGroup.getChildAt(i), enable);
            }
        }
    }

    public static View findViewByType(View container, Class<? extends View> type) {
        if (!type.isInstance(container)) {
            if (container instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) container;
                for (int i = 0; i < g.getChildCount(); i++) {
                    View result = findViewByType(g.getChildAt(i), type);
                    if (result != null) {
                        return result;
                    }
                }
            }
            return null;
        }
        return container;
    }

    public static Point getViewOffset(View v1, View v2) {
        int[] p1 = {0, 0};
        int[] p2 = {0, 0};
        v1.getLocationOnScreen(p1);
        v2.getLocationOnScreen(p2);
        return new Point(p1[0] - p2[0], p1[1] - p2[1]);
    }

    public static View.OnClickListener getViewOnClickListener(View view) {
        try {
            Method getListenerInfo = View.class.getDeclaredMethod("getListenerInfo", new Class[0]);
            getListenerInfo.setAccessible(true);
            Object listenerInfo = getListenerInfo.invoke(view, new Object[0]);
            Field listenerField = listenerInfo.getClass().getDeclaredField("mOnClickListener");
            listenerField.setAccessible(true);
            return (View.OnClickListener) listenerField.get(listenerInfo);
        } catch (Exception e) {
            return null;
        }
    }

    public static void setNoClipRecursive(View view) {
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            vg.setClipChildren(false);
            vg.setClipToPadding(false);
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (vg.getChildAt(i) instanceof ViewGroup) {
                    setNoClipRecursive(vg.getChildAt(i));
                }
            }
        }
    }

    public static void setNoFitRecursive(View view) {
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            vg.setClipChildren(false);
            vg.setClipToPadding(false);
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (vg.getChildAt(i) instanceof ViewGroup) {
                    setNoFitRecursive(vg.getChildAt(i));
                }
                vg.getChildAt(i).setFitsSystemWindows(false);
            }
        }
    }

    public static int getScreenOrientation(Activity act) {
        int rotation = act.getWindowManager().getDefaultDisplay().getRotation();
        DisplayMetrics dm = new DisplayMetrics();
        act.getWindowManager().getDefaultDisplay().getMetrics(dm);
        int width = dm.widthPixels;
        int height = dm.heightPixels;
        if (((rotation == 0 || rotation == 2) && height > width) || ((rotation == 1 || rotation == 3) && width > height)) {
            switch (rotation) {
                case 0:
                    return 1;
                case 1:
                    return 0;
                case 2:
                    return 9;
                case 3:
                    return 8;
                default:
                    Log.e("vk", "Unknown screen orientation " + rotation + ". Defaulting to portrait.");
                    return 1;
            }
        }
        switch (rotation) {
            case 0:
                return 0;
            case 1:
                return 9;
            case 2:
                return 8;
            case 3:
                return 1;
            default:
                Log.e("vk", "Unknown screen orientation " + rotation + ". Defaulting to landscape.");
                return 0;
        }
    }

    public static int getDeviceDefaultOrientation(Context activity) {
        WindowManager windowManager = (WindowManager) activity.getSystemService("window");
        Configuration config = activity.getResources().getConfiguration();
        int rotation = windowManager.getDefaultDisplay().getRotation();
        if ((rotation == 0 || rotation == 2) && config.orientation == 2) {
            return 2;
        }
        return ((rotation == 1 || rotation == 3) && config.orientation == 1) ? 2 : 1;
    }

    public static int getDeviceDegreesInPortraitMode(Context activity) {
        return getDeviceDefaultOrientation(activity) == 1 ? 0 : 90;
    }

    public static void setVisibilityAnimated(final View view, final int visibility) {
        if (view != null) {
            boolean vis = visibility == 0;
            boolean viewVis = view.getVisibility() == 0 && view.getTag(R.id.tag_visibility_anim) == null;
            if (vis != viewVis) {
                if (visibilityAnims.containsKey(view)) {
                    visibilityAnims.get(view).cancel();
                    visibilityAnims.remove(view);
                }
                if (vis) {
                    float[] fArr = new float[2];
                    fArr[0] = view.getAlpha() < 1.0f ? view.getAlpha() : 0.0f;
                    fArr[1] = 1.0f;
                    ObjectAnimator anim = ObjectAnimator.ofFloat(view, "alpha", fArr);
                    anim.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ViewUtils.3
                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationStart(Animator anim2) {
                            view.setVisibility(visibility);
                        }

                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationEnd(Animator anim2) {
                            view.setVisibility(visibility);
                            ViewUtils.visibilityAnims.remove(view);
                        }

                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationCancel(Animator anim2) {
                            view.setVisibility(visibility);
                        }
                    });
                    anim.setDuration(300L);
                    visibilityAnims.put(view, anim);
                    anim.start();
                    return;
                }
                ObjectAnimator anim2 = ObjectAnimator.ofFloat(view, "alpha", 0.0f);
                anim2.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ViewUtils.4
                    boolean canceled = false;

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationStart(Animator anim3) {
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator anim3) {
                        view.setTag(R.id.tag_visibility_anim, null);
                        ViewUtils.visibilityAnims.remove(view);
                        if (!this.canceled) {
                            view.setVisibility(visibility);
                            view.setAlpha(1.0f);
                        }
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationCancel(Animator anim3) {
                        this.canceled = true;
                    }
                });
                view.setTag(R.id.tag_visibility_anim, true);
                anim2.setDuration(300L);
                visibilityAnims.put(view, anim2);
                anim2.start();
            }
        }
    }

    public static void cancelVisibilityAnimation(View view) {
        if (visibilityAnims.containsKey(view)) {
            visibilityAnims.get(view).cancel();
            view.setAlpha(1.0f);
        }
    }

    public static int getStatusBarHeight() {
        int resourceId = VKApplication.context.getResources().getIdentifier("status_bar_height", "dimen", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        if (resourceId <= 0) {
            return 0;
        }
        int result = VKApplication.context.getResources().getDimensionPixelSize(resourceId);
        return result;
    }

    public static void dumpViewHierarchy(View v, int depth) {
        String logstr = "";
        for (int i = 0; i < depth; i++) {
            logstr = logstr + "-";
        }
        String logstr2 = logstr + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + v.toString();
        if (v instanceof TextView) {
            logstr2 = logstr2 + " ['" + ((Object) ((TextView) v).getText()) + "']";
        }
        String logstr3 = logstr2 + " (" + v.getWidth() + "x" + v.getHeight() + ")";
        switch (v.getVisibility()) {
            case 0:
                logstr3 = logstr3 + " VISIBLE";
                break;
            case 4:
                logstr3 = logstr3 + " INVISIBLE";
                break;
            case 8:
                logstr3 = logstr3 + " GONE";
                break;
        }
        String logstr4 = logstr3 + " BG=" + v.getBackground();
        if (v instanceof FrameLayout) {
            logstr4 = logstr4 + " FG=" + ((FrameLayout) v).getForeground();
        }
        String logstr5 = logstr4 + " pad=" + v.getPaddingLeft() + ";" + v.getPaddingTop() + ";" + v.getPaddingRight() + ";" + v.getPaddingBottom();
        if (v.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams pp = (ViewGroup.MarginLayoutParams) v.getLayoutParams();
            logstr5 = logstr5 + " margins=" + pp.leftMargin + ";" + pp.topMargin + ";" + pp.rightMargin + ";" + pp.bottomMargin;
        }
        Log.i("vk", logstr5);
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            for (int i2 = 0; i2 < vg.getChildCount(); i2++) {
                dumpViewHierarchy(vg.getChildAt(i2), depth + 1);
            }
        }
    }

    public static void setStatusBarColor(Window window, int color) {
        if (Build.VERSION.SDK_INT >= 21) {
            try {
                window.addFlags(Integer.MIN_VALUE);
                window.setStatusBarColor(color);
            } catch (Exception e) {
            }
        }
    }

    public static void setNavigationBarColor(Window window, int color) {
        if (Build.VERSION.SDK_INT >= 21) {
            try {
                window.addFlags(Integer.MIN_VALUE);
                window.getClass().getMethod("setNavigationBarColor", Integer.TYPE).invoke(window, Integer.valueOf(color));
            } catch (Exception e) {
            }
        }
    }

    public static int getNavigationBarHeight(Context context) {
        Resources resources = context.getResources();
        int resourceId = resources.getIdentifier("navigation_bar_height", "dimen", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        if (resourceId > 0) {
            return resources.getDimensionPixelOffset(resourceId);
        }
        return 0;
    }

    public static boolean isImmersiveModeOrNoNavigationBar(Activity activity) {
        View rootView = activity.findViewById(16908290);
        View decorView = activity.getWindow().getDecorView();
        return rootView == null || decorView == null || decorView.getBottom() == rootView.getBottom();
    }

    public static void setBackgroundWithViewPadding(@NonNull View view, @NonNull Drawable background) {
        Drawable oldBackground = view.getBackground();
        int left = view.getPaddingLeft();
        int top = view.getPaddingTop();
        int right = view.getPaddingRight();
        int bottom = view.getPaddingBottom();
        Rect padding = new Rect();
        if (oldBackground != null) {
            oldBackground.getPadding(padding);
            left -= padding.left;
            top -= padding.top;
            right -= padding.right;
            bottom -= padding.bottom;
        }
        background.getPadding(padding);
        view.setBackgroundDrawable(background);
        view.setPadding(padding.left + left, padding.top + top, padding.right + right, padding.bottom + bottom);
    }

    public static void colorizeSubmenu(@Nullable SubMenu menu, @ColorInt int color) {
        if (menu != null) {
            for (int i = 0; i < menu.size(); i++) {
                MenuItem item = menu.getItem(i);
                if (item != null) {
                    Drawable icon = item.getIcon();
                    SubMenu subMenu = item.getSubMenu();
                    if (icon != null) {
                        icon.mutate().setColorFilter(color, PorterDuff.Mode.SRC_IN);
                    }
                    if (subMenu != null) {
                        colorizeSubmenu(subMenu, color);
                    }
                }
            }
        }
    }

    public static int fetchSystemColor(Context context, int colorAttrId) {
        TypedValue typedValue = new TypedValue();
        TypedArray a = context.obtainStyledAttributes(typedValue.data, new int[]{colorAttrId});
        int color = a.getColor(0, 0);
        a.recycle();
        return color;
    }

    public static int getMeasurement(int measureSpec, int minSize, int maxSize, int contentSize) {
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        switch (specMode) {
            case Integer.MIN_VALUE:
                if (specSize >= minSize && specSize >= contentSize) {
                    return Math.max(minSize, Math.min(contentSize, maxSize));
                }
                return specSize;
            case 0:
                return contentSize < minSize ? minSize : contentSize > maxSize ? maxSize : contentSize;
            case 1073741824:
                return specSize;
            default:
                throw new IllegalArgumentException("Unknown specMode: " + specMode);
        }
    }

    public static int getSuggestedAvailableSizeFromSpec(int spec, int minSize, int maxSize, int usedSize) {
        int specSize = View.MeasureSpec.getSize(spec);
        int specMode = View.MeasureSpec.getMode(spec);
        if (specMode == 1073741824 || specMode == Integer.MIN_VALUE) {
            if (specSize < minSize) {
                return Math.max(0, minSize - usedSize);
            }
            if (specSize > maxSize) {
                return Math.max(0, maxSize - usedSize);
            }
            return Math.max(0, specSize - usedSize);
        }
        return Math.max(0, maxSize - usedSize);
    }

    public static void runOnPreDraw(final View view, final boolean doDraw, final Runnable runnable) {
        view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ViewUtils.5
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                view.getViewTreeObserver().removeOnPreDrawListener(this);
                runnable.run();
                return doDraw;
            }
        });
    }
}
