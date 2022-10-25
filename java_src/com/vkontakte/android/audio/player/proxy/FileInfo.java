package com.vkontakte.android.audio.player.proxy;

import com.vkontakte.android.audio.player.proxy.QueryData;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.RangesList;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class FileInfo {
    private long mContentLength;
    private String mContentType;
    private final File mFile;
    public final RangesList mRanges = new RangesList();

    public FileInfo(File file) {
        this.mFile = new File(file.getParentFile(), file.getName() + ".info");
    }

    public String toString() {
        StringBuilder ranges = new StringBuilder();
        ranges.append('[');
        Iterator<RangesList.Entry> iterator = this.mRanges.iterator();
        while (iterator.hasNext()) {
            RangesList.Entry range = iterator.next();
            ranges.append('(');
            ranges.append(range.from());
            ranges.append(", ");
            ranges.append(range.to());
            ranges.append(')');
            if (iterator.hasNext()) {
                ranges.append(", ");
            }
        }
        ranges.append(']');
        return Utils.objectToString(this, "contentLength", Long.valueOf(this.mContentLength), "contentType", this.mContentType, "ranges", ranges);
    }

    public long getContentLength() {
        return this.mContentLength;
    }

    public boolean isCountRangesIsOne() {
        return this.mRanges.isEmpty();
    }

    public long getFromFirstRanges() {
        RangesList.Entry firstEntry = this.mRanges.getFirst();
        if (firstEntry != null) {
            return firstEntry.from();
        }
        return 0L;
    }

    public long getToFirstRanges() {
        RangesList.Entry firstEntry = this.mRanges.getFirst();
        if (firstEntry != null) {
            return firstEntry.to();
        }
        return 0L;
    }

    public void setContentLength(long contentLength) {
        this.mContentLength = contentLength;
    }

    public String getContentType() {
        return this.mContentType;
    }

    public void setContentType(String contentType) {
        this.mContentType = contentType;
    }

    public boolean isWithingRanges(long position) {
        Iterator<RangesList.Entry> it = this.mRanges.iterator();
        while (it.hasNext()) {
            RangesList.Entry range = it.next();
            if (range.contains(position)) {
                return true;
            }
        }
        return false;
    }

    public void addRange(long from, long to) {
        this.mRanges.add(from, to);
    }

    public void load() throws IOException {
        DataInputStream in = new DataInputStream(new FileInputStream(this.mFile));
        try {
            this.mContentLength = in.readLong();
            if (in.readBoolean()) {
                this.mContentType = in.readUTF();
            }
            int rangeCount = in.readInt();
            for (int i = 0; i < rangeCount; i++) {
                long from = in.readLong();
                long to = in.readLong();
                this.mRanges.add(from, to);
            }
        } finally {
            Utils.closeCloseable(in);
        }
    }

    public void save() throws IOException {
        DataOutputStream out = new DataOutputStream(new FileOutputStream(this.mFile));
        try {
            out.writeLong(this.mContentLength);
            out.writeBoolean(this.mContentType != null);
            if (this.mContentType != null) {
                out.writeUTF(this.mContentType);
            }
            out.writeInt(this.mRanges.size());
            Iterator<RangesList.Entry> it = this.mRanges.iterator();
            while (it.hasNext()) {
                RangesList.Entry range = it.next();
                out.writeLong(range.from());
                out.writeLong(range.to());
            }
        } finally {
            Utils.closeCloseable(out);
        }
    }

    public void delete() {
        this.mFile.delete();
        clear();
    }

    public List<Part> split(QueryData.Range range) {
        long to;
        ArrayList<Part> parts = new ArrayList<>();
        long from = range == null ? 0L : range.from;
        if (range != null && range.to != null) {
            to = range.to.longValue();
        } else if (this.mContentLength > 0) {
            to = this.mContentLength - 1;
        } else {
            to = Long.MAX_VALUE;
        }
        long p = from;
        while (true) {
            long downloadedToMax = -1;
            long notDownloadedFromMin = Long.MAX_VALUE;
            Iterator<RangesList.Entry> it = this.mRanges.iterator();
            while (it.hasNext()) {
                RangesList.Entry r = it.next();
                if (r.contains(p)) {
                    if (r.to() > downloadedToMax) {
                        downloadedToMax = r.to();
                    }
                } else if (r.from() > p && r.from() < notDownloadedFromMin) {
                    notDownloadedFromMin = r.from();
                }
            }
            if (downloadedToMax >= 0) {
                if (to <= downloadedToMax) {
                    parts.add(new Part(p, to, true));
                    break;
                }
                parts.add(new Part(p, downloadedToMax, true));
                p = downloadedToMax + 1;
            } else if (notDownloadedFromMin < Long.MAX_VALUE) {
                if (to <= downloadedToMax) {
                    parts.add(new Part(p, to, false));
                    break;
                }
                parts.add(new Part(p, notDownloadedFromMin, false));
                p = notDownloadedFromMin + 1;
            } else {
                parts.add(new Part(p, -1L, false));
                break;
            }
        }
        return parts;
    }

    private void clear() {
        this.mContentLength = 0L;
        this.mContentType = null;
        this.mRanges.clear();
    }

    /* loaded from: classes2.dex */
    public static class Part {
        public final boolean downloaded;
        public final long from;
        public final long to;

        public Part(long from, long to, boolean downloaded) {
            this.from = from;
            this.to = to;
            this.downloaded = downloaded;
        }

        public String toString() {
            return Utils.objectToString(this, ServerKeys.FROM, Long.valueOf(this.from), "to", Long.valueOf(this.to), "downloaded", Boolean.valueOf(this.downloaded));
        }
    }
}
