package com.vk.lists;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
/* loaded from: classes2.dex */
public interface FooterViewProvider {
    public static final FooterViewProvider DEFAULT = new FooterViewProvider() { // from class: com.vk.lists.FooterViewProvider.1
        @Override // com.vk.lists.FooterViewProvider
        public FooterView createFooterView(Context context) {
            FooterView view = new FooterView(context);
            view.setLayoutParams(new RecyclerView.LayoutParams(-1, -2));
            view.setErrorView(createFooterErrorView(context));
            view.setLoadingView(createFooterLoadingView(context));
            return view;
        }

        @Override // com.vk.lists.FooterViewProvider
        public View createFooterLoadingView(Context context) {
            return LayoutInflater.from(context).inflate(R.layout.view_defaul_list_loading, (ViewGroup) null);
        }

        @Override // com.vk.lists.FooterViewProvider
        public AbstractErrorView createFooterErrorView(Context context) {
            return new DefaultListErrorView(context);
        }
    };

    AbstractErrorView createFooterErrorView(Context context);

    View createFooterLoadingView(Context context);

    FooterView createFooterView(Context context);
}
