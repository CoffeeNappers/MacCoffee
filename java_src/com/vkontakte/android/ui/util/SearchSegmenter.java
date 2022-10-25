package com.vkontakte.android.ui.util;

import android.os.Looper;
import android.os.Message;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.fragments.friends.SearchIndexer;
import com.vkontakte.android.ui.util.Segmenter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import me.grishka.appkit.api.APIRequest;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.api.PaginatedList;
/* loaded from: classes3.dex */
public class SearchSegmenter<T> implements Segmenter {
    RecyclerView.Adapter mAdapter;
    final int mCount;
    APIRequest mCurrentSearchRequest;
    List<T> mData;
    final Generator<? extends T> mGenerator;
    CharSequence mGlobalTitle;
    LoadingListener<T> mListener;
    List<T> mLocalSearchData;
    int mOffset;
    String mQuery;
    SearchIndexer<T> mSearchIndexer;
    final Handler mHandler = new Handler();
    final Segmenter.Footer mFooter = new Segmenter.Footer();
    final List<T> mGlobalSearchData = new ArrayList();
    boolean mMoreAvailable = false;
    boolean mExecuting = false;

    /* loaded from: classes3.dex */
    public interface Generator<T> {
        VKAPIRequest<? extends PaginatedList<? extends T>> getSearchRequest(String str, int i, int i2);
    }

    /* loaded from: classes3.dex */
    public interface LoadingListener<T> {
        void onError(ErrorResponse errorResponse, String str, int i, int i2);

        void onSuccess(PaginatedList<? extends T> paginatedList, String str, int i, int i2);
    }

