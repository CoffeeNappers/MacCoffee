package com.vkontakte.android.ui;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.media.RingtoneManager;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.support.v7.preference.Preference;
import android.text.TextUtils;
import android.util.AttributeSet;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class RingtonePreference extends Preference implements PreferenceManager.OnActivityResultListener {
    private static final String TAG = "RingtonePreference";
    private int mRequestCode;
    private int mRingtoneType;
    private boolean mShowDefault;
    private boolean mShowSilent;

    public RingtonePreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.RingtonePreference, defStyleAttr, defStyleRes);
        this.mRingtoneType = a.getInt(2, 1);
        this.mShowDefault = a.getBoolean(0, true);
        this.mShowSilent = a.getBoolean(1, true);
        a.recycle();
    }

    public RingtonePreference(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public RingtonePreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.RingtonePreference);
        this.mRingtoneType = a.getInt(2, 1);
        this.mShowDefault = a.getBoolean(0, true);
        this.mShowSilent = a.getBoolean(1, true);
        a.recycle();
    }

    public RingtonePreference(Context context) {
        this(context, null);
    }

    public int getRingtoneType() {
        return this.mRingtoneType;
    }

    public void setRingtoneType(int type) {
        this.mRingtoneType = type;
    }

    public boolean getShowDefault() {
        return this.mShowDefault;
    }

    public void setShowDefault(boolean showDefault) {
        this.mShowDefault = showDefault;
    }

    public boolean getShowSilent() {
        return this.mShowSilent;
    }

    public void setShowSilent(boolean showSilent) {
        this.mShowSilent = showSilent;
    }

    public void startSelectRingtone(Fragment fragment) {
        Intent intent = new Intent("android.intent.action.RINGTONE_PICKER");
        onPrepareRingtonePickerIntent(intent);
        fragment.startActivityForResult(intent, this.mRequestCode);
    }

    protected void onPrepareRingtonePickerIntent(Intent ringtonePickerIntent) {
        ringtonePickerIntent.putExtra("android.intent.extra.ringtone.EXISTING_URI", onRestoreRingtone());
        ringtonePickerIntent.putExtra("android.intent.extra.ringtone.SHOW_DEFAULT", this.mShowDefault);
        if (this.mShowDefault) {
            ringtonePickerIntent.putExtra("android.intent.extra.ringtone.DEFAULT_URI", RingtoneManager.getDefaultUri(getRingtoneType()));
        }
        ringtonePickerIntent.putExtra("android.intent.extra.ringtone.SHOW_SILENT", this.mShowSilent);
        ringtonePickerIntent.putExtra("android.intent.extra.ringtone.TYPE", this.mRingtoneType);
        ringtonePickerIntent.putExtra("android.intent.extra.ringtone.TITLE", getTitle());
    }

    protected void onSaveRingtone(Uri ringtoneUri) {
        persistString(ringtoneUri != null ? ringtoneUri.toString() : "");
    }

    protected Uri onRestoreRingtone() {
        String uriString = getPersistedString(null);
        if (!TextUtils.isEmpty(uriString)) {
            return Uri.parse(uriString);
        }
        return null;
    }

    @Override // android.support.v7.preference.Preference
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return a.getString(index);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.Preference
    public void onSetInitialValue(boolean restorePersistedValue, Object defaultValueObj) {
        String defaultValue = (String) defaultValueObj;
        if (!restorePersistedValue && !TextUtils.isEmpty(defaultValue)) {
            onSaveRingtone(Uri.parse(defaultValue));
        }
    }

    @Override // android.preference.PreferenceManager.OnActivityResultListener
    public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == this.mRequestCode) {
            if (data != null) {
                Uri uri = (Uri) data.getParcelableExtra("android.intent.extra.ringtone.PICKED_URI");
                if (callChangeListener(uri != null ? uri.toString() : "")) {
                    onSaveRingtone(uri);
                }
            }
            return true;
        }
        return false;
    }
}
