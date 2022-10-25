package com.vkontakte.android.fragments.documents;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;
import com.facebook.common.util.UriUtil;
import com.vk.attachpicker.AttachActivity;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.PhotoVideoAttachActivity;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.docs.DocsGetTypes;
import com.vkontakte.android.attachments.PendingDocumentAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.CardRecyclerFragment;
import com.vkontakte.android.fragments.utils.FilePickerFragment;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.holder.documents.ChoiceDocumentHeaderHolder;
import com.vkontakte.android.ui.holder.documents.DocumentsTabbedHolder;
import com.vkontakte.android.ui.widget.SubPagerOfList;
import com.vkontakte.android.upload.Upload;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class DocumentsChooserFragment extends CardRecyclerFragment<List<DocsGetTypes.DocType>> implements SupportExternalToolbarContainer {
    private static final int FILE_RESULT = 103;
    private static final int PHOTO_RESULT = 101;
    private Adapter adapter;

    private boolean isInContextOfAttachActivity() {
        return getActivity() instanceof AttachActivity;
    }

    public DocumentsChooserFragment() {
        super(50);
        this.adapter = null;
        setRefreshEnabled(false);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new Adapter();
        }
        return this.adapter;
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.docs_add_title);
        setEmptyText(R.string.no_docs);
        setHasOptionsMenu(true);
        loadData();
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.list.setBackgroundColor(-1315344);
        if (isInContextOfAttachActivity()) {
            view.setBackgroundColor(-1);
            getToolbar().setVisibility(8);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean canGoBack() {
        return !isInContextOfAttachActivity() && super.canGoBack();
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return !isInContextOfAttachActivity() && super.hasNavigationDrawer();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        int ownerId = getArguments().getInt("owner_id");
        this.currentRequest = new DocsGetTypes(ownerId).setCallback(new Callback<DocsGetTypes.Result>() { // from class: com.vkontakte.android.fragments.documents.DocumentsChooserFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(DocsGetTypes.Result result) {
                DocumentsChooserFragment.this.adapter.setData(result);
                DocumentsChooserFragment.this.onDataLoaded(Collections.singletonList(result.docTypes), false);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                DocumentsChooserFragment.this.onError(error);
                ViewUtils.setVisibilityAnimated(DocumentsChooserFragment.this.errorView, 0);
                ViewUtils.setVisibilityAnimated(DocumentsChooserFragment.this.progress, 8);
                DocumentsChooserFragment.this.currentRequest = null;
            }
        }).exec((View) this.contentView);
    }

    public void choiceDocFromGallery() {
        Intent intent = new Intent(getActivity(), PhotoVideoAttachActivity.class);
        intent.putExtra(AttachIntent.INTENT_SELECTION_LIMIT, 10);
        intent.putExtra(AttachIntent.INTENT_PREVENT_STYLING, true);
        intent.putExtra("media_type", 111);
        startActivityForResult(intent, 101);
    }

    public void choiceDocFromStorage() {
        new FilePickerFragment.Builder().setSizeLimit(209715200L).forResult(this, 103);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (resCode == -1) {
            ArrayList<PendingDocumentAttachment> docs = new ArrayList<>();
            if (reqCode == 101) {
                Bundle resultBundle = data.getBundleExtra(AttachIntent.RESULT_ATTACHMENTS);
                if (resultBundle != null) {
                    ArrayList<Uri> files = resultBundle.getParcelableArrayList(AttachIntent.RESULT_FILES);
                    if (files != null) {
                        Iterator<Uri> it = files.iterator();
                        while (it.hasNext()) {
                            Uri uri = it.next();
                            if (UriUtil.LOCAL_FILE_SCHEME.equals(uri.getScheme()) || UriUtil.LOCAL_CONTENT_SCHEME.equals(uri.getScheme())) {
                                int size = (int) new File(uri.getPath()).length();
                                String[] ext = uri.getLastPathSegment().split("\\.");
                                docs.add(new PendingDocumentAttachment(uri.getLastPathSegment(), uri.toString(), size, uri.toString(), 0, Upload.getNewID(), ext[ext.length - 1]));
                            }
                        }
                    } else {
                        return;
                    }
                }
            } else if (reqCode == 103) {
                Iterator it2 = data.getParcelableArrayListExtra("files").iterator();
                while (it2.hasNext()) {
                    Parcelable p = (Parcelable) it2.next();
                    docs.add((PendingDocumentAttachment) p);
                }
            }
            if (!docs.isEmpty()) {
                Intent result = new Intent();
                result.putExtra("documents", docs);
                getActivity().setResult(-1, result);
                getActivity().finish();
            }
        }
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        return getToolbar();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class Adapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> implements CardItemDecorator.Provider {
        SubPagerOfList.ArrayListWithIndex<DocumentsTabbedHolder.DocTypeData> docTypes = new SubPagerOfList.ArrayListWithIndex<>();

        Adapter() {
        }

        public void setData(DocsGetTypes.Result res) {
            this.docTypes.clear();
            int i = 0;
            while (i < res.docTypes.size()) {
                DocsGetTypes.DocType docType = res.docTypes.get(i);
                this.docTypes.add(new DocumentsTabbedHolder.DocTypeData(docType, i == 0 ? res.docs : null, VKAccountManager.getCurrent().getUid()));
                i++;
            }
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new ChoiceDocumentHeaderHolder(parent);
                default:
                    return new DocumentsTabbedHolder(parent);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            if (position == 0) {
                ((ChoiceDocumentHeaderHolder) holder).bind(DocumentsChooserFragment.this);
                return;
            }
            this.docTypes.index = 1;
            ((DocumentsTabbedHolder) holder).bind(this.docTypes);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return position == 0 ? 0 : 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return 2;
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return 4;
        }
    }
}
