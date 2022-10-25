package com.vk.imageloader.view.zoomable;

import android.graphics.RectF;
import android.view.GestureDetector;
import android.view.MotionEvent;
import com.facebook.drawee.generic.GenericDraweeHierarchy;
import com.vk.imageloader.view.VKDraweeView;
/* loaded from: classes2.dex */
public class DefaultOnDoubleTapListener implements GestureDetector.OnDoubleTapListener {
    private Attacher mAttacher;

    public DefaultOnDoubleTapListener(Attacher attacher) {
        setPhotoDraweeViewAttacher(attacher);
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onSingleTapConfirmed(MotionEvent e) {
        VKDraweeView<GenericDraweeHierarchy> draweeView;
        RectF displayRect;
        if (this.mAttacher == null || (draweeView = this.mAttacher.getDraweeView()) == null) {
            return false;
        }
        if (this.mAttacher.getOnPhotoTapListener() != null && (displayRect = this.mAttacher.getDisplayRect()) != null) {
            float x = e.getX();
            float y = e.getY();
            if (displayRect.contains(x, y)) {
                float xResult = (x - displayRect.left) / displayRect.width();
                float yResult = (y - displayRect.top) / displayRect.height();
                this.mAttacher.getOnPhotoTapListener().onPhotoTap(draweeView, xResult, yResult);
                return true;
            }
        }
        if (this.mAttacher.getOnViewTapListener() == null) {
            return false;
        }
        this.mAttacher.getOnViewTapListener().onViewTap(draweeView, e.getX(), e.getY());
        return true;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onDoubleTap(MotionEvent event) {
        if (this.mAttacher == null) {
            return false;
        }
        try {
            float scale = this.mAttacher.getScale();
            float x = event.getX();
            float y = event.getY();
            if (scale < this.mAttacher.getMediumScale()) {
                this.mAttacher.setScale(this.mAttacher.getMediumScale(), x, y, true);
            } else if (scale >= this.mAttacher.getMediumScale() && scale < this.mAttacher.getMaximumScale()) {
                this.mAttacher.setScale(this.mAttacher.getMaximumScale(), x, y, true);
            } else {
                this.mAttacher.setScale(this.mAttacher.getMinimumScale(), x, y, true);
            }
            return true;
        } catch (Exception e) {
            return true;
        }
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onDoubleTapEvent(MotionEvent event) {
        return false;
    }

    public void setPhotoDraweeViewAttacher(Attacher attacher) {
        this.mAttacher = attacher;
    }
}
