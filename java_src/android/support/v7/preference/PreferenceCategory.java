package android.support.v7.preference;

import android.content.Context;
import android.support.v4.content.res.TypedArrayUtils;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.util.AttributeSet;
/* loaded from: classes.dex */
public class PreferenceCategory extends PreferenceGroup {
    private static final String TAG = "PreferenceCategory";

    public PreferenceCategory(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public PreferenceCategory(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public PreferenceCategory(Context context, AttributeSet attrs) {
        this(context, attrs, TypedArrayUtils.getAttr(context, R.attr.preferenceCategoryStyle, 16842892));
    }

    public PreferenceCategory(Context context) {
        this(context, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.PreferenceGroup
    public boolean onPrepareAddPreference(Preference preference) {
        if (preference instanceof PreferenceCategory) {
            throw new IllegalArgumentException("Cannot add a PreferenceCategory directly to a PreferenceCategory");
        }
        return super.onPrepareAddPreference(preference);
    }

    @Override // android.support.v7.preference.Preference
    public boolean isEnabled() {
        return false;
    }

    @Override // android.support.v7.preference.Preference
    public boolean shouldDisableDependents() {
        return !super.isEnabled();
    }

    @Override // android.support.v7.preference.Preference
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfoCompat info) {
        super.onInitializeAccessibilityNodeInfo(info);
        AccessibilityNodeInfoCompat.CollectionItemInfoCompat existingItemInfo = info.getCollectionItemInfo();
        if (existingItemInfo != null) {
            AccessibilityNodeInfoCompat.CollectionItemInfoCompat newItemInfo = AccessibilityNodeInfoCompat.CollectionItemInfoCompat.obtain(existingItemInfo.getRowIndex(), existingItemInfo.getRowSpan(), existingItemInfo.getColumnIndex(), existingItemInfo.getColumnSpan(), true, existingItemInfo.isSelected());
            info.setCollectionItemInfo(newItemInfo);
        }
    }
}
