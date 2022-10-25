package android.support.v7.preference;

import android.support.annotation.IdRes;
import android.support.annotation.RestrictTo;
import android.support.v7.widget.RecyclerView;
import android.util.SparseArray;
import android.view.View;
/* loaded from: classes.dex */
public class PreferenceViewHolder extends RecyclerView.ViewHolder {
    private final SparseArray<View> mCachedViews;
    private boolean mDividerAllowedAbove;
    private boolean mDividerAllowedBelow;

    @RestrictTo({RestrictTo.Scope.TESTS})
    public PreferenceViewHolder(View itemView) {
        super(itemView);
        this.mCachedViews = new SparseArray<>(4);
        this.mCachedViews.put(16908310, itemView.findViewById(16908310));
        this.mCachedViews.put(16908304, itemView.findViewById(16908304));
        this.mCachedViews.put(16908294, itemView.findViewById(16908294));
        this.mCachedViews.put(R.id.icon_frame, itemView.findViewById(R.id.icon_frame));
        this.mCachedViews.put(AndroidResources.ANDROID_R_ICON_FRAME, itemView.findViewById(AndroidResources.ANDROID_R_ICON_FRAME));
    }

    public View findViewById(@IdRes int id) {
        View cachedView = this.mCachedViews.get(id);
        if (cachedView == null) {
            View v = this.itemView.findViewById(id);
            if (v != null) {
                this.mCachedViews.put(id, v);
            }
            return v;
        }
        return cachedView;
    }

    public boolean isDividerAllowedAbove() {
        return this.mDividerAllowedAbove;
    }

    public void setDividerAllowedAbove(boolean allowed) {
        this.mDividerAllowedAbove = allowed;
    }

    public boolean isDividerAllowedBelow() {
        return this.mDividerAllowedBelow;
    }

    public void setDividerAllowedBelow(boolean allowed) {
        this.mDividerAllowedBelow = allowed;
    }
}
