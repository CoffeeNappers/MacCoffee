package com.vkontakte.android.statistics;

import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.db.Database;
import com.vkontakte.android.data.db.Table;
import java.util.Set;
import java.util.concurrent.locks.ReentrantReadWriteLock;
/* loaded from: classes3.dex */
public class SentTable {
    public static final String COLUMN_KEY = "key";
    public static final String TABLE = "sent_statistics";
    static final ReentrantReadWriteLock lock = new ReentrantReadWriteLock();
    static volatile Set<String> keysSet = null;

    public static String createSql() {
        return new Table(TABLE).withIntegerColumn("_id").setPrimaryKey().setAutoincrement().withTextColumn("key").createSql();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void init() {
        if (keysSet == null) {
            lock.writeLock().lock();
            try {
                if (keysSet == null) {
                    keysSet = Database.getInst(VKApplication.context).getSentStatistics();
                }
            } finally {
                lock.writeLock().unlock();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void addSent(String key) {
        lock.writeLock().lock();
        try {
            if (Database.getInst(VKApplication.context).addSentStatisticsAndDropOldValues(key, 10000, 100) && keysSet != null) {
                keysSet.add(key);
            }
        } finally {
            lock.writeLock().unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isSent(String key) {
        init();
        lock.readLock().lock();
        try {
            return keysSet.contains(key);
        } finally {
            lock.readLock().unlock();
        }
    }
}
