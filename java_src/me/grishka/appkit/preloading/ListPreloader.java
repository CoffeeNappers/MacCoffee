package me.grishka.appkit.preloading;

import android.net.Uri;
import android.widget.AbsListView;
import com.facebook.datasource.DataSource;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.imagepipeline.request.ImageRequestBuilder;
import com.vk.imageloader.view.VKImageView;
import java.util.LinkedList;
import java.util.Queue;
/* loaded from: classes3.dex */
public class ListPreloader implements AbsListView.OnScrollListener {
    private int lastEnd;
    private int lastFirstVisible;
    private int lastStart;
    private final int maxPreload;
    private PrefetchInfoProvider preloadModelProvider;
    private boolean isIncreasing = true;
    private final Queue<DataSource<Void>> queue = new LinkedList();

    public ListPreloader(int maxPreload) {
        this.maxPreload = maxPreload;
    }

    public void setProvider(PrefetchInfoProvider provider) {
        this.preloadModelProvider = provider;
    }

    public void update(int firstVisible, int visibleCount) {
        if (this.preloadModelProvider != null) {
            cancelAll();
            preload(firstVisible + visibleCount, true);
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView absListView, int scrollState) {
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView absListView, int firstVisible, int visibleCount, int totalCount) {
        if (this.preloadModelProvider != null) {
            if (firstVisible > this.lastFirstVisible) {
                preload(firstVisible + visibleCount, true);
            } else if (firstVisible < this.lastFirstVisible) {
                preload(firstVisible, false);
            }
            this.lastFirstVisible = firstVisible;
        }
    }

    private void preload(int start, boolean increasing) {
        if (this.isIncreasing != increasing) {
            this.isIncreasing = increasing;
            cancelAll();
        }
        preload(start, (increasing ? this.maxPreload : -this.maxPreload) + start);
    }

    private void preload(int from, int to) {
        int start;
        int end;
        if (from < to) {
            start = Math.max(this.lastEnd, from);
            end = to;
        } else {
            start = to;
            end = Math.min(this.lastStart, from);
        }
        int total = this.preloadModelProvider.getItemCount();
        int end2 = Math.min(total, end);
        int start2 = Math.min(total, Math.max(0, start));
        if (from < to) {
            for (int i = start2; i < end2; i++) {
                preloadAdapterPosition(i, true);
            }
        } else {
            for (int i2 = end2 - 1; i2 >= start2; i2--) {
                preloadAdapterPosition(i2, false);
            }
        }
        this.lastStart = start2;
        this.lastEnd = end2;
    }

    private void preloadAdapterPosition(int position, boolean isIncreasing) {
        int numItems = this.preloadModelProvider.getImageCountForItem(position);
        if (isIncreasing) {
            for (int i = 0; i < numItems; i++) {
                preloadItem(this.preloadModelProvider.getImageURL(position, i));
            }
            return;
        }
        for (int i2 = numItems - 1; i2 >= 0; i2--) {
            preloadItem(this.preloadModelProvider.getImageURL(position, i2));
        }
    }

    private void preloadItem(String item) {
        if (item != null) {
            ImageRequestBuilder builder = ImageRequestBuilder.newBuilderWithSource(Uri.parse(item));
            builder.setRotationOptions(VKImageView.ROTATE_OPTIONS);
            addToQueue(Fresco.getImagePipeline().prefetchToBitmapCache(builder.build(), null));
        }
    }

    private void cancelAll() {
        while (!this.queue.isEmpty()) {
            DataSource<Void> ds = this.queue.poll();
            if (ds != null) {
                ds.close();
            }
        }
    }

    private void addToQueue(DataSource<Void> dataSource) {
        DataSource<Void> ds;
        if (this.queue.size() > this.maxPreload && (ds = this.queue.poll()) != null) {
            ds.close();
        }
        this.queue.offer(dataSource);
    }
}
