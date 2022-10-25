package com.vkontakte.android.ui.holder;

import android.content.Context;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.ui.holder.RecyclerHolderRef.Ref;
import java.lang.ref.WeakReference;
/* loaded from: classes3.dex */
public class RecyclerHolderRef<T extends Ref> extends RecyclerHolder<T> {
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public /* bridge */ /* synthetic */ void onBind(Object obj) {
        onBind((RecyclerHolderRef<T>) ((Ref) obj));
    }

    /* loaded from: classes3.dex */
    public static abstract class Ref<T extends RecyclerHolderRef> {
        private WeakReference<T> weakReference = null;

        protected abstract void bind(@NonNull T t);

        void b(T holder) {
            this.weakReference = new WeakReference<>(holder);
            bind(holder);
        }

        public T getHolder() {
            if (this.weakReference == null) {
                return null;
            }
            return this.weakReference.get();
        }
    }

    public RecyclerHolderRef(View itemView) {
        super(itemView);
    }

    public RecyclerHolderRef(@LayoutRes int layoutId, @NonNull Context context) {
        super(layoutId, context);
    }

    public RecyclerHolderRef(@LayoutRes int layoutId, @NonNull ViewGroup parent) {
        super(layoutId, parent);
    }

    public void onBind(T item) {
        item.b(this);
    }
}
