package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import com.vk.imageloader.view.VKImageView;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class StateListenersImageView extends VKImageView {
    private final List<View.OnAttachStateChangeListener> onAttachStateChangeListeners;

    public StateListenersImageView(Context context) {
        super(context);
        this.onAttachStateChangeListeners = new ArrayList();
    }

    public StateListenersImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.onAttachStateChangeListeners = new ArrayList();
    }

    public StateListenersImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.onAttachStateChangeListeners = new ArrayList();
    }

    @Override // android.view.View
    public void addOnAttachStateChangeListener(View.OnAttachStateChangeListener listener) {
        super.addOnAttachStateChangeListener(listener);
        synchronized (this.onAttachStateChangeListeners) {
            this.onAttachStateChangeListeners.add(listener);
        }
    }

    @Override // android.view.View
    public void removeOnAttachStateChangeListener(View.OnAttachStateChangeListener listener) {
        super.removeOnAttachStateChangeListener(listener);
        synchronized (this.onAttachStateChangeListeners) {
            this.onAttachStateChangeListeners.remove(listener);
        }
    }

    public List<View.OnAttachStateChangeListener> getOnAttachStateChangeListeners() {
        return this.onAttachStateChangeListeners;
    }
}
