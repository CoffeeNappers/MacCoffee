package com.vkontakte.android.fragments;

import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.FragmentDialogActivity;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.apps.AppGetWithUser;
import com.vkontakte.android.api.apps.AppsSendRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.TextView;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class HtmlGameRequestFragment extends AppKitFragment {
    private static final String EXTRA_APPLICATION = "application";
    private static final String EXTRA_MESSAGE = "message";
    private static final String EXTRA_REQUEST_KEY = "request_key";
    private static final String EXTRA_USER_TO = "user_to";
    public static final int HTMLGAME_REQUEST_REQUEST_CODE = 1;
    private ApiApplication apiApplication;
    private VKImageView imageViewFrom;
    private VKImageView imageViewGame;
    private String message;
    private String requestKey;
    private TextView textViewFrom;
    private TextView textViewMessage;
    private TextView textViewNegative;
    private TextView textViewPositive;
    private TextView textViewTo;
    private UserProfile userTo;

    public static void showForResult(int appId, int userId, final String message, final String requestKey, Fragment fragment) {
        new AppGetWithUser(appId, userId).setCallback(new SimpleCallback<AppGetWithUser.AppGetWithUserResponse>(fragment) { // from class: com.vkontakte.android.fragments.HtmlGameRequestFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(AppGetWithUser.AppGetWithUserResponse result) {
                HtmlGameRequestFragment.showForResult(result.apiApplication, result.user, message, requestKey, this.fragment);
            }
        }).wrapProgress(fragment.getActivity()).exec((Context) fragment.getActivity());
    }

    public static void showForResult(ApiApplication apiApplication, UserProfile toUser, String message, String requestKey, Fragment fragment) {
        Bundle args = new Bundle();
        args.putParcelable("application", apiApplication);
        args.putParcelable(EXTRA_USER_TO, toUser);
        args.putString("message", message);
        args.putString(EXTRA_REQUEST_KEY, requestKey);
        new Navigator(HtmlGameRequestFragment.class, new TabletDialogActivity.Builder(FragmentDialogActivity.class).setMaxWidth(V.dp(360.0f)).setMinSpacing(V.dp(32.0f)).setGravity(17).windowAnimationResource(R.style.StickerDialogAnim).windowBackgroundResource(17170443), args).forResult(fragment, 1);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.apiApplication = (ApiApplication) getArguments().getParcelable("application");
        this.userTo = (UserProfile) getArguments().getParcelable(EXTRA_USER_TO);
        this.message = getArguments().getString("message");
        this.requestKey = getArguments().getString(EXTRA_REQUEST_KEY);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        bindData();
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.htmlgame_request, container, false);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.textViewTo = (TextView) view.findViewById(R.id.tv_game_to);
        this.imageViewFrom = (VKImageView) view.findViewById(R.id.photo);
        this.textViewFrom = (TextView) view.findViewById(R.id.tv_game_from);
        this.textViewMessage = (TextView) view.findViewById(R.id.tv_game_comment);
        this.imageViewGame = (VKImageView) view.findViewById(R.id.iv_game_photo);
        this.textViewPositive = (TextView) view.findViewById(R.id.positive);
        this.textViewNegative = (TextView) view.findViewById(R.id.negative);
        this.textViewPositive.setOnClickListener(HtmlGameRequestFragment$$Lambda$1.lambdaFactory$(this));
        this.textViewNegative.setOnClickListener(HtmlGameRequestFragment$$Lambda$2.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$0(View v) {
        sendRequest();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$1(View v) {
        cancel();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.textViewTo = null;
        this.imageViewFrom = null;
        this.textViewFrom = null;
        this.textViewMessage = null;
        this.imageViewGame = null;
        this.textViewPositive = null;
        this.textViewNegative = null;
    }

    private void bindData() {
        Photo.Image im;
        String toUserFrm = getResources().getString(R.string.htmlgame_somebody_will_receive_notification);
        SpannableString ss = new SpannableString(getResources().getString(R.string.htmlgame_somebody_will_receive_notification, this.userTo.fullName));
        ss.setSpan(new ForegroundColorSpan(-13750221), toUserFrm.indexOf("%s"), ((toUserFrm.indexOf("%s") + ss.length()) - toUserFrm.length()) + 2, 0);
        this.textViewTo.setText(ss);
        this.imageViewFrom.load(VKAccountManager.getCurrent().getPhoto());
        this.textViewFrom.setText(VKAccountManager.getCurrent().getName());
        this.textViewMessage.setText(this.message);
        if (this.apiApplication.icon != null && (im = this.apiApplication.icon.getImageByWidth(V.dp(36.0f))) != null && im.url != null) {
            this.imageViewGame.load(im.url);
        }
    }

    private void sendRequest() {
        AppsSendRequest.createAppRequestRequest(this.apiApplication.id, this.userTo.uid, this.message, this.requestKey).setCallback(new SimpleCallback<Boolean>(this) { // from class: com.vkontakte.android.fragments.HtmlGameRequestFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                if (HtmlGameRequestFragment.this.getActivity() != null) {
                    HtmlGameRequestFragment.this.getActivity().setResult(-1);
                    HtmlGameRequestFragment.this.getActivity().finish();
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    private void cancel() {
        getActivity().setResult(0);
        getActivity().finish();
    }
}
