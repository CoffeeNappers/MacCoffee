package com.vkontakte.android.ui.holder.messages;

import android.content.Context;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.holder.RecyclerHolderRef;
/* loaded from: classes3.dex */
public class ChatInfoHolder extends RecyclerHolderRef<Ref> {
    @Nullable
    public final VKImageView imageView;
    @Nullable
    public final TextView title;
    public final EditText titleEdit;

    /* loaded from: classes3.dex */
    public static class Ref extends RecyclerHolderRef.Ref<ChatInfoHolder> implements TextWatcher {
        private CharSequence title;
        private TextView.OnEditorActionListener onEditorActionListener = null;
        private View.OnClickListener onClickListener = null;
        private boolean enable = true;
        private String photo = null;

        @Override // com.vkontakte.android.ui.holder.RecyclerHolderRef.Ref
        public void bind(@NonNull ChatInfoHolder holder) {
            if (holder.imageView != null) {
                holder.imageView.load(this.photo);
                ViewUtils.setEnabled(holder.imageView, this.enable);
                if (this.onClickListener != null) {
                    holder.imageView.setOnClickListener(this.onClickListener);
                }
            }
            if (this.onEditorActionListener != null) {
                holder.titleEdit.setOnEditorActionListener(this.onEditorActionListener);
            }
            holder.titleEdit.setEnabled(this.enable);
            holder.titleEdit.addTextChangedListener(this);
            holder.titleEdit.setText(this.title);
        }

        public void setTitle(CharSequence title) {
            this.title = title;
            ChatInfoHolder holder = getHolder();
            if (holder != null) {
                holder.titleEdit.setText(title);
            }
        }

        @NonNull
        public CharSequence getTitle() {
            return this.title == null ? "" : this.title;
        }

        public void setOnEditorActionListener(TextView.OnEditorActionListener onEditorActionListener) {
            this.onEditorActionListener = onEditorActionListener;
            ChatInfoHolder holder = getHolder();
            if (holder != null) {
                holder.titleEdit.setOnEditorActionListener(onEditorActionListener);
            }
        }

        public void setOnClickListener(View.OnClickListener onClickListener) {
            this.onClickListener = onClickListener;
            ChatInfoHolder holder = getHolder();
            if (holder != null && holder.imageView != null) {
                holder.imageView.setOnClickListener(onClickListener);
            }
        }

        public void setEnable(boolean enable) {
            this.enable = enable;
            ChatInfoHolder holder = getHolder();
            if (holder != null) {
                ViewUtils.setEnabled(holder.imageView, enable);
                holder.titleEdit.setEnabled(enable);
            }
        }

        public void clearImage() {
            setPhoto("");
        }

        public void setPhoto(String photo) {
            this.photo = photo;
            ChatInfoHolder holder = getHolder();
            if (holder != null) {
                if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
                    holder.imageView.load(photo);
                } else {
                    ViewUtils.postDelayed(ChatInfoHolder$Ref$$Lambda$1.lambdaFactory$(holder, photo), 0L);
                }
            }
        }

        public boolean hasChatPhoto() {
            return !TextUtils.isEmpty(this.photo) && !this.photo.startsWith("M");
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
            this.title = s;
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
        }
    }

    public ChatInfoHolder(Context ctx, boolean isCreate) {
        super(isCreate ? R.layout.chat_info_new_holder : R.layout.chat_info_holder, ctx);
        this.titleEdit = (EditText) $(R.id.edit_title);
        this.titleEdit.setImeOptions(6);
        this.imageView = (VKImageView) $(R.id.chat_image);
        this.title = (TextView) $(R.id.title);
    }
}
