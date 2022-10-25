package com.facebook.drawee.view;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.MotionEvent;
import com.facebook.common.internal.Objects;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.logging.FLog;
import com.facebook.common.memory.MemoryUiTrimmable;
import com.facebook.common.memory.MemoryUiTrimmableRegistry;
import com.facebook.drawee.components.DraweeEventTracker;
import com.facebook.drawee.drawable.VisibilityAwareDrawable;
import com.facebook.drawee.drawable.VisibilityCallback;
import com.facebook.drawee.interfaces.DraweeController;
import com.facebook.drawee.interfaces.DraweeHierarchy;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class DraweeHolder<DH extends DraweeHierarchy> implements VisibilityCallback, MemoryUiTrimmable {
    private DH mHierarchy;
    private boolean mIsControllerAttached = false;
    private boolean mIsHolderAttached = false;
    private boolean mIsVisible = true;
    private boolean mTrimmed = false;
    private DraweeController mController = null;
    private final DraweeEventTracker mEventTracker = DraweeEventTracker.newInstance();

    public static <DH extends DraweeHierarchy> DraweeHolder<DH> create(@Nullable DH hierarchy, Context context) {
        DraweeHolder<DH> holder = new DraweeHolder<>(hierarchy);
        holder.registerWithContext(context);
        MemoryUiTrimmableRegistry.registerUiTrimmable(holder);
        return holder;
    }

    public void registerWithContext(Context context) {
    }

    public DraweeHolder(@Nullable DH hierarchy) {
        if (hierarchy != null) {
            setHierarchy(hierarchy);
        }
    }

    public void onAttach() {
        this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_HOLDER_ATTACH);
        this.mIsHolderAttached = true;
        attachOrDetachController();
    }

    public boolean isAttached() {
        return this.mIsHolderAttached;
    }

    public void onDetach() {
        this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_HOLDER_DETACH);
        this.mIsHolderAttached = false;
        attachOrDetachController();
    }

    @Override // com.facebook.common.memory.MemoryUiTrimmable
    public void trim() {
        this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_HOLDER_TRIM);
        this.mTrimmed = true;
        attachOrDetachController();
    }

    @Override // com.facebook.common.memory.MemoryUiTrimmable
    public void untrim() {
        this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_HOLDER_UNTRIM);
        this.mTrimmed = false;
        attachOrDetachController();
    }

    public boolean onTouchEvent(MotionEvent event) {
        if (!isControllerValid()) {
            return false;
        }
        return this.mController.onTouchEvent(event);
    }

    @Override // com.facebook.drawee.drawable.VisibilityCallback
    public void onVisibilityChange(boolean isVisible) {
        if (this.mIsVisible != isVisible) {
            this.mEventTracker.recordEvent(isVisible ? DraweeEventTracker.Event.ON_DRAWABLE_SHOW : DraweeEventTracker.Event.ON_DRAWABLE_HIDE);
            this.mIsVisible = isVisible;
            attachOrDetachController();
        }
    }

    @Override // com.facebook.drawee.drawable.VisibilityCallback
    public void onDraw() {
        if (!this.mIsControllerAttached) {
            if (!this.mTrimmed) {
                FLog.wtf(DraweeEventTracker.class, "%x: Draw requested for a non-attached controller %x. %s", Integer.valueOf(System.identityHashCode(this)), Integer.valueOf(System.identityHashCode(this.mController)), toString());
            }
            this.mTrimmed = false;
            this.mIsHolderAttached = true;
            this.mIsVisible = true;
            attachOrDetachController();
        }
    }

    private void setVisibilityCallback(@Nullable VisibilityCallback visibilityCallback) {
        Drawable drawable = getTopLevelDrawable();
        if (drawable instanceof VisibilityAwareDrawable) {
            ((VisibilityAwareDrawable) drawable).setVisibilityCallback(visibilityCallback);
        }
    }

    public void setController(@Nullable DraweeController draweeController) {
        boolean wasAttached = this.mIsControllerAttached;
        if (wasAttached) {
            detachController();
        }
        if (isControllerValid()) {
            this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_CLEAR_OLD_CONTROLLER);
            this.mController.setHierarchy(null);
        }
        this.mController = draweeController;
        if (this.mController != null) {
            this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_SET_CONTROLLER);
            this.mController.setHierarchy(this.mHierarchy);
        } else {
            this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_CLEAR_CONTROLLER);
        }
        if (wasAttached) {
            attachController();
        }
    }

    @Nullable
    public DraweeController getController() {
        return this.mController;
    }

    public void setHierarchy(DH hierarchy) {
        this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_SET_HIERARCHY);
        boolean isControllerValid = isControllerValid();
        setVisibilityCallback(null);
        this.mHierarchy = (DH) Preconditions.checkNotNull(hierarchy);
        Drawable drawable = this.mHierarchy.getTopLevelDrawable();
        onVisibilityChange(drawable == null || drawable.isVisible());
        setVisibilityCallback(this);
        if (isControllerValid) {
            this.mController.setHierarchy(hierarchy);
        }
    }

    public DH getHierarchy() {
        return (DH) Preconditions.checkNotNull(this.mHierarchy);
    }

    public boolean hasHierarchy() {
        return this.mHierarchy != null;
    }

    public Drawable getTopLevelDrawable() {
        if (this.mHierarchy == null) {
            return null;
        }
        return this.mHierarchy.getTopLevelDrawable();
    }

    protected DraweeEventTracker getDraweeEventTracker() {
        return this.mEventTracker;
    }

    private void attachController() {
        if (!this.mIsControllerAttached) {
            this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_ATTACH_CONTROLLER);
            this.mIsControllerAttached = true;
            if (this.mController != null && this.mController.getHierarchy() != null) {
                this.mController.onAttach();
            }
        }
    }

    private void detachController() {
        if (this.mIsControllerAttached) {
            this.mEventTracker.recordEvent(DraweeEventTracker.Event.ON_DETACH_CONTROLLER);
            this.mIsControllerAttached = false;
            if (isControllerValid()) {
                this.mController.onDetach();
            }
        }
    }

    private void attachOrDetachController() {
        if (this.mIsHolderAttached && this.mIsVisible && !this.mTrimmed) {
            attachController();
        } else {
            detachController();
        }
    }

    public String toString() {
        return Objects.toStringHelper(this).add("controllerAttached", this.mIsControllerAttached).add("holderAttached", this.mIsHolderAttached).add("drawableVisible", this.mIsVisible).add("trimmed", this.mTrimmed).add("events", this.mEventTracker.toString()).toString();
    }

    private boolean isControllerValid() {
        return this.mController != null && this.mController.getHierarchy() == getHierarchy();
    }
}
