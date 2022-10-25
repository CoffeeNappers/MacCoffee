package com.vkontakte.android.fragments.money;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.VKTabbedFragment;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class MoneyTransfersHistoryFragment extends VKTabbedFragment {
    private MoneyTransfersFragment receivedTransfersFragment;
    private MoneyTransfersFragment sentTransfersFragment;

    @Override // me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.money_transfer_money_transfers);
        List<String> titles = new ArrayList<>(2);
        titles.add(getResources().getString(R.string.money_transfer_sent));
        titles.add(getResources().getString(R.string.money_transfer_received));
        this.sentTransfersFragment = createMoneyTransfersFragment(1, true);
        this.receivedTransfersFragment = createMoneyTransfersFragment(2, false);
        List<Fragment> tabs = new ArrayList<>();
        tabs.add(this.sentTransfersFragment);
        tabs.add(this.receivedTransfersFragment);
        setTabs(tabs, titles);
    }

    private MoneyTransfersFragment createMoneyTransfersFragment(int filter, boolean showHeader) {
        MoneyTransfersFragment f = new MoneyTransfersFragment();
        Bundle b = new Bundle();
        b.putInt(MoneyTransfersFragment.FILTER_ARGUMENT, filter);
        b.putBoolean(MoneyTransfersFragment.SHOW_HEADER_ARGUMENT, showHeader);
        f.setArguments(b);
        return f;
    }
}
