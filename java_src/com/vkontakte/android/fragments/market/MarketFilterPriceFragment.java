package com.vkontakte.android.fragments.market;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.cardview.CardDrawable;
import me.grishka.appkit.fragments.ToolbarFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class MarketFilterPriceFragment extends ToolbarFragment {
    private EditText editPriceFinish;
    private EditText editPriceStart;
    private TextView.OnEditorActionListener editorActionListener = new TextView.OnEditorActionListener() { // from class: com.vkontakte.android.fragments.market.MarketFilterPriceFragment.1
        @Override // android.widget.TextView.OnEditorActionListener
        public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
            if (actionId == 6) {
                switch (v.getId()) {
                    case R.id.startPrice /* 2131755912 */:
                        MarketFilterPriceFragment.this.editPriceFinish.requestFocus();
                        return true;
                    case R.id.finishPrice /* 2131755913 */:
                        MarketFilterPriceFragment.this.done();
                        return true;
                }
            }
            return false;
        }
    };
    private TextWatcher validator = new TextWatcher() { // from class: com.vkontakte.android.fragments.market.MarketFilterPriceFragment.2
        CharSequence beforeText = null;

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            this.beforeText = s;
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            if (!isValidInt(s) && isValidInt(this.beforeText)) {
                s.clear();
                s.append(this.beforeText);
            }
        }

        private boolean isValidInt(CharSequence s) {
            for (int i = s.length() - 1; i >= 0; i--) {
                char buf = s.charAt(i);
                if (buf < '0' || buf > '9') {
                    return false;
                }
            }
            return true;
        }
    };

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(long min, long max, String currency) {
            super(MarketFilterPriceFragment.class);
            this.args.putLong("min", min);
            this.args.putLong("max", max);
            this.args.putString("currency", currency);
        }

        public Builder setCurrentValues(long min, long max) {
            this.args.putLong("current_min", min);
            this.args.putLong("current_max", max);
            return this;
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setTitle(R.string.price_filter_title);
        activity.getWindow().setBackgroundDrawable(new ColorDrawable(activity.getResources().getColor(R.color.cards_bg)));
        setHasOptionsMenu(true);
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.market_filter_price_fragment, container, false);
        View topBlock = view.findViewById(R.id.cardContainer);
        int pl = topBlock.getPaddingLeft();
        int pt = topBlock.getPaddingTop();
        int pr = topBlock.getPaddingRight();
        int pb = topBlock.getPaddingBottom();
        topBlock.setBackgroundDrawable(new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet));
        topBlock.setPadding(pl, pt, pr, pb);
        boolean isTabletDecorator = this.scrW >= 924;
        int pad = isTabletDecorator ? V.dp(Math.max(16, (this.scrW - 924) / 2)) : 0;
        ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) topBlock.getLayoutParams();
        params.setMargins(pad, params.topMargin, pad, params.bottomMargin);
        this.editPriceStart = (EditText) view.findViewById(R.id.startPrice);
        this.editPriceFinish = (EditText) view.findViewById(R.id.finishPrice);
        if (getArguments().getLong("current_min", 0L) != 0) {
            this.editPriceStart.setText(String.valueOf(getArguments().getLong("current_min")));
        }
        if (getArguments().getLong("current_max", 0L) != 0) {
            this.editPriceFinish.setText(String.valueOf(getArguments().getLong("current_max")));
        }
        this.editPriceStart.setHint(String.valueOf(getArguments().getLong("min")));
        this.editPriceFinish.setHint(String.valueOf(getArguments().getLong("max")));
        this.editPriceStart.addTextChangedListener(this.validator);
        this.editPriceFinish.addTextChangedListener(this.validator);
        this.editPriceStart.setOnEditorActionListener(this.editorActionListener);
        this.editPriceFinish.setOnEditorActionListener(this.editorActionListener);
        ((TextView) view.findViewById(R.id.currency)).setText(getArguments().getString("currency", ""));
        return view;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setNavigationIcon(R.drawable.ic_temp_close);
        getToolbar().setNavigationOnClickListener(MarketFilterPriceFragment$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$0(View v) {
        getActivity().setResult(0);
        getActivity().finish();
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        inflater.inflate(R.menu.price_filter, menu);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.ok /* 2131756533 */:
                done();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void done() {
        Intent intent = new Intent();
        long min = getArguments().getLong("min");
        long max = getArguments().getLong("max");
        long currentMin = getArguments().getLong("current_min");
        long currentMax = getArguments().getLong("current_max");
        try {
            currentMin = Long.parseLong(this.editPriceStart.getText().toString());
        } catch (Exception e) {
        }
        try {
            currentMax = Long.parseLong(this.editPriceFinish.getText().toString());
        } catch (Exception e2) {
        }
        if (currentMin < min || currentMin > max) {
            currentMin = min;
        }
        if (currentMax <= min || currentMax > max) {
            currentMax = max;
        }
        if (currentMin > currentMax) {
            long currentMin2 = currentMin + currentMax;
            currentMax = currentMin2 - currentMax;
            currentMin = currentMin2 - currentMax;
        }
        intent.putExtra("min", currentMin);
        intent.putExtra("max", currentMax);
        getActivity().setResult(-1, intent);
        getActivity().finish();
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.editPriceFinish = null;
        this.editPriceStart = null;
    }
}
