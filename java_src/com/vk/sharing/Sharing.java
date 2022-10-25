package com.vk.sharing;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.sharing.action.ActionsInfo;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public final class Sharing {
    public static void share(@NonNull Context context, @NonNull String text) {
        Intent intent = new Intent("android.intent.action.SEND");
        intent.setType("text/plain");
        intent.putExtra("android.intent.extra.TEXT", text);
        Intent chooser = Intent.createChooser(intent, context.getString(R.string.sharing_title1));
        if (context.getPackageManager().resolveActivity(chooser, 0) != null) {
            context.startActivity(chooser);
        }
    }

    @NonNull
    public static Builder from(@NonNull Context context) {
        return new Builder(context);
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        @Nullable
        ActionsInfo actionsInfo;
        @Nullable
        AttachmentInfo attachmentInfo;
        @NonNull
        final Context context;
        boolean fullScreen = false;

        Builder(@NonNull Context context) {
            this.context = context;
        }

        @NonNull
        public Builder withAttachment(@NonNull AttachmentInfo info) {
            this.attachmentInfo = info;
            return this;
        }

        @NonNull
        public Builder withActions(@NonNull ActionsInfo info) {
            this.actionsInfo = info;
            return this;
        }

        @NonNull
        public Builder fullScreen(boolean isFullScreen) {
            this.fullScreen = isFullScreen;
            return this;
        }

        public void share() {
            ensurePreconditions();
            this.context.startActivity(createIntent());
        }

        public void shareForResult(Fragment fragment, int requestCode) {
            ensurePreconditions();
            fragment.startActivityForResult(createIntent(), requestCode);
        }

        private void ensurePreconditions() {
            if (this.actionsInfo == null) {
                this.actionsInfo = new ActionsInfo.Builder().build();
            }
            if (this.attachmentInfo == null && !this.actionsInfo.haveComment()) {
                throw new IllegalStateException("AttachmentInfo must not be null");
            }
        }

        private Intent createIntent() {
            return new Intent(this.context, SharingActivity.class).putExtra(SharingService.EXTRA_ATTACHMENT_INFO, this.attachmentInfo).putExtra("actions_info", this.actionsInfo).putExtra("fullscreen", this.fullScreen);
        }
    }

    private Sharing() {
    }
}
