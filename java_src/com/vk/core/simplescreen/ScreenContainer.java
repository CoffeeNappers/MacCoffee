package com.vk.core.simplescreen;

import android.app.Activity;
import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vk.core.util.KeyboardUtils;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class ScreenContainer extends FrameLayout {
    private OnDismissListener onDismissListener;
    protected Activity parentActivity;
    private final ArrayList<BaseScreen> screensStack;
    private int topPadding;

    /* loaded from: classes2.dex */
    public interface OnDismissListener {
        void onDismiss();
    }

    public ScreenContainer(Context context) {
        super(context);
        this.screensStack = new ArrayList<>();
        init(context);
    }

    public ScreenContainer(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.screensStack = new ArrayList<>();
        init(context);
    }

    public ScreenContainer(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.screensStack = new ArrayList<>();
        init(context);
    }

    private void init(Context context) {
        this.parentActivity = Utils.castToActivity(context);
    }

    public void setOnDismissListener(OnDismissListener onDismissListener) {
        this.onDismissListener = onDismissListener;
    }

    public void onResume() {
        BaseScreen currentScreen = getCurrentScreen();
        if (currentScreen != null && !currentScreen.isResumed()) {
            currentScreen.onResume();
        }
    }

    public void onPause() {
        BaseScreen currentScreen = getCurrentScreen();
        if (currentScreen != null) {
            currentScreen.onPause();
        }
    }

    public void onDestroy() {
        while (!this.screensStack.isEmpty()) {
            removeScreenFromStack(this.screensStack.get(this.screensStack.size() - 1));
        }
        this.parentActivity = null;
    }

    public boolean onBackPressed() {
        if (getCurrentScreen() != null && !getCurrentScreen().onBackPressed()) {
            closeLastScreen();
            return true;
        } else if (getCurrentScreen() != null) {
            return true;
        } else {
            if (this.onDismissListener != null) {
                this.onDismissListener.onDismiss();
            }
            return false;
        }
    }

    public void onTopPaddingChanged(int topPadding) {
        this.topPadding = topPadding;
        if (getCurrentScreen() != null) {
            getCurrentScreen().onTopPaddingChanged(topPadding);
        }
    }

    public void showScreen(BaseScreen screen) {
        pauseScreen(getCurrentScreen());
        screen.setParentLayout(this);
        addView(screen.getView(this.parentActivity.getLayoutInflater()));
        screen.onResume();
        screen.onTopPaddingChanged(this.topPadding);
        this.screensStack.add(screen);
    }

    public void closeLastScreen() {
        if (this.screensStack.size() > 0) {
            removeScreenFromStack(this.screensStack.get(this.screensStack.size() - 1));
            if (this.screensStack.size() > 0) {
                BaseScreen screen = this.screensStack.get(this.screensStack.size() - 1);
                hideAll();
                if (screen.getScreenView() != null && screen.getScreenView().getParent() == this) {
                    screen.getScreenView().setVisibility(0);
                } else {
                    if (screen.getScreenView() != null && screen.getScreenView().getParent() != null) {
                        ((ViewGroup) screen.getScreenView().getParent()).removeView(screen.getScreenView());
                    }
                    addView(screen.getView(this.parentActivity.getLayoutInflater()));
                    screen.getScreenView().setVisibility(0);
                }
                screen.onResume();
            }
        }
        if (this.screensStack.size() == 0 && this.onDismissListener != null) {
            this.onDismissListener.onDismiss();
        }
    }

    private void removeScreenFromStack(BaseScreen screen) {
        pauseScreen(screen);
        if (screen.getScreenView() != null && screen.getScreenView().getParent() != null) {
            ((ViewGroup) screen.getScreenView().getParent()).removeView(screen.getScreenView());
        }
        screen.onDestroy();
        screen.setParentLayout(null);
        this.screensStack.remove(screen);
    }

    public BaseScreen getCurrentScreen() {
        if (!this.screensStack.isEmpty()) {
            return this.screensStack.get(this.screensStack.size() - 1);
        }
        return null;
    }

    private void hideAll() {
        for (int i = 0; i < getChildCount(); i++) {
            getChildAt(i).setVisibility(8);
        }
    }

    private void pauseScreen(BaseScreen screen) {
        if (screen != null && screen.isResumed()) {
            if (this.parentActivity != null) {
                KeyboardUtils.hideKeyboard(this.parentActivity);
            }
            screen.onPause();
            if (screen.getScreenView() != null) {
                screen.getScreenView().setVisibility(8);
            }
        }
    }
}
