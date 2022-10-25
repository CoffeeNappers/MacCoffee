package com.vkontakte.android.cache;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.LongPollService;
import java.io.IOException;
/* loaded from: classes2.dex */
public class DeleteMessageAction extends MessagesAction {
    private int mid;

    public DeleteMessageAction(int id) {
        this.mid = id;
    }

    @Override // com.vkontakte.android.cache.MessagesAction
    public void apply(SQLiteDatabase db) throws SQLiteException, IOException {
        db.delete("messages", "mid=" + this.mid, null);
        Cursor c = db.query("messages_top_ids", new String[]{"peer"}, "msg_id=" + this.mid, null, null, null, null);
        int peer = 0;
        if (c.moveToFirst()) {
            peer = c.getInt(0);
        }
        c.close();
        if (peer != 0) {
            Cursor crsr = db.query("messages", new String[]{"mid", "time"}, "peer=" + peer, null, null, null, "time desc", AppEventsConstants.EVENT_PARAM_VALUE_YES);
            if (crsr.moveToFirst()) {
                ContentValues values = new ContentValues();
                values.put(LongPollService.EXTRA_MSG_ID, Integer.valueOf(crsr.getInt(0)));
                values.put("msg_time", Integer.valueOf(crsr.getInt(1)));
                db.update("messages_top_ids", values, "peer=" + peer, null);
            } else {
                db.delete("messages_top_ids", "msg_id=" + this.mid, null);
            }
            crsr.close();
        }
    }
}
