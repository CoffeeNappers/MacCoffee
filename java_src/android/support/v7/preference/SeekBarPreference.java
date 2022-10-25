package android.support.v7.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v7.preference.Preference;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.SeekBar;
import android.widget.TextView;
/* loaded from: classes.dex */
public class SeekBarPreference extends Preference {
    private static final String TAG = "SeekBarPreference";
    private boolean mAdjustable;
    private int mMax;
    private int mMin;
    private SeekBar mSeekBar;
    private SeekBar.OnSeekBarChangeListener mSeekBarChangeListener;
    private int mSeekBarIncrement;
    private View.OnKeyListener mSeekBarKeyListener;
    private int mSeekBarValue;
    private TextView mSeekBarValueTextView;
    private boolean mShowSeekBarValue;
    private boolean mTrackingTouch;

    public SeekBarPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mSeekBarChangeListener = new SeekBar.OnSeekBarChangeListener() { // from class: android.support.v7.preference.SeekBarPreference.1
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser && !SeekBarPreference.this.mTrackingTouch) {
                    SeekBarPreference.this.syncValueInternal(seekBar);
                }
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
                SeekBarPreference.this.mTrackingTouch = true;
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
                SeekBarPreference.this.mTrackingTouch = false;
                if (seekBar.getProgress() + SeekBarPreference.this.mMin != SeekBarPreference.this.mSeekBarValue) {
                    SeekBarPreference.this.syncValueInternal(seekBar);
                }
            }
        };
        this.mSeekBarKeyListener = new View.OnKeyListener() { // from class: android.support.v7.preference.SeekBarPreference.2
            @Override // android.view.View.OnKeyListener
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() != 0) {
                    return false;
                }
                if ((!SeekBarPreference.this.mAdjustable && (keyCode == 21 || keyCode == 22)) || keyCode == 23 || keyCode == 66) {
                    return false;
                }
                if (SeekBarPreference.this.mSeekBar != null) {
                    return SeekBarPreference.this.mSeekBar.onKeyDown(keyCode, event);
                }
                Log.e(SeekBarPreference.TAG, "SeekBar view is null and hence cannot be adjusted.");
                return false;
            }
        };
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SeekBarPreference, defStyleAttr, defStyleRes);
        this.mMin = a.getInt(R.styleable.SeekBarPreference_min, 0);
        setMax(a.getInt(R.styleable.SeekBarPreference_android_max, 100));
        setSeekBarIncrement(a.getInt(R.styleable.SeekBarPreference_seekBarIncrement, 0));
        this.mAdjustable = a.getBoolean(R.styleable.SeekBarPreference_adjustable, true);
        this.mShowSeekBarValue = a.getBoolean(R.styleable.SeekBarPreference_showSeekBarValue, true);
        a.recycle();
    }

    public SeekBarPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public SeekBarPreference(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.seekBarPreferenceStyle);
    }

    public SeekBarPreference(Context context) {
        this(context, null);
    }

    @Override // android.support.v7.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder view) {
        super.onBindViewHolder(view);
        view.itemView.setOnKeyListener(this.mSeekBarKeyListener);
        this.mSeekBar = (SeekBar) view.findViewById(R.id.seekbar);
        this.mSeekBarValueTextView = (TextView) view.findViewById(R.id.seekbar_value);
        if (this.mShowSeekBarValue) {
            this.mSeekBarValueTextView.setVisibility(0);
        } else {
            this.mSeekBarValueTextView.setVisibility(8);
            this.mSeekBarValueTextView = null;
        }
        if (this.mSeekBar == null) {
            Log.e(TAG, "SeekBar view is null in onBindViewHolder.");
            return;
        }
        this.mSeekBar.setOnSeekBarChangeListener(this.mSeekBarChangeListener);
        this.mSeekBar.setMax(this.mMax - this.mMin);
        if (this.mSeekBarIncrement != 0) {
            this.mSeekBar.setKeyProgressIncrement(this.mSeekBarIncrement);
        } else {
            this.mSeekBarIncrement = this.mSeekBar.getKeyProgressIncrement();
        }
        this.mSeekBar.setProgress(this.mSeekBarValue - this.mMin);
        if (this.mSeekBarValueTextView != null) {
            this.mSeekBarValueTextView.setText(String.valueOf(this.mSeekBarValue));
        }
        this.mSeekBar.setEnabled(isEnabled());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.Preference
    public void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        setValue(restoreValue ? getPersistedInt(this.mSeekBarValue) : ((Integer) defaultValue).intValue());
    }

    @Override // android.support.v7.preference.Preference
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return Integer.valueOf(a.getInt(index, 0));
    }

    public void setMin(int min) {
        if (min > this.mMax) {
            min = this.mMax;
        }
        if (min != this.mMin) {
            this.mMin = min;
            notifyChanged();
        }
    }

    public int getMin() {
        return this.mMin;
    }

    public final void setMax(int max) {
        if (max < this.mMin) {
            max = this.mMin;
        }
        if (max != this.mMax) {
            this.mMax = max;
            notifyChanged();
        }
    }

    public final int getSeekBarIncrement() {
        return this.mSeekBarIncrement;
    }

    public final void setSeekBarIncrement(int seekBarIncrement) {
        if (seekBarIncrement != this.mSeekBarIncrement) {
            this.mSeekBarIncrement = Math.min(this.mMax - this.mMin, Math.abs(seekBarIncrement));
            notifyChanged();
        }
    }

    public int getMax() {
        return this.mMax;
    }

    public void setAdjustable(boolean adjustable) {
        this.mAdjustable = adjustable;
    }

    public boolean isAdjustable() {
        return this.mAdjustable;
    }

    public void setValue(int seekBarValue) {
        setValueInternal(seekBarValue, true);
    }

    private void setValueInternal(int seekBarValue, boolean notifyChanged) {
        if (seekBarValue < this.mMin) {
            seekBarValue = this.mMin;
        }
        if (seekBarValue > this.mMax) {
            seekBarValue = this.mMax;
        }
        if (seekBarValue != this.mSeekBarValue) {
            this.mSeekBarValue = seekBarValue;
            if (this.mSeekBarValueTextView != null) {
                this.mSeekBarValueTextView.setText(String.valueOf(this.mSeekBarValue));
            }
            persistInt(seekBarValue);
            if (notifyChanged) {
                notifyChanged();
            }
        }
    }

    public int getValue() {
        return this.mSeekBarValue;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void syncValueInternal(SeekBar seekBar) {
        int seekBarValue = this.mMin + seekBar.getProgress();
        if (seekBarValue != this.mSeekBarValue) {
            if (callChangeListener(Integer.valueOf(seekBarValue))) {
                setValueInternal(seekBarValue, false);
            } else {
                seekBar.setProgress(this.mSeekBarValue - this.mMin);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.Preference
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (!isPersistent()) {
            SavedState myState = new SavedState(superState);
            myState.seekBarValue = this.mSeekBarValue;
            myState.min = this.mMin;
            myState.max = this.mMax;
            return myState;
        }
        return superState;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.Preference
    public void onRestoreInstanceState(Parcelable state) {
        if (!state.getClass().equals(SavedState.class)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState myState = (SavedState) state;
        super.onRestoreInstanceState(myState.getSuperState());
        this.mSeekBarValue = myState.seekBarValue;
        this.mMin = myState.min;
        this.mMax = myState.max;
        notifyChanged();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class SavedState extends Preference.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: android.support.v7.preference.SeekBarPreference.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public SavedState mo122createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public SavedState[] mo123newArray(int size) {
                return new SavedState[size];
            }
        };
        int max;
        int min;
        int seekBarValue;

        public SavedState(Parcel source) {
            super(source);
            this.seekBarValue = source.readInt();
            this.min = source.readInt();
            this.max = source.readInt();
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(this.seekBarValue);
            dest.writeInt(this.min);
            dest.writeInt(this.max);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }
    }
}
