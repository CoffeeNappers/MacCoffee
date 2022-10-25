package com.vkontakte.android.ui;

import android.support.annotation.Nullable;
import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
/* loaded from: classes3.dex */
public class WindowCallbackDelegate implements Window.Callback {
    public Window.Callback o;

    public WindowCallbackDelegate(Window.Callback orig) {
        this.o = orig;
    }

    @Override // android.view.Window.Callback
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        return this.o.dispatchGenericMotionEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent event) {
        return this.o.dispatchKeyEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchKeyShortcutEvent(KeyEvent event) {
        return this.o.dispatchKeyShortcutEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        return this.o.dispatchPopulateAccessibilityEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTouchEvent(MotionEvent event) {
        return this.o.dispatchTouchEvent(event);
    }

    @Override // android.view.Window.Callback
    public boolean dispatchTrackballEvent(MotionEvent event) {
        return this.o.dispatchTrackballEvent(event);
    }

    @Override // android.view.Window.Callback
    public void onActionModeFinished(ActionMode mode) {
        this.o.onActionModeFinished(mode);
    }

    @Override // android.view.Window.Callback
    public void onActionModeStarted(ActionMode mode) {
        this.o.onActionModeStarted(mode);
    }

    @Override // android.view.Window.Callback
    public void onAttachedToWindow() {
        this.o.onAttachedToWindow();
    }

    @Override // android.view.Window.Callback
    public void onContentChanged() {
        this.o.onContentChanged();
    }

    @Override // android.view.Window.Callback
    public boolean onCreatePanelMenu(int featureId, Menu menu) {
        return this.o.onCreatePanelMenu(featureId, menu);
    }

    @Override // android.view.Window.Callback
    public View onCreatePanelView(int featureId) {
        return this.o.onCreatePanelView(featureId);
    }

    @Override // android.view.Window.Callback
    public void onDetachedFromWindow() {
        this.o.onDetachedFromWindow();
    }

    @Override // android.view.Window.Callback
    public boolean onMenuItemSelected(int featureId, MenuItem item) {
        return this.o.onMenuItemSelected(featureId, item);
    }

    @Override // android.view.Window.Callback
    public boolean onMenuOpened(int featureId, Menu menu) {
        return this.o.onMenuOpened(featureId, menu);
    }

    @Override // android.view.Window.Callback
    public void onPanelClosed(int featureId, Menu menu) {
        this.o.onPanelClosed(featureId, menu);
    }

    @Override // android.view.Window.Callback
    public boolean onPreparePanel(int featureId, View view, Menu menu) {
        return this.o.onPreparePanel(featureId, view, menu);
    }

    @Override // android.view.Window.Callback
    public boolean onSearchRequested() {
        return this.o.onSearchRequested();
    }

    @Override // android.view.Window.Callback
    public boolean onSearchRequested(SearchEvent searchEvent) {
        return this.o.onSearchRequested(searchEvent);
    }

    @Override // android.view.Window.Callback
    public void onWindowAttributesChanged(WindowManager.LayoutParams attrs) {
        this.o.onWindowAttributesChanged(attrs);
    }

    @Override // android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        this.o.onWindowFocusChanged(hasFocus);
    }

    @Override // android.view.Window.Callback
    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
        return this.o.onWindowStartingActionMode(callback);
    }

    @Override // android.view.Window.Callback
    @Nullable
    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) {
        return this.o.onWindowStartingActionMode(callback, type);
    }
}
