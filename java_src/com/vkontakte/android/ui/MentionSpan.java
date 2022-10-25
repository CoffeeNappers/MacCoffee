package com.vkontakte.android.ui;

import android.os.Parcel;
import android.text.style.ForegroundColorSpan;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
/* loaded from: classes3.dex */
public class MentionSpan extends ForegroundColorSpan {
    private static final int DEFAULT_COLOR = VKApplication.context.getResources().getColorStateList(R.color.link).getDefaultColor();
    public int id;

    public MentionSpan() {
        super(DEFAULT_COLOR);
    }

    public MentionSpan(Parcel parcel) {
        super(parcel);
        this.id = parcel.readInt();
    }

    @Override // android.text.style.ForegroundColorSpan, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeInt(this.id);
    }
}
