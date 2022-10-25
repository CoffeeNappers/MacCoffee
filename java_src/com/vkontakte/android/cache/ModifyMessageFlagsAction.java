package com.vkontakte.android.cache;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.auth.VKAccountManager;
import java.io.IOException;
/* loaded from: classes2.dex */
public class ModifyMessageFlagsAction extends MessagesAction {
    public static final int ACTION_CLEAR = 1;
    public static final int ACTION_SET = 0;
    private int action;
    private int flags;
    private boolean in;
    private boolean le;
    private int mid;
    private int peer;

    public ModifyMessageFlagsAction(int _mid, int _flags, int _action) {
        this.le = false;
        this.in = false;
        this.mid = _mid;
        this.flags = _flags;
        this.action = _action;
    }

    public ModifyMessageFlagsAction(int _mid, int _flags, int _action, boolean _in, int _peer) {
        this.le = false;
        this.in = false;
        this.mid = _mid;
        this.flags = _flags;
        this.action = _action;
        this.le = true;
        this.in = _in;
        this.peer = _peer;
    }

    @Override // com.vkontakte.android.cache.MessagesAction
    public void apply(SQLiteDatabase db) throws SQLiteException, IOException {
        String flagsAct = "flags";
        if (this.action == 0) {
            flagsAct = "flags|" + this.flags;
        } else if (this.action == 1) {
            flagsAct = "flags&" + (this.flags ^ (-1));
            if (this.in && (this.flags & 1) > 0) {
                resetUnreadCount(db);
            }
        }
        if (this.le) {
            String idTable = this.in ? "messages_read_ids_in" : "messages_read_ids_out";
            int lastRead = 0;
            Cursor cursor = db.query(idTable, new String[]{"mid"}, "peer=" + this.peer, null, null, null, null);
            if (cursor.moveToFirst()) {
                lastRead = cursor.getInt(0);
            }
            cursor.close();
            db.execSQL("UPDATE messages SET flags=" + flagsAct + " WHERE peer=" + this.peer + " AND mid<=" + this.mid + " AND mid>" + lastRead + " AND sender" + (this.in ? "<>" : "=") + VKAccountManager.getCurrent().getUid());
            ContentValues values = new ContentValues();
            values.put("peer", Integer.valueOf(this.peer));
            values.put("mid", Integer.valueOf(this.mid));
            db.insertWithOnConflict(idTable, null, values, 5);
            if (this.in) {
                resetUnreadCount(db);
                return;
            }
            return;
        }
        db.execSQL("UPDATE messages SET flags=" + flagsAct + " WHERE mid=" + this.mid);
    }

    private void resetUnreadCount(SQLiteDatabase db) {
        if (LongPollService.DEBUG) {
            Log.i("vk", "Resetting unread count for " + this.peer);
        }
        ContentValues values = new ContentValues();
        values.put("unread_count", (Integer) 0);
        db.update("messages_unread_counters", values, "peer=" + this.peer, null);
    }
}
