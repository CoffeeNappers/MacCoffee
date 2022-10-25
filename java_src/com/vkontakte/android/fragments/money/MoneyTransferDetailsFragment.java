package com.vkontakte.android.fragments.money;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.FragmentDialogActivity;
import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.money.MoneyDeclineTransfer;
import com.vkontakte.android.api.money.MoneyGetTransfer;
import com.vkontakte.android.navigation.Navigator;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class MoneyTransferDetailsFragment extends AppKitFragment {
    private static final String EXTRA_DATA_ARG = "data";
    private VKImageView imagePeer;
    private MoneyTransfer mData;
    private TextView textViewCancel;
    private TextView textViewComment;
    private TextView textViewCurrencySymbol;
    private TextView textViewDate;
    private TextView textViewNegative;
    private TextView textViewPositive;
    private TextView textViewRepeat;
    private TextView textViewSign;
    private TextView textViewStatus;
    private TextView textViewSum;
    private TextView textViewTo;
    private View viewDivider;
    private ViewGroup viewGroupCommentStatus;
    private ViewGroup viewGroupPositiveNegative;

    public static void show(int transferId, int fromId, int toId, final Context context) {
        new MoneyGetTransfer(transferId, fromId, toId).setCallback(new SimpleCallback<MoneyTransfer>(context) { // from class: com.vkontakte.android.fragments.money.MoneyTransferDetailsFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(MoneyTransfer result) {
                MoneyTransferDetailsFragment.show(result, context);
            }
        }).wrapProgress(context).exec(context);
    }

    public static void show(MoneyTransfer mt, Context context) {
        if (mt.getPeerUser() == null) {
            show(mt.id, mt.from_id, mt.to_id, context);
            return;
        }
        Bundle args = new Bundle();
        args.putParcelable("data", mt);
        new Navigator(MoneyTransferDetailsFragment.class, new TabletDialogActivity.Builder(FragmentDialogActivity.class).setMaxWidth(V.dp(360.0f)).setMinSpacing(V.dp(32.0f)).setGravity(17).windowAnimationResource(R.style.StickerDialogAnim).windowBackgroundResource(17170443), args).go(context);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.textViewTo = null;
        this.textViewDate = null;
        this.imagePeer = null;
        this.textViewSign = null;
        this.textViewSum = null;
        this.textViewCurrencySymbol = null;
        this.textViewPositive = null;
        this.textViewNegative = null;
        this.viewGroupPositiveNegative = null;
        this.viewGroupCommentStatus = null;
        this.textViewComment = null;
        this.textViewStatus = null;
        this.textViewRepeat = null;
        this.textViewCancel = null;
        this.viewDivider = null;
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1 && requestCode == 2) {
            getActivity().finish();
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.textViewTo = (TextView) view.findViewById(R.id.tv_mt_to);
        this.textViewDate = (TextView) view.findViewById(R.id.tv_mt_date);
        this.imagePeer = (VKImageView) view.findViewById(R.id.photo);
        this.textViewSign = (TextView) view.findViewById(R.id.tv_mt_sign);
        this.textViewSum = (TextView) view.findViewById(R.id.tv_mt_sum);
        this.textViewCurrencySymbol = (TextView) view.findViewById(R.id.tv_mt_sum_symb);
        this.textViewPositive = (TextView) view.findViewById(R.id.positive);
        this.textViewNegative = (TextView) view.findViewById(R.id.negative);
        this.viewGroupPositiveNegative = (ViewGroup) view.findViewById(R.id.ll_mt_pos_neg);
        this.viewGroupCommentStatus = (ViewGroup) view.findViewById(R.id.ll_mt_comment_status_container);
        this.textViewComment = (TextView) view.findViewById(R.id.tv_mt_comment);
        this.textViewStatus = (TextView) view.findViewById(R.id.tv_mt_status);
        this.textViewRepeat = (TextView) view.findViewById(R.id.tv_mt_repeat);
        this.textViewCancel = (TextView) view.findViewById(R.id.tv_mt_cancel);
        this.viewDivider = view.findViewById(R.id.divider);
        this.textViewPositive.setOnClickListener(MoneyTransferDetailsFragment$$Lambda$1.lambdaFactory$(this));
        this.textViewRepeat.setOnClickListener(MoneyTransferDetailsFragment$$Lambda$2.lambdaFactory$(this));
        this.textViewNegative.setOnClickListener(MoneyTransferDetailsFragment$$Lambda$3.lambdaFactory$(this));
        this.textViewCancel.setOnClickListener(MoneyTransferDetailsFragment$$Lambda$4.lambdaFactory$(this));
        if (this.mData.getPeerUser() != null) {
            this.imagePeer.load(this.mData.getPeerUser().photo);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$0(View v) {
        if (this.mData.acceptUrl != null && !this.mData.acceptUrl.isEmpty()) {
            MoneyWebViewFragment.start(this, this.mData.acceptUrl, this.mData.id, 2);
        } else {
            new MoneyGetTransfer(this.mData.id, this.mData.from_id, this.mData.to_id).setCallback(new SimpleCallback<MoneyTransfer>() { // from class: com.vkontakte.android.fragments.money.MoneyTransferDetailsFragment.2
                @Override // com.vkontakte.android.api.Callback
                public void success(MoneyTransfer result) {
                    MoneyTransferDetailsFragment.this.mData = result;
                    MoneyTransferDetailsFragment.this.bindData();
                    MoneyWebViewFragment.start(MoneyTransferDetailsFragment.this, MoneyTransferDetailsFragment.this.mData.acceptUrl, MoneyTransferDetailsFragment.this.mData.id, 2);
                }
            }).wrapProgress(getContext()).exec(getContext());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$1(View v) {
        CreateTransferFragment.start(getActivity(), this.mData.to_id, this.mData.toUser, this.mData.getAmountFormatted(), this.mData.comment);
        getActivity().finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$2(View v) {
        declineTransfer();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$3(View v) {
        declineTransfer();
    }

    private void declineTransfer() {
        new MoneyDeclineTransfer(this.mData.id).setCallback(new SimpleCallback<Integer>() { // from class: com.vkontakte.android.fragments.money.MoneyTransferDetailsFragment.3
            @Override // com.vkontakte.android.api.Callback
            public void success(Integer result) {
                Intent broadcastIntent = new Intent(MoneyTransferActions.ACTION_MONEY_TRANSFER_CANCELLED);
                broadcastIntent.putExtra(MoneyTransferActions.RESULT_EXTRA_TRANSFER_ID_ARG, MoneyTransferDetailsFragment.this.mData.id);
                MoneyTransferDetailsFragment.this.getActivity().sendBroadcast(broadcastIntent, "com.vkontakte.android.permission.ACCESS_DATA");
                MoneyTransferDetailsFragment.this.getActivity().finish();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        bindData();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00a7, code lost:
        if (r4 != 1) goto L60;
     */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0179  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0197  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void bindData() {
        /*
            Method dump skipped, instructions count: 456
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.fragments.money.MoneyTransferDetailsFragment.bindData():void");
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mData = (MoneyTransfer) getArguments().getParcelable("data");
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.money_transfer_details, container, false);
    }
}
