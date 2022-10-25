package com.vkontakte.android.fragments.money;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.KeyboardUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Log;
import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsGetById;
import com.vkontakte.android.api.money.MoneySendTransfer;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.NumberTextWatcher;
import java.util.ArrayList;
import me.grishka.appkit.fragments.LoaderFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class CreateTransferFragment extends LoaderFragment {
    private static final String ExtraAmount = "amount";
    private static final String ExtraComment = "comment";
    private static final String ExtraUser = "to";
    private static final String ExtraUserId = "to_id";
    private int amountAuto;
    private EditText mEditTextAmount;
    private EditText mEditTextComment;
    private VKImageView mImageViewTo;
    private boolean mProceeding = false;
    private ScrollView mScrollView;
    private TextView mTextViewHint;
    private TextView mTextViewRestriction;
    private TextView mTextViewTo;
    private UserProfile mTo;
    private int mToUid;

    public static void start(Activity activity, int toId, @Nullable UserProfile to, String amount, String comment) {
        Bundle args = new Bundle();
        args.putInt(ExtraUserId, toId);
        args.putString("amount", amount);
        args.putString(ExtraComment, comment);
        if (to != null) {
            args.putParcelable("to", to);
        }
        new Navigator(CreateTransferFragment.class, new TabletDialogActivity.Builder().windowBackgroundResource(R.color.money_transfer_create_bg).setMaxWidth(V.dp(720.0f)).setPreferredHeight(V.dp(450.0f)), args).go(activity);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        ArrayList<Integer> uids = new ArrayList<>();
        uids.add(Integer.valueOf(this.mToUid));
        if (this.mToUid > 0) {
            Friends.getUsers(uids, CreateTransferFragment$$Lambda$1.lambdaFactory$(this), 2);
        } else {
            new GroupsGetById(-this.mToUid).setCallback(new SimpleCallback<Group>() { // from class: com.vkontakte.android.fragments.money.CreateTransferFragment.1
                @Override // com.vkontakte.android.api.Callback
                public void success(Group result) {
                    CreateTransferFragment.this.handleUserOrGroupToLoaded(new UserProfile(result));
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    Group g = Groups.getById(-CreateTransferFragment.this.mToUid);
                    if (g != null) {
                        CreateTransferFragment.this.handleUserOrGroupToLoaded(new UserProfile(g));
                    }
                }
            }).exec((Context) getActivity());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$doLoadData$0(ArrayList users) {
        if (users.size() > 0) {
            handleUserOrGroupToLoaded((UserProfile) users.get(0));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleUserOrGroupToLoaded(UserProfile up) {
        Activity activity = getActivity();
        if (activity != null) {
            activity.runOnUiThread(CreateTransferFragment$$Lambda$2.lambdaFactory$(this, up));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$handleUserOrGroupToLoaded$1(UserProfile up) {
        this.mTo = up;
        updateToViews();
        dataLoaded();
        ensureFocusAmountField();
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    private void ensureFocusAmountField() {
        if (getActivity() != null) {
            int orientation = ViewUtils.getScreenOrientation(getActivity());
            if (!this.loaded || this.mEditTextAmount == null) {
                return;
            }
            if (this.isTablet || orientation == 1 || orientation == 9) {
                KeyboardUtils.showKeyboard(this.mEditTextAmount);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void delayScrollToBottom() {
        this.mScrollView.postDelayed(CreateTransferFragment$$Lambda$3.lambdaFactory$(this), 300L);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$delayScrollToBottom$2() {
        this.mScrollView.fullScroll(130);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        MenuItem nextItem = menu.add(R.string.help);
        nextItem.setIcon(R.drawable.ic_help_24dp);
        nextItem.setShowAsAction(2);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        MoneyWebViewFragment.showTerms(getContext(), MoneyTransfer.getTermsUrl());
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void proceedToPayment() {
        if (!this.mProceeding) {
            if (this.mTextViewRestriction.getVisibility() == 0 && this.mTextViewRestriction.getText().length() > 0) {
                Toast.makeText(getContext(), this.mTextViewRestriction.getText(), 0).show();
                return;
            }
            this.mProceeding = true;
            String message = this.mEditTextComment.getText().toString();
            int amount = 0;
            String amountStr = this.mEditTextAmount.getText().toString();
            while (amountStr.contains(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR)) {
                amountStr = amountStr.replace(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "");
            }
            try {
                amount = Integer.parseInt(amountStr);
            } catch (Exception e) {
                Log.e("CreateTransferFragment", "Failed to parse amount string " + this.mEditTextAmount.getText().toString());
            }
            new MoneySendTransfer(this.mToUid, amount, message).setCallback(new SimpleCallback<String>() { // from class: com.vkontakte.android.fragments.money.CreateTransferFragment.2
                @Override // com.vkontakte.android.api.Callback
                public void success(String result) {
                    Log.v("CreateTransferFragment", "success " + result);
                    Activity activity = CreateTransferFragment.this.getActivity();
                    if (activity != null) {
                        InputMethodManager inputManager = (InputMethodManager) activity.getSystemService("input_method");
                        inputManager.hideSoftInputFromWindow(activity.getWindow().getDecorView().getWindowToken(), 0);
                        MoneyWebViewFragment.start(CreateTransferFragment.this, result, 0, 1);
                    }
                    CreateTransferFragment.this.mProceeding = false;
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    Log.v("CreateTransferFragment", "fail " + error);
                    if (CreateTransferFragment.this.getContext() != null) {
                        APIUtils.showErrorToast(CreateTransferFragment.this.getContext(), error.getCode(), error.message);
                    }
                    CreateTransferFragment.this.mProceeding = false;
                }
            }).exec(getContext()).wrapProgress(getContext());
        }
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1 && requestCode == 1) {
            getActivity().finish();
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.mToUid = getArguments().getInt(ExtraUserId);
        this.mTo = (UserProfile) getArguments().getParcelable("to");
        loadData();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(R.string.money_transfer_payment);
        getToolbar().setNavigationIcon(R.drawable.ic_temp_close);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.money_transfer_new, (ViewGroup) null);
        this.mScrollView = (ScrollView) view.findViewById(R.id.sv_mt);
        this.mTextViewHint = (TextView) view.findViewById(R.id.tv_mt_hint);
        TextView mTextViewSend = (TextView) view.findViewById(R.id.positive);
        mTextViewSend.setOnClickListener(CreateTransferFragment$$Lambda$4.lambdaFactory$(this));
        this.mTextViewRestriction = (TextView) view.findViewById(R.id.tv_mt_restriction);
        this.mTextViewTo = (TextView) view.findViewById(R.id.tv_mt_to);
        this.mImageViewTo = (VKImageView) view.findViewById(R.id.iv_mt_to);
        View sumContainer = view.findViewById(R.id.ll_mt_sum);
        sumContainer.setOnClickListener(CreateTransferFragment$$Lambda$5.lambdaFactory$(this, view));
        updateToViews();
        this.mEditTextAmount = (EditText) view.findViewById(R.id.et_mt_sum);
        this.mEditTextAmount.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.fragments.money.CreateTransferFragment.3
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
                CreateTransferFragment.this.mTextViewHint.setVisibility(CreateTransferFragment.this.mEditTextAmount.getText().toString().isEmpty() ? 0 : 8);
                CreateTransferFragment.this.updateRestrictionsText();
            }
        });
        this.mEditTextAmount.addTextChangedListener(new NumberTextWatcher(this.mEditTextAmount));
        this.mEditTextComment = (EditText) view.findViewById(R.id.et_mt_comment);
        this.mEditTextComment.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: com.vkontakte.android.fragments.money.CreateTransferFragment.4
            @Override // android.widget.TextView.OnEditorActionListener
            public boolean onEditorAction(TextView textView, int actionId, KeyEvent keyEvent) {
                if (actionId == 4) {
                    CreateTransferFragment.this.proceedToPayment();
                    return true;
                }
                return false;
            }
        });
        this.mEditTextComment.setOnFocusChangeListener(new View.OnFocusChangeListener() { // from class: com.vkontakte.android.fragments.money.CreateTransferFragment.5
            @Override // android.view.View.OnFocusChangeListener
            public void onFocusChange(View view2, boolean b) {
                if (b) {
                    CreateTransferFragment.this.delayScrollToBottom();
                }
            }
        });
        String inputAmount = getArguments().getString("amount");
        if (inputAmount != null && !inputAmount.isEmpty()) {
            this.mEditTextAmount.setText(inputAmount);
        }
        String inputComment = getArguments().getString(ExtraComment);
        if (inputComment != null && !inputComment.isEmpty()) {
            this.mEditTextComment.setText(inputComment);
        }
        this.mEditTextAmount.setSelection(this.mEditTextAmount.getText().length());
        TextView mCurrencySign = (TextView) view.findViewById(R.id.currency_sign);
        mCurrencySign.setText(MoneyTransfer.getYourCurrencySymbol());
        this.mTextViewRestriction.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.money.CreateTransferFragment.6
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (CreateTransferFragment.this.amountAuto > 0 && CreateTransferFragment.this.mTextViewRestriction.getVisibility() == 0) {
                    CreateTransferFragment.this.mEditTextAmount.setText(String.valueOf(CreateTransferFragment.this.amountAuto));
                    CreateTransferFragment.this.mEditTextAmount.setSelection(CreateTransferFragment.this.mEditTextAmount.getText().length());
                }
            }
        });
        updateRestrictionsText();
        ensureFocusAmountField();
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateContentView$3(View v) {
        proceedToPayment();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateContentView$4(View view, View v) {
        this.mEditTextAmount.requestFocus();
        InputMethodManager imm = (InputMethodManager) view.getContext().getSystemService("input_method");
        imm.showSoftInput(this.mEditTextAmount, 2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateRestrictionsText() {
        int amount = 0;
        try {
            if (!this.mEditTextAmount.getText().toString().isEmpty()) {
                String amStr = this.mEditTextAmount.getText().toString();
                amount = Integer.parseInt(amStr.replace(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, ""));
            }
        } catch (Exception e) {
            Log.e("CreateTransferFragment", "Failed to parse amount string " + this.mEditTextAmount.getText().toString());
        }
        int minAmount = VKAccountManager.getCurrent().moneyTransfersMinAmount;
        int maxAmount = VKAccountManager.getCurrent().moneyTransfersMaxAmount;
        String currency = MoneyTransfer.getYourCurrencySymbol();
        if (minAmount != 0 && amount < minAmount) {
            this.mTextViewRestriction.setText(getResources().getString(R.string.money_transfer_min, minAmount + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + currency));
            this.mTextViewRestriction.setTextColor(-5591373);
            V.setVisibilityAnimated(this.mTextViewRestriction, 0);
            this.amountAuto = minAmount;
        } else if (maxAmount != 0 && amount > maxAmount) {
            this.mTextViewRestriction.setText(getResources().getString(R.string.money_transfer_max, maxAmount + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + currency));
            this.mTextViewRestriction.setTextColor(-1685946);
            V.setVisibilityAnimated(this.mTextViewRestriction, 0);
            this.amountAuto = maxAmount;
        } else {
            V.setVisibilityAnimated(this.mTextViewRestriction, 4);
            this.amountAuto = 0;
        }
    }

    private void updateToViews() {
        if (this.mTo != null && this.mTextViewTo != null) {
            this.mTextViewTo.setText(this.mTo.uid > 0 ? this.mTo.firstName : this.mTo.fullName);
            this.mImageViewTo.load(this.mTo.photo);
        }
    }
}
