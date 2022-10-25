package com.danikula.videocache.file;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes.dex */
class Files {
    Files() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void makeDir(File directory) throws IOException {
        if (directory.exists()) {
            if (!directory.isDirectory()) {
                throw new IOException("File " + directory + " is not directory!");
            }
            return;
        }
        boolean isCreated = directory.mkdirs();
        if (!isCreated) {
            throw new IOException(String.format("Directory %s can't be created", directory.getAbsolutePath()));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<File> getLruListFiles(File directory) {
        List<File> result = new LinkedList<>();
        File[] files = directory.listFiles();
        if (files != null) {
            List<File> result2 = Arrays.asList(files);
            Collections.sort(result2, new LastModifiedComparator());
            return result2;
        }
        return result;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setLastModifiedNow(File file) throws IOException {
        if (file.exists()) {
            long now = System.currentTimeMillis();
            boolean modified = file.setLastModified(now);
            if (!modified) {
                modify(file);
                if (file.lastModified() < now) {
                    throw new IOException("Error set last modified date to " + file);
                }
            }
        }
    }

    static void modify(File file) throws IOException {
        long size = file.length();
        if (size == 0) {
            recreateZeroSizeFile(file);
            return;
        }
        RandomAccessFile accessFile = new RandomAccessFile(file, "rwd");
        accessFile.seek(size - 1);
        byte lastByte = accessFile.readByte();
        accessFile.seek(size - 1);
        accessFile.write(lastByte);
        accessFile.close();
    }

    private static void recreateZeroSizeFile(File file) throws IOException {
        if (!file.delete() || !file.createNewFile()) {
            throw new IOException("Error recreate zero-size file " + file);
        }
    }

    /* loaded from: classes.dex */
    private static final class LastModifiedComparator implements Comparator<File> {
        private LastModifiedComparator() {
        }

        @Override // java.util.Comparator
        public int compare(File lhs, File rhs) {
            return compareLong(lhs.lastModified(), rhs.lastModified());
        }

        private int compareLong(long first, long second) {
            if (first < second) {
                return -1;
            }
            return first == second ? 0 : 1;
        }
    }
}
