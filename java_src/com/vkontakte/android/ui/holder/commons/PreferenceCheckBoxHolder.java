package com.vkontakte.android.ui.holder.commons;

import android.content.Context;
import android.support.annotation.NonNull;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.holder.RecyclerHolderRef;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class PreferenceCheckBoxHolder extends RecyclerHolderRef<Ref> implements UsableRecyclerView.Clickable {
    public final Switch aSwitch;
    public final TextView textView;

    /* loaded from: classes3.dex */
    public static class Ref extends RecyclerHolderRef.Ref<PreferenceCheckBoxHolder> {
        private boolean isChecked = false;
        private final CompoundButton.OnCheckedChangeListener onCheckedChangeListener;
        private Object title;

        public Ref(CompoundButton.OnCheckedChangeListener onCheckedChangeListener, Object title) {
            this.title = null;
            this.onCheckedChangeListener = onCheckedChangeListener;
            this.title = title;
        }

        public void setTitle(Object title) {
            this.title = title;
            PreferenceCheckBoxHolder holder = getHolder();
            if (holder != null) {
                ViewUtils.setText(holder.textView, title, false);
            }
        }

        public void setChecked(boolean isChecked) {
            this.isChecked = isChecked;
            PreferenceCheckBoxHolder holder = getHolder();
            if (holder != null) {
                holder.aSwitch.setOnCheckedChangeListener(null);
                holder.aSwitch.setChecked(isChecked);
                holder.aSwitch.setOnCheckedChangeListener(this.onCheckedChangeListener);
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.ui.holder.RecyclerHolderRef.Ref
        public void bind(@NonNull PreferenceCheckBoxHolder holder) {
            ViewUtils.setText(holder.textView, this.title, false);
            holder.aSwitch.setOnCheckedChangeListener(null);
            holder.aSwitch.setChecked(this.isChecked);
            holder.aSwitch.setOnCheckedChangeListener(this.onCheckedChangeListener);
        }
    }

    public PreferenceCheckBoxHolder(Context ctx) {
        super((int) R.layout.summary_checkbox, ctx);
        this.textView = (TextView) $(16908308);
        this.aSwitch = (Switch) $(16908289);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        this.aSwitch.toggle();
    }
}
