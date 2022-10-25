package com.vkontakte.android.ui;

import android.animation.LayoutTransition;
import android.annotation.TargetApi;
import android.content.res.Configuration;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.Region;
import android.view.ActionMode;
import android.view.DragEvent;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewDebug;
import android.view.ViewGroup;
import android.view.ViewGroupOverlay;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Animation;
import android.view.animation.LayoutAnimationController;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class ProxyViewGroup extends ViewGroup {
    private ViewGroup delegate;

    public ProxyViewGroup(ViewGroup d) {
        super(d.getContext());
        this.delegate = d;
    }

    @Override // android.view.ViewGroup
    @ViewDebug.ExportedProperty(category = "focus", mapping = {@ViewDebug.IntToString(from = 131072, to = "FOCUS_BEFORE_DESCENDANTS"), @ViewDebug.IntToString(from = 262144, to = "FOCUS_AFTER_DESCENDANTS"), @ViewDebug.IntToString(from = 393216, to = "FOCUS_BLOCK_DESCENDANTS")})
    public int getDescendantFocusability() {
        return this.delegate.getDescendantFocusability();
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestChildFocus(View child, View focused) {
        this.delegate.requestChildFocus(child, focused);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void focusableViewAvailable(View v) {
        this.delegate.focusableViewAvailable(v);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public boolean showContextMenuForChild(View originalView) {
        return this.delegate.showContextMenuForChild(originalView);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public ActionMode startActionModeForChild(View originalView, ActionMode.Callback callback) {
        return this.delegate.startActionModeForChild(originalView, callback);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public View focusSearch(View focused, int direction) {
        return this.delegate.focusSearch(focused, direction);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public boolean requestChildRectangleOnScreen(View child, Rect rectangle, boolean immediate) {
        return this.delegate.requestChildRectangleOnScreen(child, rectangle, immediate);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public boolean requestSendAccessibilityEvent(View child, AccessibilityEvent event) {
        return this.delegate.requestSendAccessibilityEvent(child, event);
    }

    @Override // android.view.ViewGroup
    public boolean onRequestSendAccessibilityEvent(View child, AccessibilityEvent event) {
        return this.delegate.onRequestSendAccessibilityEvent(child, event);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchUnhandledMove(View focused, int direction) {
        return this.delegate.dispatchUnhandledMove(focused, direction);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void clearChildFocus(View child) {
        this.delegate.clearChildFocus(child);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void clearFocus() {
        this.delegate.clearFocus();
    }

    @Override // android.view.ViewGroup
    public View getFocusedChild() {
        return this.delegate.getFocusedChild();
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean hasFocus() {
        return this.delegate.hasFocus();
    }

    @Override // android.view.ViewGroup, android.view.View
    public View findFocus() {
        return this.delegate.findFocus();
    }

    @Override // android.view.View
    public boolean hasFocusable() {
        return this.delegate.hasFocusable();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addFocusables(ArrayList<View> views, int direction, int focusableMode) {
        this.delegate.addFocusables(views, direction, focusableMode);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void findViewsWithText(ArrayList<View> outViews, CharSequence text, int flags) {
        this.delegate.findViewsWithText(outViews, text, flags);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchWindowFocusChanged(boolean hasFocus) {
        this.delegate.dispatchWindowFocusChanged(hasFocus);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addTouchables(ArrayList<View> views) {
        this.delegate.addTouchables(views);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchDisplayHint(int hint) {
        this.delegate.dispatchDisplayHint(hint);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchWindowVisibilityChanged(int visibility) {
        this.delegate.dispatchWindowVisibilityChanged(visibility);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchConfigurationChanged(Configuration newConfig) {
        this.delegate.dispatchConfigurationChanged(newConfig);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void recomputeViewAttributes(View child) {
        this.delegate.recomputeViewAttributes(child);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void bringChildToFront(View child) {
        this.delegate.bringChildToFront(child);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchDragEvent(DragEvent event) {
        return this.delegate.dispatchDragEvent(event);
    }

    @Override // android.view.ViewGroup, android.view.View
    @TargetApi(16)
    public void dispatchWindowSystemUiVisiblityChanged(int visible) {
        this.delegate.dispatchWindowSystemUiVisiblityChanged(visible);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchSystemUiVisibilityChanged(int visible) {
        this.delegate.dispatchSystemUiVisibilityChanged(visible);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEventPreIme(KeyEvent event) {
        return this.delegate.dispatchKeyEventPreIme(event);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent event) {
        return this.delegate.dispatchKeyEvent(event);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyShortcutEvent(KeyEvent event) {
        return this.delegate.dispatchKeyShortcutEvent(event);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTrackballEvent(MotionEvent event) {
        return this.delegate.dispatchTrackballEvent(event);
    }

    @Override // android.view.ViewGroup, android.view.View
    @TargetApi(16)
    public void addChildrenForAccessibility(ArrayList<View> childrenForAccessibility) {
        this.delegate.addChildrenForAccessibility(childrenForAccessibility);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptHoverEvent(MotionEvent event) {
        return this.delegate.onInterceptHoverEvent(event);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent ev) {
        return this.delegate.dispatchTouchEvent(ev);
    }

    @Override // android.view.ViewGroup
    public void setMotionEventSplittingEnabled(boolean split) {
        this.delegate.setMotionEventSplittingEnabled(split);
    }

    @Override // android.view.ViewGroup
    public boolean isMotionEventSplittingEnabled() {
        return this.delegate.isMotionEventSplittingEnabled();
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestDisallowInterceptTouchEvent(boolean disallowIntercept) {
        this.delegate.requestDisallowInterceptTouchEvent(disallowIntercept);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        return this.delegate.onInterceptTouchEvent(ev);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean requestFocus(int direction, Rect previouslyFocusedRect) {
        return this.delegate.requestFocus(direction, previouslyFocusedRect);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    @TargetApi(19)
    public void notifySubtreeAccessibilityStateChanged(View child, View source, int changeType) {
        this.delegate.notifySubtreeAccessibilityStateChanged(child, source, changeType);
    }

    @Override // android.view.ViewGroup, android.view.View
    @TargetApi(18)
    /* renamed from: getOverlay */
    public ViewGroupOverlay mo1096getOverlay() {
        return this.delegate.getOverlay();
    }

    @Override // android.view.ViewGroup
    @TargetApi(18)
    public boolean getClipChildren() {
        return this.delegate.getClipChildren();
    }

    @Override // android.view.ViewGroup
    public void setClipChildren(boolean clipChildren) {
        this.delegate.setClipChildren(clipChildren);
    }

    @Override // android.view.ViewGroup
    public void setClipToPadding(boolean clipToPadding) {
        this.delegate.setClipToPadding(clipToPadding);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchSetSelected(boolean selected) {
        this.delegate.dispatchSetSelected(selected);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchSetActivated(boolean activated) {
        this.delegate.dispatchSetActivated(activated);
    }

    @Override // android.view.ViewGroup
    public void addView(View child) {
        this.delegate.addView(child);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index) {
        this.delegate.addView(child, index);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int width, int height) {
        this.delegate.addView(child, width, height);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void addView(View child, ViewGroup.LayoutParams params) {
        this.delegate.addView(child, params);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        this.delegate.addView(child, index, params);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void updateViewLayout(View view, ViewGroup.LayoutParams params) {
        this.delegate.updateViewLayout(view, params);
    }

    @Override // android.view.ViewGroup
    public void setOnHierarchyChangeListener(ViewGroup.OnHierarchyChangeListener listener) {
        this.delegate.setOnHierarchyChangeListener(listener);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void removeView(View view) {
        this.delegate.removeView(view);
    }

    @Override // android.view.ViewGroup
    public void removeViewInLayout(View view) {
        this.delegate.removeViewInLayout(view);
    }

    @Override // android.view.ViewGroup
    public void removeViewsInLayout(int start, int count) {
        this.delegate.removeViewsInLayout(start, count);
    }

    @Override // android.view.ViewGroup
    public void removeViewAt(int index) {
        this.delegate.removeViewAt(index);
    }

    @Override // android.view.ViewGroup
    public void removeViews(int start, int count) {
        this.delegate.removeViews(start, count);
    }

    @Override // android.view.ViewGroup
    public void setLayoutTransition(LayoutTransition transition) {
        this.delegate.setLayoutTransition(transition);
    }

    @Override // android.view.ViewGroup
    public LayoutTransition getLayoutTransition() {
        return this.delegate.getLayoutTransition();
    }

    @Override // android.view.ViewGroup
    public void removeAllViews() {
        this.delegate.removeAllViews();
    }

    @Override // android.view.ViewGroup
    public void removeAllViewsInLayout() {
        this.delegate.removeAllViewsInLayout();
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public ViewParent invalidateChildInParent(int[] location, Rect dirty) {
        return this.delegate.invalidateChildInParent(location, dirty);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public boolean getChildVisibleRect(View child, Rect r, Point offset) {
        return this.delegate.getChildVisibleRect(child, r, offset);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
    }

    @Override // android.view.ViewGroup
    public void startLayoutAnimation() {
        this.delegate.startLayoutAnimation();
    }

    @Override // android.view.ViewGroup
    public void scheduleLayoutAnimation() {
        this.delegate.scheduleLayoutAnimation();
    }

    @Override // android.view.ViewGroup
    public void setLayoutAnimation(LayoutAnimationController controller) {
        this.delegate.setLayoutAnimation(controller);
    }

    @Override // android.view.ViewGroup
    public LayoutAnimationController getLayoutAnimation() {
        return this.delegate.getLayoutAnimation();
    }

    @Override // android.view.ViewGroup
    @ViewDebug.ExportedProperty
    public boolean isAnimationCacheEnabled() {
        return this.delegate.isAnimationCacheEnabled();
    }

    @Override // android.view.ViewGroup
    public void setAnimationCacheEnabled(boolean enabled) {
        this.delegate.setAnimationCacheEnabled(enabled);
    }

    @Override // android.view.ViewGroup
    @ViewDebug.ExportedProperty(category = "drawing")
    public boolean isAlwaysDrawnWithCacheEnabled() {
        return this.delegate.isAlwaysDrawnWithCacheEnabled();
    }

    @Override // android.view.ViewGroup
    public void setAlwaysDrawnWithCacheEnabled(boolean always) {
        this.delegate.setAlwaysDrawnWithCacheEnabled(always);
    }

    @Override // android.view.ViewGroup
    @ViewDebug.ExportedProperty(category = "drawing", mapping = {@ViewDebug.IntToString(from = 0, to = "NONE"), @ViewDebug.IntToString(from = 1, to = "ANIMATION"), @ViewDebug.IntToString(from = 2, to = "SCROLLING"), @ViewDebug.IntToString(from = 3, to = "ALL")})
    public int getPersistentDrawingCache() {
        return this.delegate.getPersistentDrawingCache();
    }

    @Override // android.view.ViewGroup
    public void setPersistentDrawingCache(int drawingCacheToKeep) {
        this.delegate.setPersistentDrawingCache(drawingCacheToKeep);
    }

    @Override // android.view.ViewGroup
    @TargetApi(18)
    public int getLayoutMode() {
        return this.delegate.getLayoutMode();
    }

    @Override // android.view.ViewGroup
    @TargetApi(18)
    public void setLayoutMode(int layoutMode) {
        this.delegate.setLayoutMode(layoutMode);
    }

    @Override // android.view.ViewGroup
    public int indexOfChild(View child) {
        return this.delegate.indexOfChild(child);
    }

    @Override // android.view.ViewGroup
    public int getChildCount() {
        return this.delegate.getChildCount();
    }

    @Override // android.view.ViewGroup
    public View getChildAt(int index) {
        return this.delegate.getChildAt(index);
    }

    public static int getChildMeasureSpec(int spec, int padding, int childDimension) {
        return ViewGroup.getChildMeasureSpec(spec, padding, childDimension);
    }

    @Override // android.view.ViewGroup
    public void clearDisappearingChildren() {
        this.delegate.clearDisappearingChildren();
    }

    @Override // android.view.ViewGroup
    public void startViewTransition(View view) {
        this.delegate.startViewTransition(view);
    }

    @Override // android.view.ViewGroup
    public void endViewTransition(View view) {
        this.delegate.endViewTransition(view);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean gatherTransparentRegion(Region region) {
        return this.delegate.gatherTransparentRegion(region);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestTransparentRegion(View child) {
        this.delegate.requestTransparentRegion(child);
    }

    @Override // android.view.ViewGroup
    public Animation.AnimationListener getLayoutAnimationListener() {
        return this.delegate.getLayoutAnimationListener();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void jumpDrawablesToCurrentState() {
        this.delegate.jumpDrawablesToCurrentState();
    }

    @Override // android.view.ViewGroup
    public void setAddStatesFromChildren(boolean addsStates) {
        this.delegate.setAddStatesFromChildren(addsStates);
    }

    @Override // android.view.ViewGroup
    public boolean addStatesFromChildren() {
        return this.delegate.addStatesFromChildren();
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void childDrawableStateChanged(View child) {
        this.delegate.childDrawableStateChanged(child);
    }

    @Override // android.view.ViewGroup
    public void setLayoutAnimationListener(Animation.AnimationListener animationListener) {
        this.delegate.setLayoutAnimationListener(animationListener);
    }

    @Override // android.view.ViewGroup
    public boolean shouldDelayChildPressedState() {
        return this.delegate.shouldDelayChildPressedState();
    }
}
