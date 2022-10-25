package com.facebook.cache.disk;

import com.facebook.cache.disk.DiskStorage;
/* loaded from: classes.dex */
public class DefaultEntryEvictionComparatorSupplier implements EntryEvictionComparatorSupplier {
    @Override // com.facebook.cache.disk.EntryEvictionComparatorSupplier
    public EntryEvictionComparator get() {
        return new EntryEvictionComparator() { // from class: com.facebook.cache.disk.DefaultEntryEvictionComparatorSupplier.1
            @Override // java.util.Comparator
            public int compare(DiskStorage.Entry e1, DiskStorage.Entry e2) {
                long time1 = e1.getTimestamp();
                long time2 = e2.getTimestamp();
                if (time1 < time2) {
                    return -1;
                }
                return time2 == time1 ? 0 : 1;
            }
        };
    }
}
