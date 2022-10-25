package com.vkontakte.android.ui.holder.documents;

import android.content.Context;
import android.content.Intent;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.docs.DocTypesLoader;
import com.vkontakte.android.api.docs.DocsGetTypes;
import com.vkontakte.android.attachments.DocumentAttachment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.commons.LoaderHolder;
import com.vkontakte.android.ui.widget.SubPagerOfList;
import com.vkontakte.android.ui.widget.SubPagerOfListItem;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes3.dex */
public class DocumentsTabbedHolder extends RecyclerHolder<SubPagerOfList.ArrayListWithIndex<DocTypeData>> {
    private SubPagerOfList viewPager;

    /* loaded from: classes3.dex */
    public static class DocTypeData {
        @NonNull
        public final DocsGetTypes.DocType docType;
        private DocTypesLoader docTypesLoader = null;
        public DocumentsAdapter docsAdapter;
        public ArrayList<Document> documents;
        public final int ownerId;

        public DocTypeData(@NonNull DocsGetTypes.DocType docType, @Nullable ArrayList<Document> documents, int ownerId) {
            this.docType = docType;
            this.documents = documents == null ? new ArrayList<>() : documents;
            this.ownerId = ownerId;
        }

        public DocumentsAdapter getDocsAdapter(@NonNull Context ctx) {
            if (this.docsAdapter == null) {
                this.docsAdapter = new DocumentsAdapter(this.documents, this.docType.name, ctx, true, this);
                this.docTypesLoader = new DocTypesLoader(this.documents, this.docType.id, this.ownerId) { // from class: com.vkontakte.android.ui.holder.documents.DocumentsTabbedHolder.DocTypeData.1
                    @Override // com.vkontakte.android.api.docs.DocTypesLoader
                    public void onLoadedNextPage(ArrayList<Document> allData, boolean canLoadMore) {
                        DocumentsAdapter documentsAdapter = DocTypeData.this.docsAdapter;
                        DocTypeData.this.documents = allData;
                        documentsAdapter.setData(allData, canLoadMore);
                    }
                };
            }
            return this.docsAdapter;
        }

        public void onNeedLoadNextPage() {
            if (this.docTypesLoader != null) {
                this.docTypesLoader.forceLoadNextPage();
            }
        }
    }

    public DocumentsTabbedHolder(@NonNull ViewGroup parent) {
        super((int) R.layout.apps_genre_tabs, parent);
        this.viewPager = (SubPagerOfList) $(R.id.pager);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(SubPagerOfList.ArrayListWithIndex<DocTypeData> data) {
        List<SubPagerOfListItem.SubPagerOfListAdapter> baseAdapters = new ArrayList<>();
        Iterator<DocTypeData> it = data.iterator();
        while (it.hasNext()) {
            DocTypeData type = it.next();
            baseAdapters.add(type.getDocsAdapter(getContext()));
        }
        this.viewPager.setData(baseAdapters, R.dimen.doc_item_height, null, DocumentsTabbedHolder$$Lambda$1.lambdaFactory$(this, data));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onBind$0(SubPagerOfList.ArrayListWithIndex data) {
        ((LinearLayoutManager) ((RecyclerView) getParent()).getLayoutManager()).scrollToPositionWithOffset(data.index, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class DocumentsAdapter extends SubPagerOfListItem.SubPagerOfListAdapter {
        private static final int VIEW_TYPE_DOC = 0;
        private static final int VIEW_TYPE_LOADER = 1;
        private final Context context;
        private ArrayList<Document> data;
        private boolean isLoaderShowing;
        @NonNull
        private final DocTypeData onNeedLoadNextPage;
        private final String title;

        public DocumentsAdapter(@NonNull ArrayList<Document> data, @Nullable String title, @NonNull Context context, boolean isLoaderShowing, @NonNull DocTypeData onNeedLoadNextPage) {
            this.isLoaderShowing = false;
            this.isLoaderShowing = isLoaderShowing;
            this.data = data;
            this.title = title;
            this.context = context;
            this.onNeedLoadNextPage = onNeedLoadNextPage;
        }

        public void setData(@NonNull ArrayList<Document> data, boolean isLoaderShowing) {
            this.data = data;
            this.isLoaderShowing = isLoaderShowing;
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return (!this.isLoaderShowing || position < this.data.size()) ? 0 : 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    DocumentHolder<Document> documentHolder = new DocumentHolder<Document>(this.context) { // from class: com.vkontakte.android.ui.holder.documents.DocumentsTabbedHolder.DocumentsAdapter.1
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

                        @Override // com.vkontakte.android.ui.holder.documents.DocumentHolder, me.grishka.appkit.views.UsableRecyclerView.Clickable
                        public void onClick() {
                            ArrayList<Parcelable> al = new ArrayList<>();
                            al.add(new DocumentAttachment((Document) getItem()));
                            Intent result = new Intent();
                            result.putExtra("documents", al);
                            Utils.castToActivity(getContext()).setResult(-1, result);
                            Utils.castToActivity(getContext()).finish();
                        }
                    };
                    documentHolder.itemView.setClickable(true);
                    documentHolder.itemView.setOnClickListener(documentHolder);
                    documentHolder.itemView.setBackgroundResource(R.drawable.highlight);
                    return documentHolder;
                default:
                    return new LoaderHolder(parent);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
            switch (getItemViewType(position)) {
                case 0:
                    ((DocumentHolder) holder).bind(this.data.get(position));
                    return;
                default:
                    return;
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.isLoaderShowing ? this.data.size() + 1 : this.data.size();
        }

        @Override // com.vkontakte.android.ui.widget.SubPagerOfListItem.SubPagerOfListAdapter
        public String getTitle() {
            return this.title;
        }

        @Override // com.vkontakte.android.ui.widget.SubPagerOfListItem.SubPagerOfListAdapter
        public void onScroll(RecyclerView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
            if (visibleItemCount + firstVisibleItem >= totalItemCount - 3) {
                this.onNeedLoadNextPage.onNeedLoadNextPage();
            }
        }
    }
}