    void runSearchRequest(final int offset, final int count) {
        if (!this.mExecuting) {
            if (this.mCurrentSearchRequest != null) {
                this.mCurrentSearchRequest.cancel();
            }
            if (this.mFooter.mState != Segmenter.Footer.State.Loading) {
                this.mFooter.mState = Segmenter.Footer.State.Loading;
                notifyDataSetChanged();
            }
            this.mExecuting = true;
            this.mCurrentSearchRequest = this.mGenerator.getSearchRequest(this.mQuery, offset, count).setCallback(new Callback<PaginatedList<? extends T>>() { // from class: com.vkontakte.android.ui.util.SearchSegmenter.1
                @Override // com.vkontakte.android.api.Callback
                public /* bridge */ /* synthetic */ void success(Object obj) {
                    success((PaginatedList) ((PaginatedList) obj));
                }

                public void success(PaginatedList<? extends T> result) {
                    if (SearchSegmenter.this.mListener != null) {
                        SearchSegmenter.this.mListener.onSuccess(result, SearchSegmenter.this.mQuery, offset, count);
                    }
                    for (int i = 0; i < result.size(); i++) {
                        T item = result.get(i);
                        if (SearchSegmenter.this.mLocalSearchData.indexOf(item) < 0) {
                            SearchSegmenter.this.mGlobalSearchData.add(item);
                        }
                    }
                    SearchSegmenter searchSegmenter = SearchSegmenter.this;
                    SearchSegmenter searchSegmenter2 = SearchSegmenter.this;
                    int i2 = offset + count;
                    searchSegmenter2.mOffset = i2;
                    searchSegmenter.mMoreAvailable = i2 < result.total();
                    SearchSegmenter.this.mFooter.mState = Segmenter.Footer.State.Loading;
                    SearchSegmenter.this.notifyDataSetChanged();
                    SearchSegmenter.this.mExecuting = false;
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    if (SearchSegmenter.this.mListener != null) {
                        SearchSegmenter.this.mListener.onError(error, SearchSegmenter.this.mQuery, offset, count);
                    }
                    SearchSegmenter.this.mFooter.mState = Segmenter.Footer.State.Error;
                    SearchSegmenter.this.mFooter.mText = APIUtils.getLocalizedError(VKApplication.context, error.getCode(), error.message);
                    SearchSegmenter.this.mExecuting = false;
                }
            }).exec(Looper.getMainLooper());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SearchSegmenter(@Nullable SearchIndexer.Provider<? super T> provider, Generator<T> generator, int count) {
        this.mSearchIndexer = new SearchIndexer<>(provider);
        this.mGenerator = generator;
        this.mCount = count;
    }

    public void attach(RecyclerView list) {
        this.mAdapter = list.mo1204getAdapter();
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public void onScrollToLastItem() {
        if (this.mMoreAvailable) {
            runSearchRequest(this.mOffset, this.mCount);
        }
    }

    public void bind(List<T> data) {
        this.mData = data;
        this.mSearchIndexer.bind(this.mData);
        this.mSearchIndexer.build();
    }

    public void remove(T object) {
        if (this.mLocalSearchData != null) {
            this.mLocalSearchData.remove(object);
        }
        this.mGlobalSearchData.remove(object);
    }

    public SearchSegmenter<T> setGlobalTitle(CharSequence title) {
        this.mGlobalTitle = title;
        return this;
    }

    public void search(String query, boolean global) {
        this.mQuery = query;
        this.mLocalSearchData = this.mSearchIndexer.search(query);
        if (this.mCurrentSearchRequest != null) {
            this.mCurrentSearchRequest.cancel();
        }
        this.mExecuting = false;
        this.mGlobalSearchData.clear();
        this.mMoreAvailable = global;
        notifyDataSetChanged();
        if (global) {
            this.mHandler.removeCallbacksAndMessages(null);
            Message message = this.mHandler.obtainMessage();
            message.obj = this;
            this.mHandler.sendMessageDelayed(message, 400L);
        }
    }

    public void search(String query) {
        search(query, true);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getItemCount() {
        int count = 0;
        if (!empty(this.mLocalSearchData)) {
            count = 0 + this.mLocalSearchData.size();
        }
        if (!empty(this.mGlobalSearchData)) {
            return count + this.mGlobalSearchData.size() + 1;
        }
        return count;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentsCount() {
        int count = 0;
        if (!empty(this.mLocalSearchData)) {
            count = 0 + 1;
        }
        if (!empty(this.mGlobalSearchData)) {
            return count + 1;
        }
        return count;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentItemsCount(int segment) {
        if (empty(this.mLocalSearchData) || segment == 1) {
            if (!empty(this.mGlobalSearchData)) {
                return this.mGlobalSearchData.size();
            }
        } else if (!empty(this.mLocalSearchData)) {
            return this.mLocalSearchData.size();
        }
        return 0;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getPositionForSegment(int segment) {
        if (segment != 1 || empty(this.mLocalSearchData)) {
            return 0;
        }
        return this.mLocalSearchData.size();
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentForPosition(int position) {
        int localSize = empty(this.mLocalSearchData) ? 0 : this.mLocalSearchData.size();
        return (position < localSize || empty(this.mLocalSearchData)) ? 0 : 1;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentIndex(int position) {
        int localSize = empty(this.mLocalSearchData) ? 0 : this.mLocalSearchData.size();
        if (position < localSize || empty(this.mLocalSearchData)) {
            return 0;
        }
        return localSize;
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [D, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v5, types: [D, java.lang.Object] */
    @Override // com.vkontakte.android.ui.util.Segmenter
    public <D> D getItem(int position) {
        int localSize = empty(this.mLocalSearchData) ? 0 : this.mLocalSearchData.size();
        if (position < localSize) {
            return this.mLocalSearchData.get(position);
        }
        if (position == localSize) {
            return (D) getSegment(0);
        }
        return this.mGlobalSearchData.get((position - localSize) - 1);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public CharSequence getSegment(int section) {
        return this.mGlobalTitle;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public boolean isHeader(int position) {
        int localSize = empty(this.mLocalSearchData) ? 0 : this.mLocalSearchData.size();
        return position == localSize;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public void clear() {
        if (this.mLocalSearchData != null) {
            this.mLocalSearchData.clear();
        }
        if (this.mGlobalSearchData != null) {
            this.mGlobalSearchData.clear();
        }
        if (this.mSearchIndexer != null) {
            this.mSearchIndexer.clear();
        }
        this.mData = null;
    }

    public SearchSegmenter<T> setLoadingListener(LoadingListener<T> listener) {
        this.mListener = listener;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyDataSetChanged() {
        if (this.mAdapter != null) {
            this.mAdapter.notifyDataSetChanged();
        }
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    @Nullable
    public Segmenter.Footer getFooter() {
        if (this.mMoreAvailable) {
            return this.mFooter;
        }
        return null;
    }

    static boolean empty(Collection collection) {
        return collection == null || collection.isEmpty();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class Handler extends android.os.Handler {
        Handler() {
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            SearchSegmenter segmenter = (SearchSegmenter) msg.obj;
            segmenter.mOffset = 0;
            segmenter.runSearchRequest(0, segmenter.mCount);
        }
    }
}
