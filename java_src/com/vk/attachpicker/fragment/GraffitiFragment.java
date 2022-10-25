package com.vk.attachpicker.fragment;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.attachpicker.AttachActivity;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.GraffitiActivity;
import com.vk.attachpicker.GraffitiConfirmDialog;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vk.core.util.Screen;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.messages.MessagesGetRecentGraffities;
import com.vkontakte.android.api.messages.MessagesHideRecentGraffiti;
import java.util.ArrayList;
import me.grishka.appkit.api.APIRequest;
import me.grishka.appkit.fragments.BaseRecyclerFragment;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GraffitiFragment extends BaseRecyclerFragment<Document> implements SupportExternalToolbarContainer {
    private static final int GRAFFITI_REQUEST = 150;
    private GraffitiAdapter adapter;
    protected APIRequest currentRequest;
    private String graffitiAvatar;
    private String graffitiTitle;
    private LinearLayout header;
    private View newGraffitiButton;
    private ViewGroup toolbar;

    public GraffitiFragment() {
        super(20);
        setListLayoutId(R.layout.picker_fragment_graffiti2);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            this.graffitiAvatar = getArguments().getString(AttachIntent.INTENT_GRAFFITI_AVATAR);
            this.graffitiTitle = getArguments().getString(AttachIntent.INTENT_GRAFFITI_TITLE);
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.header = (LinearLayout) inflater.inflate(R.layout.picker_layout_graffiti_header, (ViewGroup) null);
        this.newGraffitiButton = this.header.findViewById(R.id.fl_new_graffiti);
        this.newGraffitiButton.setOnClickListener(GraffitiFragment$$Lambda$1.lambdaFactory$(this));
        return super.onCreateContentView(inflater, container, savedInstanceState);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateContentView$0(View v) {
        Intent intent = new Intent(v.getContext(), GraffitiActivity.class);
        if (this.graffitiAvatar != null) {
            intent.putExtra(AttachIntent.INTENT_GRAFFITI_AVATAR, this.graffitiAvatar);
        }
        if (this.graffitiTitle != null) {
            intent.putExtra(AttachIntent.INTENT_GRAFFITI_TITLE, this.graffitiTitle);
        }
        startActivityForResult(intent, 150);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.list.setPadding(0, V.dp(8.0f), 0, 0);
        getToolbar().setVisibility(8);
        view.setBackgroundColor(-1);
        setRefreshEnabled(false);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        loadData();
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        if (this.toolbar == null) {
            this.toolbar = (ViewGroup) LayoutInflater.from(context).inflate(R.layout.picker_toolbar_graffiti, (ViewGroup) null);
        }
        return this.toolbar;
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        Activity a = getActivity();
        if (a != null && requestCode == 150 && resultCode == -1) {
            a.setResult(-1, data);
            if (a instanceof AttachActivity) {
                ((AttachActivity) a).superFinish();
            } else {
                a.finish();
            }
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (this.currentRequest != null) {
            this.currentRequest.cancel();
        }
        this.currentRequest = new MessagesGetRecentGraffities().setCallback(new SimpleCallback<ArrayList<Document>>(this) { // from class: com.vk.attachpicker.fragment.GraffitiFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(ArrayList<Document> documents) {
                GraffitiFragment.this.currentRequest = null;
                GraffitiFragment.this.onDataLoaded(documents, false);
                GraffitiFragment.this.mo1066getAdapter().setData(documents);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                GraffitiFragment.this.currentRequest = null;
                super.fail(error);
            }
        }).exec((View) this.list);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public GraffitiAdapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new GraffitiAdapter(getActivity());
        }
        return this.adapter;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class GraffitiAdapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
        private final Context context;
        private final int TYPE_HEADER = 0;
        private final int TYPE_GRAFFITI = 1;
        private final ArrayList<Document> graffities = new ArrayList<>();
        private boolean isEmpty = false;

        public GraffitiAdapter(Context context) {
            this.context = context;
            setHasStableIds(true);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return viewType == 0 ? new HeaderHolder() : new GraffitiHolder(this.context);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            if (holder instanceof GraffitiHolder) {
                ((GraffitiHolder) holder).bind(this.graffities.get(position - 1));
            } else if (holder instanceof HeaderHolder) {
                ((HeaderHolder) holder).setIsEmpty(this.isEmpty);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.graffities.size() + 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return position == 0 ? 0 : 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            if (position == 0) {
                return 0L;
            }
            return this.graffities.get(position - 1).did;
        }

        public void setData(ArrayList<Document> docs) {
            this.graffities.clear();
            if (docs != null) {
                this.graffities.addAll(docs);
            }
            notifyDataSetChanged();
            this.isEmpty = this.graffities.size() == 0;
        }

        public void removeGraffiti(Document document) {
            if (document != null) {
                int did = document.did;
                int i = 0;
                while (true) {
                    if (i >= this.graffities.size()) {
                        break;
                    } else if (this.graffities.get(i).did != did) {
                        i++;
                    } else {
                        this.graffities.remove(i);
                        notifyItemRemoved(i + 1);
                        break;
                    }
                }
                if (this.graffities.size() == 0) {
                    Picker.runDelayed(GraffitiFragment$GraffitiAdapter$$Lambda$1.lambdaFactory$(this), 300L);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$removeGraffiti$0() {
            this.isEmpty = this.graffities.size() == 0;
            notifyDataSetChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class HeaderHolder extends UsableRecyclerView.ViewHolder {
        private final TextView emptyView;

        public HeaderHolder() {
            super(GraffitiFragment.this.header);
            this.emptyView = (TextView) this.itemView.findViewById(R.id.tv_empty);
        }

        public void setIsEmpty(boolean isEmpty) {
            if (isEmpty) {
                this.emptyView.setVisibility(0);
            } else {
                this.emptyView.setVisibility(8);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class GraffitiHolder extends UsableRecyclerView.ViewHolder implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
        private Document document;

        public GraffitiHolder(Context context) {
            super(new VKImageView(context));
            ((VKImageView) this.itemView).setActualScaleType(ScalingUtils.ScaleType.FIT_CENTER);
            ((VKImageView) this.itemView).setAspectRatio(1.0f);
            int p = Screen.dp(8);
            this.itemView.setPadding(p, p, p, p);
        }

        public void bind(Document document) {
            this.document = document;
            ((VKImageView) this.itemView).load(document.thumb, ImageSize.MID);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            Activity a = GraffitiFragment.this.getActivity();
            if (a != null && this.document != null) {
                new GraffitiConfirmDialog(a, this.document).show();
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
        public boolean onLongClick() {
            Activity a = GraffitiFragment.this.getActivity();
            if (a == null || this.document == null) {
                return false;
            }
            Document clickDoc = this.document;
            AlertDialog.Builder builder = new AlertDialog.Builder(a);
            builder.setItems(new String[]{a.getString(R.string.delete)}, GraffitiFragment$GraffitiHolder$$Lambda$1.lambdaFactory$(this, clickDoc, a));
            builder.show();
            return true;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onLongClick$0(final Document clickDoc, final Activity a, DialogInterface dialog, int which) {
            if (which == 0) {
                new MessagesHideRecentGraffiti(clickDoc.did).setCallback(new Callback<Integer>() { // from class: com.vk.attachpicker.fragment.GraffitiFragment.GraffitiHolder.1
                    @Override // com.vkontakte.android.api.Callback
                    public void success(Integer result) {
                        if (result != null && result.intValue() == 1) {
                            GraffitiFragment.this.mo1066getAdapter().removeGraffiti(clickDoc);
                        } else {
                            onFail();
                        }
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                        onFail();
                    }

                    private void onFail() {
                        Toast.makeText(a, (int) R.string.picker_graffiti_delete_result, 0).show();
                    }
                }).exec();
            }
        }
    }
}
