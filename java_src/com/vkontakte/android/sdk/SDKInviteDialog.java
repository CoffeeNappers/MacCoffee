package com.vkontakte.android.sdk;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.core.util.RxUtil;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.photos.SDKPhotosResolveLink;
/* loaded from: classes3.dex */
public class SDKInviteDialog extends DialogFragment {
    private ImageView mBannerView;
    private Listener mCallback;
    private CharSequence mLink;
    private TextView mLinkView;
    private CharSequence mMessage;
    private EditText mMessageView;
    private Bitmap mPhoto;
    private CharSequence mPhotoId;
    private String mPhotoLink;
    private View mProgress;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public interface Listener {
        void onInviteCanceled();

        void onInviteSent(CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3);
    }

    public static SDKInviteDialog newInstance(CharSequence message, CharSequence link, CharSequence photo_id) {
        SDKInviteDialog result = new SDKInviteDialog();
        Bundle args = new Bundle();
        args.putCharSequence("com.vkontakte.android.sdk.extra_message", message);
        args.putCharSequence("com.vkontakte.android.sdk.extra_link", link);
        args.putCharSequence("com.vkontakte.android.sdk.extra_photo", photo_id);
        result.setArguments(args);
        return result;
    }

    @Override // android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.mCallback = (Listener) activity;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setCancelable(false);
        Bundle args = getArguments();
        this.mMessage = args.getCharSequence("com.vkontakte.android.sdk.extra_message");
        this.mLink = args.getCharSequence("com.vkontakte.android.sdk.extra_link");
        this.mPhotoId = args.getCharSequence("com.vkontakte.android.sdk.extra_photo");
    }

    public View createView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.sdk_invite_dialog, container, false);
    }

    @Override // android.app.DialogFragment
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        DialogInterface.OnClickListener mListener = new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.sdk.SDKInviteDialog.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int which) {
                Listener listener = SDKInviteDialog.this.mCallback;
                if (which == -2) {
                    dialogInterface.cancel();
                    SDKInviteDialog.this.invokeNegativeCallback(listener);
                }
                if (which == -1) {
                    dialogInterface.cancel();
                    listener.onInviteSent(SDKInviteDialog.this.mMessage = SDKInviteDialog.this.mMessageView.getText(), SDKInviteDialog.this.mPhotoId, SDKInviteDialog.this.mLink);
                }
            }
        };
        View view = createView(LayoutInflater.from(getActivity()), null, savedInstanceState);
        setupView(view, savedInstanceState);
        return new AlertDialog.Builder(getActivity()).setCancelable(false).setView(view).setTitle(R.string.sdk_invite_dialog_title).setNegativeButton(R.string.cancel, mListener).setPositiveButton(R.string.send, mListener).create();
    }

    public void setupView(View view, Bundle savedInstanceState) {
        this.mMessageView = (EditText) view.findViewById(R.id.message);
        this.mLinkView = (TextView) view.findViewById(R.id.link);
        this.mBannerView = (ImageView) view.findViewById(R.id.banner);
        this.mProgress = view.findViewById(R.id.progress);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (savedInstanceState == null) {
            this.mMessageView.setText(this.mMessage);
            this.mMessageView.setSelection(this.mMessageView.getText().length());
            this.mLinkView.setText(getLinkDomain(this.mLink.toString()));
            this.mLinkView.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.sdk.SDKInviteDialog.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    SDKInviteDialog.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(SDKInviteDialog.this.mLink.toString())));
                }
            });
        }
        if (this.mPhoto == null) {
            loadPhoto();
            return;
        }
        this.mBannerView.setImageBitmap(this.mPhoto);
        this.mProgress.setVisibility(8);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.mMessageView = null;
        this.mBannerView = null;
        this.mLinkView = null;
        this.mProgress = null;
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.mMessage = null;
        this.mLink = null;
        this.mPhotoId = null;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        super.onDetach();
        this.mCallback = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void invokeNegativeCallback(final Listener listener) {
        new Handler(getActivity().getMainLooper()).postDelayed(new Runnable() { // from class: com.vkontakte.android.sdk.SDKInviteDialog.3
            @Override // java.lang.Runnable
            public void run() {
                listener.onInviteCanceled();
            }
        }, 250L);
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.vkontakte.android.sdk.SDKInviteDialog$4] */
    private void loadPhoto() {
        new AsyncTask<Void, Void, Bitmap>() { // from class: com.vkontakte.android.sdk.SDKInviteDialog.4
            @Override // android.os.AsyncTask
            protected void onPreExecute() {
                SDKInviteDialog.this.mProgress.setVisibility(0);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Bitmap doInBackground(Void... voids) {
                if (SDKInviteDialog.this.mPhotoLink == null) {
                    new SDKPhotosResolveLink(SDKInviteDialog.this.mPhotoId.toString(), 604).setCallback(new SimpleCallback<String>() { // from class: com.vkontakte.android.sdk.SDKInviteDialog.4.1
                        @Override // com.vkontakte.android.api.Callback
                        public void success(String link) {
                            SDKInviteDialog.this.mPhotoLink = link;
                        }
                    }).execSync();
                }
                return (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getBitmap(Uri.parse(SDKInviteDialog.this.mPhotoLink)));
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public void onPostExecute(Bitmap bitmap) {
                SDKInviteDialog.this.mPhoto = bitmap;
                if (SDKInviteDialog.this.mBannerView != null) {
                    SDKInviteDialog.this.mBannerView.setImageBitmap(bitmap);
                }
                if (SDKInviteDialog.this.mProgress != null) {
                    SDKInviteDialog.this.mProgress.setVisibility(8);
                }
            }
        }.execute(new Void[0]);
    }

    static String getLinkDomain(String link) {
        int start = link.indexOf("://");
        if (start != -1) {
            return link.substring(start + 3, link.length());
        }
        return link;
    }
}
