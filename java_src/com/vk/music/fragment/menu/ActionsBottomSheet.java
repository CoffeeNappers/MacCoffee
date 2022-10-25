package com.vk.music.fragment.menu;

import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.design.widget.BottomSheetDialogFragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.core.util.DrawableUtils;
import com.vk.core.util.Screen;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.ViewRefs;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.Collections;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
/* loaded from: classes2.dex */
public abstract class ActionsBottomSheet<Header extends Parcelable> extends BottomSheetDialogFragment {
    protected static final String ARG_ACTIONS = "actions";
    protected static final String ARG_EXT_ACTIONS = "extActions";
    protected static final String ARG_HEADER = "header";
    private static final int VIEW_TYPE_ACTION = 2;
    private static final int VIEW_TYPE_HEADER = 1;
    ArrayList<Action> actions;
    protected Callback<Header> callback;
    Header header;

    /* loaded from: classes2.dex */
    public interface Callback<T> {
        void onActionClick(@NonNull T t, int i);
    }

    @NonNull
    protected abstract ItemAdapter<Header> onCreateHeaderAdapter(int i);

    /* loaded from: classes2.dex */
    public static class ArgsBuilder<Header extends Parcelable> {
        @Nullable
        Callback<Header> callback;
        Header header;
        final ArrayList<Action> actions = new ArrayList<>();
        final ArrayList<Action> extActions = new ArrayList<>();

        public ArgsBuilder(Header header) {
            this.header = header;
        }

        public void callback(@Nullable Callback<Header> val) {
            this.callback = val;
        }

        public void addAction(int id, @DrawableRes int iconRes, @StringRes int labelRes) {
            this.actions.add(0, new Action(id, iconRes, labelRes));
        }

        public void addExtAction(int id, @DrawableRes int iconRes) {
            this.extActions.add(new Action(id, iconRes));
        }

        @NonNull
        public Bundle build() {
            Bundle args = new Bundle();
            args.putParcelable(ActionsBottomSheet.ARG_HEADER, this.header);
            args.putParcelableArrayList(ActionsBottomSheet.ARG_ACTIONS, this.actions);
            args.putParcelableArrayList(ActionsBottomSheet.ARG_EXT_ACTIONS, this.extActions);
            return args;
        }
    }

    @Override // android.support.v4.app.DialogFragment
    public int getTheme() {
        return R.style.BottomSheetTheme;
    }

    @Override // android.support.v4.app.DialogFragment, android.support.v4.app.Fragment
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle args = getArguments();
        this.header = (Header) args.getParcelable(ARG_HEADER);
        this.actions = args.getParcelableArrayList(ARG_ACTIONS);
    }

    @Override // android.support.v4.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        RecyclerView recyclerView = new RecyclerView(getActivity());
        recyclerView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(getActivity(), 1, true));
        ItemAdapter<Action> actionsAdapter = onCreateActionAdapter(2);
        actionsAdapter.setItems(this.actions);
        ItemAdapter<Header> headerAdapter = onCreateHeaderAdapter(1);
        headerAdapter.setItems(Collections.singletonList(this.header));
        MergeRecyclerAdapter adapter = new MergeRecyclerAdapter();
        adapter.setHasStableIds(true);
        adapter.addAdapter(actionsAdapter);
        adapter.addAdapter(headerAdapter);
        recyclerView.setAdapter(adapter);
        return recyclerView;
    }

    @NonNull
    protected ItemAdapter<Action> onCreateActionAdapter(int viewType) {
        IdResolver idResolver;
        final int lastActionPosition = this.actions.size() - 1;
        ItemAdapter.Builder registerClickListener = new ItemAdapter.Builder(LayoutInflater.from(getContext())).layout(R.layout.music_action_item).binder(new ItemViewHolder.Binder<Action>() { // from class: com.vk.music.fragment.menu.ActionsBottomSheet.1
            {
                ActionsBottomSheet.this = this;
            }

            @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
            @NonNull
            public ViewRefs onCreate(@NonNull View itemView) {
                return new ViewRefs().put(itemView);
            }

            @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
            public void onBind(@NonNull ViewRefs refs, @NonNull Action actionInfo, int position) {
                TextView label = (TextView) refs.next();
                DrawableUtils.setLeft(label, actionInfo.iconRes, (int) R.color.music_action_button_gray);
                if (actionInfo.hasTitle()) {
                    label.setText(actionInfo.stringRes);
                } else {
                    label.setText((CharSequence) null);
                }
                if (position == lastActionPosition) {
                    RecyclerView.LayoutParams params = (RecyclerView.LayoutParams) label.getLayoutParams();
                    params.topMargin = Screen.dp(8);
                    label.requestLayout();
                } else if (position == 0) {
                    RecyclerView.LayoutParams params2 = (RecyclerView.LayoutParams) label.getLayoutParams();
                    params2.bottomMargin = Screen.dp(8);
                    label.requestLayout();
                }
            }
        }).registerClickListener(ActionsBottomSheet$$Lambda$1.lambdaFactory$(this));
        idResolver = ActionsBottomSheet$$Lambda$2.instance;
        return registerClickListener.resolver(idResolver).viewType(viewType).build();
    }

    public /* synthetic */ void lambda$onCreateActionAdapter$0(View v, Action actionInfo, int position) {
        onActionClick(this.header, actionInfo.id);
        dismiss();
    }

    public void setCallback(@Nullable Callback<Header> callback) {
        this.callback = callback;
    }

    @Override // android.support.v4.app.DialogFragment, android.support.v4.app.Fragment
    public void onDestroyView() {
        this.callback = null;
        super.onDestroyView();
    }

    public void onActionClick(@NonNull Header header, int actionId) {
        if (this.callback != null) {
            this.callback.onActionClick(header, actionId);
        }
        dismiss();
    }
}
