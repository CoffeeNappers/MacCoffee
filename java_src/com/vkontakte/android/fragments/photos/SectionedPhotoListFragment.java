package com.vkontakte.android.fragments.photos;

import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public abstract class SectionedPhotoListFragment extends PhotoListFragment {
    protected ArrayList<Section> sections = new ArrayList<>();

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new MergeRecyclerAdapter();
            if (this.showAlbumHeader) {
                this.adapter.addAdapter(new PhotoListFragment.HeaderAdapter());
            }
        }
        return this.adapter;
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment
    protected boolean needLineBreakAfter(int position) {
        Iterator<Section> it = this.sections.iterator();
        while (it.hasNext()) {
            Section s = it.next();
            if (s.end == position) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment
    public void getItemOffsets(UsableRecyclerView.Adapter adapter, int positionInAdapter, int absPosition, Rect outRect) {
        if ((adapter instanceof SectionHeaderAdapter) && absPosition > 0) {
            outRect.top = V.dp(-3.0f);
        }
        super.getItemOffsets(adapter, positionInAdapter, absPosition, outRect);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes3.dex */
    public class Section {
        public PhotoListFragment.PhotoAdapter adapter;
        public int end;
        public SectionHeaderAdapter headerAdapter;
        public int start;
        public String title;

        /* JADX INFO: Access modifiers changed from: protected */
        public Section() {
        }

        public String toString() {
            return "Section{title='" + this.title + "', start=" + this.start + ", end=" + this.end + '}';
        }
    }

    /* loaded from: classes3.dex */
    protected class SectionHeaderAdapter extends UsableRecyclerView.Adapter<SectionViewHolder> {
        private String title;

        public SectionHeaderAdapter(String title) {
            this.title = title;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public SectionViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new SectionViewHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(SectionViewHolder holder, int position) {
            holder.bind(this.title);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 4;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes3.dex */
    public class SectionViewHolder extends RecyclerHolder<String> {
        public SectionViewHolder() {
            super(View.inflate(SectionedPhotoListFragment.this.getActivity(), R.layout.list_section_header, null));
            this.itemView.setBackgroundDrawable(null);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(String item) {
            ((TextView) this.itemView).setText(item);
        }
    }
}
