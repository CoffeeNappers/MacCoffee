package com.vkontakte.android.fragments.documents;

import android.app.DownloadManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.Parcelable;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.docs.DocsDelete;
import com.vkontakte.android.api.docs.DocsGet;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.gifs.GifViewer;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.holder.documents.DocumentHolder;
import com.vkontakte.android.utils.Utils;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.api.PaginatedList;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class DocumentsByTypeFragment extends VKRecyclerFragment<Document> {
    private static final String PRELOADED_DOCS = "preloaded_docs";
    private DocsAdapter docsAdapter;

    public static DocumentsByTypeFragment create(int ownerId, int typeId, VKList<Document> documents) {
        DocumentsByTypeFragment fragment = new DocumentsByTypeFragment();
        Bundle bundle = new Bundle();
        bundle.putInt("owner_id", ownerId);
        bundle.putInt(ArgKeys.TYPE_ID, typeId);
        bundle.putParcelableArrayList(PRELOADED_DOCS, documents);
        fragment.setArguments(bundle);
        return fragment;
    }

    public DocumentsByTypeFragment() {
        super(50);
        this.docsAdapter = new DocsAdapter();
        setRefreshEnabled(false);
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ArrayList<Parcelable> list = getArguments().getParcelableArrayList(PRELOADED_DOCS);
        if (list != null) {
            ArrayList<Document> documents = new ArrayList<>(list.size());
            Iterator<Parcelable> it = list.iterator();
            while (it.hasNext()) {
                Parcelable p = it.next();
                documents.add((Document) p);
            }
            onDataLoaded(documents);
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (getActivity() != null) {
            int ownerID = getArguments().getInt("owner_id");
            int typeID = getArguments().getInt(ArgKeys.TYPE_ID);
            this.currentRequest = new DocsGet(ownerID, offset, count, typeID).setCallback(new SimpleCallback<VKList<Document>>(this) { // from class: com.vkontakte.android.fragments.documents.DocumentsByTypeFragment.1
                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<Document> res) {
                    DocumentsByTypeFragment.this.getActivity().invalidateOptionsMenu();
                    DocumentsByTypeFragment.this.onDataLoaded((PaginatedList) res);
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                }
            }).exec((Context) getActivity());
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        return this.docsAdapter;
    }

    void onDocumentClick(Document doc) {
        String thumb = doc.thumb;
        if (thumb != null && thumb.length() > 0) {
            if (doc.getExt().toLowerCase().equals("gif")) {
                GifViewer.start(Utils.castToActivity(getContext()), doc);
                return;
            } else {
                new PhotoViewer(getActivity(), doc.url, doc.title).show();
                return;
            }
        }
        Uri uri = Uri.parse(doc.url);
        DownloadManager.Request req = new DownloadManager.Request(uri);
        req.setDestinationUri(Uri.fromFile(new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), TextUtils.isEmpty(doc.getTitle()) ? uri.getLastPathSegment() : doc.getTitle().replace('/', '_'))));
        req.setNotificationVisibility(1);
        req.allowScanningByMediaScanner();
        DownloadManager mgr = (DownloadManager) getActivity().getSystemService("download");
        mgr.enqueue(req);
    }

    boolean onDocumentLongClick(Document doc) {
        int ownerID = getArguments().getInt("owner_id", 0);
        if (VKAccountManager.isCurrentUser(ownerID) || ownerID == 0 || (ownerID < 0 && Groups.isGroupAdmin(-ownerID))) {
            new VKAlertDialog.Builder(getActivity()).setItems(new String[]{getString(R.string.download), getString(R.string.delete)}, DocumentsByTypeFragment$$Lambda$1.lambdaFactory$(this, doc)).show();
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onDocumentLongClick$0(Document doc, DialogInterface dialog, int which) {
        switch (which) {
            case 0:
                startActivity(new Intent("android.intent.action.VIEW", Uri.parse(doc.url)));
                return;
            case 1:
                confirmAndDelete(doc);
                return;
            default:
                return;
        }
    }

    private void confirmAndDelete(Document doc) {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.document_delete_confirm).setPositiveButton(R.string.yes, DocumentsByTypeFragment$$Lambda$2.lambdaFactory$(this, doc)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$confirmAndDelete$1(Document doc, DialogInterface dialog, int which) {
        doDelete(doc);
    }

    private void doDelete(final Document doc) {
        new DocsDelete(doc.oid, doc.did).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.documents.DocumentsByTypeFragment.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                int index = DocumentsByTypeFragment.this.data.indexOf(doc);
                DocumentsByTypeFragment.this.data.remove(doc);
                DocumentsByTypeFragment.this.updateListRemoveItem(index);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public void updateListRemoveItem(int position) {
        if (this.docsAdapter != null && position >= 0) {
            this.docsAdapter.notifyItemRemoved(position);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class DocsAdapter extends UsableRecyclerView.Adapter<DocumentHolder<Document>> {
        DocsAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public DocumentHolder<Document> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new DocumentHolder<Document>(parent.getContext()) { // from class: com.vkontakte.android.fragments.documents.DocumentsByTypeFragment.DocsAdapter.1
                @Override // com.vkontakte.android.ui.holder.documents.DocumentHolder, me.grishka.appkit.views.UsableRecyclerView.Clickable
                public void onClick() {
                    DocumentsByTypeFragment.this.onDocumentClick((Document) getItem());
                }

                @Override // com.vkontakte.android.ui.holder.documents.DocumentHolder, me.grishka.appkit.views.UsableRecyclerView.LongClickable
                public boolean onLongClick() {
                    return DocumentsByTypeFragment.this.onDocumentLongClick((Document) getItem());
                }

                /* JADX INFO: Access modifiers changed from: protected */
                @Override // com.vkontakte.android.ui.holder.documents.DocumentHolder
                public void setInfo(TextView info, Document doc) {
                    super.setInfo(info, (TextView) doc);
                    if (TextUtils.isEmpty(((Document) getItem()).thumb)) {
                        this.thumb.setVisibility(4);
                        return;
                    }
                    this.thumb.setVisibility(0);
                    this.thumb.load(((Document) getItem()).thumb);
                }
            };
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(DocumentHolder<Document> holder, int position) {
            holder.bind(DocumentsByTypeFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return DocumentsByTypeFragment.this.data.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((Document) DocumentsByTypeFragment.this.data.get(position)).thumb;
        }
    }
}
