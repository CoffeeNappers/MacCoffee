package com.vkontakte.android.utils;

import java.util.Iterator;
/* loaded from: classes3.dex */
public class RangesList implements Iterable<Entry> {
    private Entry first = null;

    /* JADX WARN: Removed duplicated region for block: B:32:0x0091 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0116 A[ADDED_TO_REGION, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void add(long r12, long r14) {
        /*
            Method dump skipped, instructions count: 291
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.utils.RangesList.add(long, long):void");
    }

    public void clear() {
        this.first = null;
    }

    public boolean isEmpty() {
        return this.first == null;
    }

    public Entry getFirst() {
        return this.first;
    }

    public int size() {
        if (isEmpty()) {
            return 0;
        }
        int size = 0;
        Iterator<Entry> it = iterator();
        while (it.hasNext()) {
            it.next();
            size++;
        }
        return size;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder().append('{');
        Iterator<Entry> it = iterator();
        while (it.hasNext()) {
            Entry entry = it.next();
            sb.append('[').append(entry.from).append(',').append(entry.to).append(']');
        }
        return sb.append('}').toString();
    }

    /* loaded from: classes3.dex */
    public static class Entry {
        private long from;
        private Entry next;
        private Entry prev;
        private long to;

        private Entry(long from, long to) {
            this.prev = null;
            this.next = null;
            this.from = from;
            this.to = to;
        }

        public boolean contains(long position) {
            return position >= this.from && position <= this.to;
        }

        public Entry next() {
            return this.next;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void linkNext(Entry next) {
            this.next = next;
            if (next != null) {
                next.prev = this;
            }
        }

        private void linkPrev(RangesList list, Entry prev) {
            if (this == list.first && prev != null) {
                list.first = prev;
            }
            this.prev = prev;
            if (prev != null) {
                prev.next = this;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void insertPrev(RangesList list, Entry prev) {
            Entry lastPrev = this.prev;
            linkPrev(list, prev);
            if (prev != null) {
                prev.linkPrev(list, lastPrev);
            }
        }

        public long from() {
            return this.from;
        }

        public long to() {
            return this.to;
        }

        public String toString() {
            return "[" + this.from + ',' + this.to + ']';
        }
    }

    @Override // java.lang.Iterable
    public Iterator<Entry> iterator() {
        return new RangesListIterator(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class RangesListIterator implements Iterator<Entry> {
        Entry currentEntry;
        final RangesList list;

        RangesListIterator(RangesList list) {
            this.list = list;
            this.currentEntry = list.first;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.currentEntry != null;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Iterator
        /* renamed from: next */
        public Entry mo1147next() {
            Entry entryToReturn = this.currentEntry;
            if (this.currentEntry != null) {
                this.currentEntry = this.currentEntry.next();
            }
            return entryToReturn;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException("RangesList#iterator() does not support remove()");
        }
    }
}
