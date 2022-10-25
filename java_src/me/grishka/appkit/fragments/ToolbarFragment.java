package me.grishka.appkit.fragments;

import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public abstract class ToolbarFragment extends ContainerFragment {
    protected View content;
    protected int layoutID;

    public abstract View onCreateContentView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle);

    public ToolbarFragment() {
        this(R.layout.appkit_toolbar_fragment);
    }

    protected ToolbarFragment(@LayoutRes int layout) {
        this.layoutID = layout;
    }

    @LayoutRes
    protected int getLayout() {
        return this.layoutID;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setLayout(int id) {
        if (this.content != null) {
            throw new IllegalStateException("Can't set layout when view is already created");
        }
        this.layoutID = id;
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.content = inflater.inflate(this.layoutID, (ViewGroup) null);
        ViewGroup contentWrap = (ViewGroup) this.content.findViewById(R.id.appkit_content);
        contentWrap.addView(onCreateContentView(inflater, container, savedInstanceState));
        return this.content;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.content = null;
    }
}
