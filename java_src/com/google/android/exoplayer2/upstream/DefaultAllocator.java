package com.google.android.exoplayer2.upstream;

import com.google.android.exoplayer2.util.Assertions;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class DefaultAllocator implements Allocator {
    private static final int AVAILABLE_EXTRA_CAPACITY = 100;
    private int allocatedCount;
    private Allocation[] availableAllocations;
    private int availableCount;
    private final int individualAllocationSize;
    private final byte[] initialAllocationBlock;
    private final Allocation[] singleAllocationReleaseHolder;
    private int targetBufferSize;
    private final boolean trimOnReset;

    public DefaultAllocator(boolean trimOnReset, int individualAllocationSize) {
        this(trimOnReset, individualAllocationSize, 0);
    }

    public DefaultAllocator(boolean trimOnReset, int individualAllocationSize, int initialAllocationCount) {
        boolean z = false;
        Assertions.checkArgument(individualAllocationSize > 0);
        Assertions.checkArgument(initialAllocationCount >= 0 ? true : z);
        this.trimOnReset = trimOnReset;
        this.individualAllocationSize = individualAllocationSize;
        this.availableCount = initialAllocationCount;
        this.availableAllocations = new Allocation[initialAllocationCount + 100];
        if (initialAllocationCount > 0) {
            this.initialAllocationBlock = new byte[initialAllocationCount * individualAllocationSize];
            for (int i = 0; i < initialAllocationCount; i++) {
                int allocationOffset = i * individualAllocationSize;
                this.availableAllocations[i] = new Allocation(this.initialAllocationBlock, allocationOffset);
            }
        } else {
            this.initialAllocationBlock = null;
        }
        this.singleAllocationReleaseHolder = new Allocation[1];
    }

    public synchronized void reset() {
        if (this.trimOnReset) {
            setTargetBufferSize(0);
        }
    }

    public synchronized void setTargetBufferSize(int targetBufferSize) {
        boolean targetBufferSizeReduced = targetBufferSize < this.targetBufferSize;
        this.targetBufferSize = targetBufferSize;
        if (targetBufferSizeReduced) {
            trim();
        }
    }

    @Override // com.google.android.exoplayer2.upstream.Allocator
    public synchronized Allocation allocate() {
        Allocation allocation;
        this.allocatedCount++;
        if (this.availableCount > 0) {
            Allocation[] allocationArr = this.availableAllocations;
            int i = this.availableCount - 1;
            this.availableCount = i;
            allocation = allocationArr[i];
            this.availableAllocations[this.availableCount] = null;
        } else {
            allocation = new Allocation(new byte[this.individualAllocationSize], 0);
        }
        return allocation;
    }

    @Override // com.google.android.exoplayer2.upstream.Allocator
    public synchronized void release(Allocation allocation) {
        this.singleAllocationReleaseHolder[0] = allocation;
        release(this.singleAllocationReleaseHolder);
    }

    @Override // com.google.android.exoplayer2.upstream.Allocator
    public synchronized void release(Allocation[] allocations) {
        if (this.availableCount + allocations.length >= this.availableAllocations.length) {
            this.availableAllocations = (Allocation[]) Arrays.copyOf(this.availableAllocations, Math.max(this.availableAllocations.length * 2, this.availableCount + allocations.length));
        }
        for (Allocation allocation : allocations) {
            Assertions.checkArgument(allocation.data == this.initialAllocationBlock || allocation.data.length == this.individualAllocationSize);
            Allocation[] allocationArr = this.availableAllocations;
            int i = this.availableCount;
            this.availableCount = i + 1;
            allocationArr[i] = allocation;
        }
        this.allocatedCount -= allocations.length;
        notifyAll();
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0059, code lost:
        if (r7 < r11.availableCount) goto L26;
     */
    @Override // com.google.android.exoplayer2.upstream.Allocator
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized void trim() {
        /*
            r11 = this;
            monitor-enter(r11)
            int r8 = r11.targetBufferSize     // Catch: java.lang.Throwable -> L50
            int r9 = r11.individualAllocationSize     // Catch: java.lang.Throwable -> L50
            int r6 = com.google.android.exoplayer2.util.Util.ceilDivide(r8, r9)     // Catch: java.lang.Throwable -> L50
            r8 = 0
            int r9 = r11.allocatedCount     // Catch: java.lang.Throwable -> L50
            int r9 = r6 - r9
            int r7 = java.lang.Math.max(r8, r9)     // Catch: java.lang.Throwable -> L50
            int r8 = r11.availableCount     // Catch: java.lang.Throwable -> L50
            if (r7 < r8) goto L18
        L16:
            monitor-exit(r11)
            return
        L18:
            byte[] r8 = r11.initialAllocationBlock     // Catch: java.lang.Throwable -> L50
            if (r8 == 0) goto L5b
            r4 = 0
            int r8 = r11.availableCount     // Catch: java.lang.Throwable -> L50
            int r1 = r8 + (-1)
            r2 = r1
            r5 = r4
        L23:
            if (r5 > r2) goto L53
            com.google.android.exoplayer2.upstream.Allocation[] r8 = r11.availableAllocations     // Catch: java.lang.Throwable -> L50
            r3 = r8[r5]     // Catch: java.lang.Throwable -> L50
            byte[] r8 = r3.data     // Catch: java.lang.Throwable -> L50
            byte[] r9 = r11.initialAllocationBlock     // Catch: java.lang.Throwable -> L50
            if (r8 != r9) goto L35
            int r4 = r5 + 1
            r1 = r2
        L32:
            r2 = r1
            r5 = r4
            goto L23
        L35:
            com.google.android.exoplayer2.upstream.Allocation[] r8 = r11.availableAllocations     // Catch: java.lang.Throwable -> L50
            r0 = r8[r2]     // Catch: java.lang.Throwable -> L50
            byte[] r8 = r0.data     // Catch: java.lang.Throwable -> L50
            byte[] r9 = r11.initialAllocationBlock     // Catch: java.lang.Throwable -> L50
            if (r8 == r9) goto L43
            int r1 = r2 + (-1)
            r4 = r5
            goto L32
        L43:
            com.google.android.exoplayer2.upstream.Allocation[] r8 = r11.availableAllocations     // Catch: java.lang.Throwable -> L50
            int r4 = r5 + 1
            r8[r5] = r0     // Catch: java.lang.Throwable -> L50
            com.google.android.exoplayer2.upstream.Allocation[] r8 = r11.availableAllocations     // Catch: java.lang.Throwable -> L50
            int r1 = r2 + (-1)
            r8[r2] = r3     // Catch: java.lang.Throwable -> L50
            goto L32
        L50:
            r8 = move-exception
            monitor-exit(r11)
            throw r8
        L53:
            int r7 = java.lang.Math.max(r7, r5)     // Catch: java.lang.Throwable -> L50
            int r8 = r11.availableCount     // Catch: java.lang.Throwable -> L50
            if (r7 >= r8) goto L16
        L5b:
            com.google.android.exoplayer2.upstream.Allocation[] r8 = r11.availableAllocations     // Catch: java.lang.Throwable -> L50
            int r9 = r11.availableCount     // Catch: java.lang.Throwable -> L50
            r10 = 0
            java.util.Arrays.fill(r8, r7, r9, r10)     // Catch: java.lang.Throwable -> L50
            r11.availableCount = r7     // Catch: java.lang.Throwable -> L50
            goto L16
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.exoplayer2.upstream.DefaultAllocator.trim():void");
    }

    @Override // com.google.android.exoplayer2.upstream.Allocator
    public synchronized int getTotalBytesAllocated() {
        return this.allocatedCount * this.individualAllocationSize;
    }

    @Override // com.google.android.exoplayer2.upstream.Allocator
    public int getIndividualAllocationLength() {
        return this.individualAllocationSize;
    }
}
