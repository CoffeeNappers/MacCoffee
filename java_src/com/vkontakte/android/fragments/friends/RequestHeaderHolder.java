package com.vkontakte.android.fragments.friends;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.Locale;
/* loaded from: classes2.dex */
public class RequestHeaderHolder extends RecyclerHolder<CharSequence> {
    private final TextView counter;
    private boolean suggestions;
    private final TextView title;

    public RequestHeaderHolder(ViewGroup parent) {
        super((int) R.layout.friends_header_request, parent);
        this.title = (TextView) $(R.id.title);
        this.title.setTypeface(Font.Medium.typeface);
        this.counter = (TextView) $(R.id.counter);
        this.counter.setTypeface(Font.Medium.typeface);
        TextView action = (TextView) $(R.id.action);
        action.setTypeface(Font.Medium.typeface);
        action.setOnClickListener(RequestHeaderHolder$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(View view) {
        Bundle args = new Bundle();
        args.putBoolean("menu_clear_all", !this.suggestions);
        args.putBoolean("suggests", this.suggestions);
        Navigate.to(FriendRequestsFragment.class, args, getContext());
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(CharSequence item) {
        this.title.setText(item);
    }

    public void setShowSuggestions(boolean show) {
        this.suggestions = show;
    }

    public void setRequestsCount(int count) {
        if (count > 1000000) {
            this.counter.setText(String.format(Locale.getDefault(), "%.2fM", Float.valueOf(count / 1000000.0f)));
        } else if (count > 1000) {
            this.counter.setText(String.format(Locale.getDefault(), "%.2fK", Float.valueOf(count / 1000.0f)));
        } else {
            this.counter.setText(String.valueOf(count));
        }
    }
}
