package io.reactivex.internal.util;

import io.reactivex.functions.BiPredicate;
import io.reactivex.functions.Predicate;
/* loaded from: classes3.dex */
public class AppendOnlyLinkedArrayList<T> {
    final int capacity;
    final Object[] head;
    int offset;
    Object[] tail;

    /* loaded from: classes3.dex */
    public interface NonThrowingPredicate<T> extends Predicate<T> {
        @Override // io.reactivex.functions.Predicate
        boolean test(T t);
    }

    public AppendOnlyLinkedArrayList(int capacity) {
        this.capacity = capacity;
        this.head = new Object[capacity + 1];
        this.tail = this.head;
    }

    public void add(T value) {
        int c = this.capacity;
        int o = this.offset;
        if (o == c) {
            Object[] next = new Object[c + 1];
            this.tail[c] = next;
            this.tail = next;
            o = 0;
        }
        this.tail[o] = value;
        this.offset = o + 1;
    }

    public void setFirst(T value) {
        this.head[0] = value;
    }

    public void forEachWhile(NonThrowingPredicate<? super T> consumer) {
        int c = this.capacity;
        for (Object[] a = this.head; a != null; a = a[c]) {
            for (int i = 0; i < c; i++) {
                Object o = a[i];
                if (o != null && !consumer.test(o)) {
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x000d, code lost:
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public <U> boolean accept(org.reactivestreams.Subscriber<? super U> r6) {
        /*
            r5 = this;
            java.lang.Object[] r0 = r5.head
            int r1 = r5.capacity
        L4:
            if (r0 == 0) goto L20
            r2 = 0
        L7:
            if (r2 >= r1) goto Ld
            r3 = r0[r2]
            if (r3 != 0) goto L15
        Ld:
            r4 = r0[r1]
            java.lang.Object[] r4 = (java.lang.Object[]) r4
            r0 = r4
            java.lang.Object[] r0 = (java.lang.Object[]) r0
            goto L4
        L15:
            boolean r4 = io.reactivex.internal.util.NotificationLite.acceptFull(r3, r6)
            if (r4 == 0) goto L1d
            r4 = 1
        L1c:
            return r4
        L1d:
            int r2 = r2 + 1
            goto L7
        L20:
            r4 = 0
            goto L1c
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.util.AppendOnlyLinkedArrayList.accept(org.reactivestreams.Subscriber):boolean");
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x000d, code lost:
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public <U> boolean accept(io.reactivex.Observer<? super U> r6) {
        /*
            r5 = this;
            java.lang.Object[] r0 = r5.head
            int r1 = r5.capacity
        L4:
            if (r0 == 0) goto L20
            r2 = 0
        L7:
            if (r2 >= r1) goto Ld
            r3 = r0[r2]
            if (r3 != 0) goto L15
        Ld:
            r4 = r0[r1]
            java.lang.Object[] r4 = (java.lang.Object[]) r4
            r0 = r4
            java.lang.Object[] r0 = (java.lang.Object[]) r0
            goto L4
        L15:
            boolean r4 = io.reactivex.internal.util.NotificationLite.acceptFull(r3, r6)
            if (r4 == 0) goto L1d
            r4 = 1
        L1c:
            return r4
        L1d:
            int r2 = r2 + 1
            goto L7
        L20:
            r4 = 0
            goto L1c
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.util.AppendOnlyLinkedArrayList.accept(io.reactivex.Observer):boolean");
    }

    public <S> void forEachWhile(S state, BiPredicate<? super S, ? super T> consumer) throws Exception {
        Object[] a = this.head;
        int c = this.capacity;
        while (true) {
            for (int i = 0; i < c; i++) {
                Object o = a[i];
                if (o == null || consumer.test(state, o)) {
                    return;
                }
            }
            a = a[c];
        }
    }
}
