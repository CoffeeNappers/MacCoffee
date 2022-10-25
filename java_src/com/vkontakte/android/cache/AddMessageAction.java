package com.vkontakte.android.cache;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteConstraintException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import com.google.android.c2dm.C2DMessaging;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.Message;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GiftAttachment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.stickers.Stickers;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.Locale;
import java.util.Set;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AddMessageAction extends MessagesAction {
    private Message m;

    public AddMessageAction(Message msg) {
        this.m = msg;
    }

    @Override // com.vkontakte.android.cache.MessagesAction
    public void apply(SQLiteDatabase db) throws SQLiteException, IOException {
        ContentValues values = new ContentValues();
        values.put("mid", Integer.valueOf(this.m.id));
        values.put("peer", Integer.valueOf(this.m.peer));
        values.put("random_id", Integer.valueOf(this.m.randomId));
        values.put(C2DMessaging.EXTRA_SENDER, Integer.valueOf(this.m.sender));
        values.put("text", this.m.text);
        values.put("time", Integer.valueOf(this.m.time));
        if (this.m.attachments.size() > 0) {
            ByteArrayOutputStream buf = new ByteArrayOutputStream();
            buf.write(this.m.attachments.size());
            DataOutputStream out = new DataOutputStream(buf);
            for (int i = 0; i < this.m.attachments.size(); i++) {
                Attachment att = this.m.attachments.get(i);
                if (att != null) {
                    att.serialize(out);
                }
            }
            values.put("attachments", buf.toByteArray());
            if (!this.m.out) {
                for (int i2 = 0; i2 < this.m.attachments.size(); i2++) {
                    Attachment att2 = this.m.attachments.get(i2);
                    if (att2 instanceof GiftAttachment) {
                        GiftAttachment g = (GiftAttachment) att2;
                        if (g.packID != 0) {
                            Stickers.get().reload();
                        }
                    }
                }
            }
        }
        if (this.m.fwdMessages.size() > 0) {
            ByteArrayOutputStream buf2 = new ByteArrayOutputStream();
            buf2.write(this.m.fwdMessages.size());
            DataOutputStream out2 = new DataOutputStream(buf2);
            for (int i3 = 0; i3 < this.m.fwdMessages.size(); i3++) {
                Message.FwdMessage fm = this.m.fwdMessages.get(i3);
                fm.serialize(out2);
            }
            values.put(ArgKeys.FWD, buf2.toByteArray());
        }
        int flags = 0;
        if (!this.m.readState) {
            flags = 0 | 1;
        }
        if (this.m.sendFailed) {
            flags |= 2;
        }
        if (this.m.isServiceMessage) {
            flags |= 4;
        }
        values.put("flags", Integer.valueOf(flags));
        if (this.m.extras.size() > 0) {
            try {
                JSONObject obj = new JSONObject();
                Set<String> keys = this.m.extras.keySet();
                for (String k : keys) {
                    obj.put(k, this.m.extras.get(k));
                }
                String xtra = obj.toString();
                values.put("extras", xtra);
            } catch (Exception x) {
                Log.w("vk", "Error serializing extras for message!", x);
            }
        }
        if (!this.m.out && !this.m.readState) {
            Cursor crsr = db.query("messages", new String[]{"count(*)"}, "mid=" + this.m.id, null, null, null, null);
            if (crsr.moveToFirst() && crsr.getInt(0) == 0) {
                String query = String.format(Locale.US, "INSERT OR REPLACE INTO messages_unread_counters (peer, unread_count) VALUES (%1$d, COALESCE((SELECT unread_count FROM messages_unread_counters WHERE peer=%1$d), 0)+1)", Integer.valueOf(this.m.peer));
                db.execSQL(query);
            }
            crsr.close();
        }
        db.insertWithOnConflict("messages", null, values, 5);
        values.clear();
        values.put("peer", Integer.valueOf(this.m.peer));
        values.put(LongPollService.EXTRA_MSG_ID, Integer.valueOf(this.m.id));
        values.put("msg_time", Integer.valueOf(this.m.time));
        try {
            db.insertOrThrow("messages_top_ids", null, values);
        } catch (SQLiteConstraintException e) {
            db.update("messages_top_ids", values, "peer=" + this.m.peer + " AND msg_time<" + this.m.time, null);
        }
    }
}
