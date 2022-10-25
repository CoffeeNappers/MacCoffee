package okio;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class Segment {
    static final int SHARE_MINIMUM = 1024;
    static final int SIZE = 8192;
    final byte[] data;
    int limit;
    Segment next;
    boolean owner;
    int pos;
    Segment prev;
    boolean shared;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Segment() {
        this.data = new byte[8192];
        this.owner = true;
        this.shared = false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Segment(Segment shareFrom) {
        this(shareFrom.data, shareFrom.pos, shareFrom.limit);
        shareFrom.shared = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Segment(byte[] data, int pos, int limit) {
        this.data = data;
        this.pos = pos;
        this.limit = limit;
        this.owner = false;
        this.shared = true;
    }

    public Segment pop() {
        Segment result = this.next != this ? this.next : null;
        this.prev.next = this.next;
        this.next.prev = this.prev;
        this.next = null;
        this.prev = null;
        return result;
    }

    public Segment push(Segment segment) {
        segment.prev = this;
        segment.next = this.next;
        this.next.prev = segment;
        this.next = segment;
        return segment;
    }

    public Segment split(int byteCount) {
        Segment prefix;
        if (byteCount <= 0 || byteCount > this.limit - this.pos) {
            throw new IllegalArgumentException();
        }
        if (byteCount >= 1024) {
            prefix = new Segment(this);
        } else {
            prefix = SegmentPool.take();
            System.arraycopy(this.data, this.pos, prefix.data, 0, byteCount);
        }
        prefix.limit = prefix.pos + byteCount;
        this.pos += byteCount;
        this.prev.push(prefix);
        return prefix;
    }

    public void compact() {
        if (this.prev == this) {
            throw new IllegalStateException();
        }
        if (this.prev.owner) {
            int byteCount = this.limit - this.pos;
            int availableByteCount = (8192 - this.prev.limit) + (this.prev.shared ? 0 : this.prev.pos);
            if (byteCount <= availableByteCount) {
                writeTo(this.prev, byteCount);
                pop();
                SegmentPool.recycle(this);
            }
        }
    }

    public void writeTo(Segment sink, int byteCount) {
        if (!sink.owner) {
            throw new IllegalArgumentException();
        }
        if (sink.limit + byteCount > 8192) {
            if (sink.shared) {
                throw new IllegalArgumentException();
            }
            if ((sink.limit + byteCount) - sink.pos > 8192) {
                throw new IllegalArgumentException();
            }
            System.arraycopy(sink.data, sink.pos, sink.data, 0, sink.limit - sink.pos);
            sink.limit -= sink.pos;
            sink.pos = 0;
        }
        System.arraycopy(this.data, this.pos, sink.data, sink.limit, byteCount);
        sink.limit += byteCount;
        this.pos += byteCount;
    }
}
