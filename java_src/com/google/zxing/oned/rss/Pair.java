package com.google.zxing.oned.rss;
/* loaded from: classes2.dex */
final class Pair extends DataCharacter {
    private int count;
    private final FinderPattern finderPattern;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Pair(int value, int checksumPortion, FinderPattern finderPattern) {
        super(value, checksumPortion);
        this.finderPattern = finderPattern;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FinderPattern getFinderPattern() {
        return this.finderPattern;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getCount() {
        return this.count;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void incrementCount() {
        this.count++;
    }
}
