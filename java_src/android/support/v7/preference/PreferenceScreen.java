package android.support.v7.preference;

import android.content.Context;
import android.support.annotation.RestrictTo;
import android.support.v4.content.res.TypedArrayUtils;
import android.support.v7.preference.PreferenceManager;
import android.util.AttributeSet;
/* loaded from: classes.dex */
public final class PreferenceScreen extends PreferenceGroup {
    private boolean mShouldUseGeneratedIds;

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public PreferenceScreen(Context context, AttributeSet attrs) {
        super(context, attrs, TypedArrayUtils.getAttr(context, R.attr.preferenceScreenStyle, 16842891));
        this.mShouldUseGeneratedIds = true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.Preference
    public void onClick() {
        PreferenceManager.OnNavigateToScreenListener listener;
        if (getIntent() == null && getFragment() == null && getPreferenceCount() != 0 && (listener = getPreferenceManager().getOnNavigateToScreenListener()) != null) {
            listener.onNavigateToScreen(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.PreferenceGroup
    public boolean isOnSameScreenAsChildren() {
        return false;
    }

    public boolean shouldUseGeneratedIds() {
        return this.mShouldUseGeneratedIds;
    }

    public void setShouldUseGeneratedIds(boolean shouldUseGeneratedIds) {
        if (isAttached()) {
            throw new IllegalStateException("Cannot change the usage of generated IDs while attached to the preference hierarchy");
        }
        this.mShouldUseGeneratedIds = shouldUseGeneratedIds;
    }
}
