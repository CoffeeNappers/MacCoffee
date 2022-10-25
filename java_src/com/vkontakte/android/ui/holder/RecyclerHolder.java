package com.vkontakte.android.ui.holder;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.support.annotation.ArrayRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.IdRes;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.PluralsRes;
import android.support.annotation.StringRes;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.ViewUtils;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public abstract class RecyclerHolder<T> extends UsableRecyclerView.ViewHolder {
    protected T item;
    private final Context mContext;
    private ViewGroup mParent;

    public abstract void onBind(T t);

    public RecyclerHolder(View itemView) {
        super(itemView);
        this.mParent = null;
        this.mContext = itemView.getContext();
    }

    public RecyclerHolder(View itemView, @NonNull ViewGroup parent) {
        super(itemView);
        this.mParent = null;
        this.mContext = itemView.getContext();
        this.mParent = parent;
    }

    public RecyclerHolder(@LayoutRes int layoutId, @NonNull Context context) {
        this(LayoutInflater.from(context).inflate(layoutId, (ViewGroup) null));
    }

    public RecyclerHolder(@LayoutRes int layoutId, @NonNull ViewGroup parent) {
        this(LayoutInflater.from(parent.getContext()).inflate(layoutId, parent, false));
        this.mParent = parent;
    }

    public RecyclerHolder(Context context, @LayoutRes int layout, ViewGroup parent) {
        super(LayoutInflater.from(context).inflate(layout, parent, false));
        this.mParent = null;
        this.mContext = context;
    }

    public final void rebind() {
        bind(getItem());
    }

    public final void bind(T item) {
        this.item = item;
        onBind(item);
    }

    /* JADX WARN: Incorrect return type in method signature: <T:Landroid/view/View;>(I)TT; */
    public View $(@IdRes int id) {
        return this.itemView.findViewById(id);
    }

    /* JADX WARN: Incorrect return type in method signature: <T:Landroid/content/Context;>()TT; */
    public Context getContext() {
        return this.mContext;
    }

    public ViewGroup getParent() {
        return this.mParent;
    }

    public T getItem() {
        return this.item;
    }

    public Resources getResources() {
        return getContext().getResources();
    }

    public String getString(@StringRes int id) throws Resources.NotFoundException {
        return getResources().getString(id);
    }

    public String getString(@StringRes int id, Object... formatArgs) throws Resources.NotFoundException {
        return getResources().getString(id, formatArgs);
    }

    public String getQuantityString(@PluralsRes int id, int quantity, Object... formatArgs) throws Resources.NotFoundException {
        return getResources().getQuantityString(id, quantity, formatArgs);
    }

    public String getQuantityString(@PluralsRes int id, int quantity) throws Resources.NotFoundException {
        return getResources().getQuantityString(id, quantity);
    }

    public String[] getStringArray(@ArrayRes int id) throws Resources.NotFoundException {
        return getResources().getStringArray(id);
    }

    public Drawable getDrawable(@DrawableRes int id) throws Resources.NotFoundException {
        return ViewUtils.getDrawable(getContext(), id);
    }
}
