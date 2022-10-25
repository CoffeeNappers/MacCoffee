package com.vkontakte.android.fragments;

import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.support.annotation.StyleRes;
import android.support.v7.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vkontakte.android.FragmentDialogActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.navigation.Navigator;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class VKAlertFragment extends AppKitFragment {
    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle bundle) {
        return new FrameLayout(getContext());
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public final void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        init(view);
    }

    protected void init(View view) {
        Builder builder;
        Bundle arguments = getArguments();
        if (arguments != null && (builder = (Builder) arguments.getParcelable("Builder")) != null) {
            new AlertDialog.Builder(getContext()).setTitle(builder.titleId).setMessage(builder.message).setOnDismissListener(VKAlertFragment$$Lambda$1.lambdaFactory$(this)).setPositiveButton(builder.positiveButtonTitleId, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.VKAlertFragment.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    VKAlertFragment.this.action();
                }
            }).show();
        } else {
            getActivity().finish();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$init$0(DialogInterface dialog) {
        getActivity().finish();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void action() {
        getActivity().finish();
    }

    /* loaded from: classes2.dex */
    public static class Builder implements Parcelable {
        public static final Parcelable.Creator<Builder> CREATOR = new Parcelable.Creator<Builder>() { // from class: com.vkontakte.android.fragments.VKAlertFragment.Builder.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public Builder mo1026createFromParcel(Parcel source) {
                return new Builder(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public Builder[] mo1027newArray(int size) {
                return new Builder[size];
            }
        };
        static final String TAG = "Builder";
        int iconId;
        String message;
        String positiveButtonTitleId;
        String titleId;
        String url;

        public Builder() {
        }

        public Builder(Parcel source) {
            this.iconId = source.readInt();
            this.titleId = source.readString();
            this.message = source.readString();
            this.positiveButtonTitleId = source.readString();
            this.url = source.readString();
        }

        public Builder setIcon(@DrawableRes int iconId) {
            this.iconId = iconId;
            return this;
        }

        public Builder setTitle(String titleId) {
            this.titleId = titleId;
            return this;
        }

        public Builder setMessage(String message) {
            this.message = message;
            return this;
        }

        public Builder setPositiveButtonTitle(String titleId) {
            this.positiveButtonTitleId = titleId;
            return this;
        }

        public Builder setUrl(String url) {
            this.url = url;
            return this;
        }

        public void show(Context context, Class<? extends Fragment> classFragment) {
            show(context, classFragment, 0);
        }

        public void show(Context context, Class<? extends Fragment> classFragment, @StyleRes int animResId) {
            Bundle bundle = new Bundle();
            bundle.putParcelable(TAG, this);
            new Navigator(classFragment, new TabletDialogActivity.Builder(FragmentDialogActivity.class).setMaxWidth(V.dp(312.0f)).setMinSpacing(V.dp(32.0f)).setGravity(17).windowBackgroundResource(R.drawable.white_rect_with_2dp_corners).windowAnimationResource(animResId), bundle).go(context);
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeInt(this.iconId);
            dest.writeString(this.titleId);
            dest.writeString(this.message);
            dest.writeString(this.positiveButtonTitleId);
            dest.writeString(this.url);
        }
    }
}
