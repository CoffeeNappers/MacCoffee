package com.vkontakte.android;

import android.content.ContentValues;
import android.database.Cursor;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.SparseArray;
import com.facebook.internal.NativeProtocol;
import com.google.android.c2dm.C2DMessaging;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.MessageBase;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Message extends MessageBase implements Parcelable {
    public static final int FLAG_FAILED = 2;
    public static final int FLAG_SERVICE = 4;
    public static final int FLAG_UNREAD = 1;
    @NonNull
    public Bundle extras;
    public boolean isServiceMessage;
    public boolean out;
    public int peer;
    public int randomId;
    public boolean readState;
    public boolean sendFailed;
    public String title;
    public static final String[] SELECTION = {"mid", "peer", "random_id", C2DMessaging.EXTRA_SENDER, "text", "time", "flags", "attachments", ArgKeys.FWD, "extras"};
    public static final Parcelable.Creator<Message> CREATOR = new Parcelable.Creator<Message>() { // from class: com.vkontakte.android.Message.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Message mo550createFromParcel(Parcel in) {
            return new Message(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Message[] mo551newArray(int size) {
            return new Message[size];
        }
    };

    public void putStringExtra(@NonNull String key, String value) {
        if (this.extras == Bundle.EMPTY) {
            this.extras = new Bundle();
        }
        this.extras.putString(key, value);
    }

    public void putIntExtra(@NonNull String key, int value) {
        if (this.extras == Bundle.EMPTY) {
            this.extras = new Bundle();
        }
        this.extras.putInt(key, value);
    }

    public void putBooleanExtra(@NonNull String key, boolean value) {
        if (this.extras == Bundle.EMPTY) {
            this.extras = new Bundle();
        }
        this.extras.putBoolean(key, value);
    }

    public void putAllExtra(Bundle value) {
        if (!value.isEmpty()) {
            if (this.extras == Bundle.EMPTY) {
                this.extras = new Bundle();
            }
            this.extras.putAll(value);
        }
    }

    public Message() {
        this.out = false;
        this.sendFailed = false;
        this.isServiceMessage = false;
        this.readState = false;
        this.extras = Bundle.EMPTY;
    }

    private Message(Parcel p) {
        boolean z = true;
        this.out = false;
        this.sendFailed = false;
        this.isServiceMessage = false;
        this.readState = false;
        this.extras = Bundle.EMPTY;
        try {
            Bundle bundle = p.readBundle(null);
            if (bundle != null && !bundle.isEmpty()) {
                this.extras = bundle;
            }
            setText(p.readString());
            this.title = p.readString();
            this.out = p.readInt() == 1;
            this.sendFailed = p.readInt() == 1;
            this.readState = p.readInt() == 1;
            this.isServiceMessage = p.readInt() != 1 ? false : z;
            this.time = p.readInt();
            this.id = p.readInt();
            this.sender = p.readInt();
            this.peer = p.readInt();
            this.randomId = p.readInt();
            int len = p.readInt();
            for (int i = 0; i < len; i++) {
                int bl = p.readInt();
                byte[] buf = new byte[bl];
                p.readByteArray(buf);
                ByteArrayInputStream ais = new ByteArrayInputStream(buf);
                DataInputStream is = new DataInputStream(ais);
                Attachment att = Attachment.deserialize(is);
                if (att != null) {
                    addAttachment(att, len);
                }
            }
            int len2 = p.readInt();
            for (int i2 = 0; i2 < len2; i2++) {
                byte[] sdata = new byte[p.readInt()];
                p.readByteArray(sdata);
                DataInputStream s = new DataInputStream(new ByteArrayInputStream(sdata));
                addFwdMessage(FwdMessage.deserialize(s), len2);
            }
        } catch (Exception x) {
            Log.w("vk", x);
        }
    }

    public Message(Message m) {
        this.out = false;
        this.sendFailed = false;
        this.isServiceMessage = false;
        this.readState = false;
        this.extras = Bundle.EMPTY;
        setText(m.text);
        this.title = m.title;
        this.randomId = m.randomId;
        this.out = m.out;
        this.sendFailed = m.sendFailed;
        this.readState = m.readState;
        this.isServiceMessage = m.isServiceMessage;
        this.time = m.time;
        this.id = m.id;
        this.sender = m.sender;
        this.peer = m.peer;
        addAttachments(m.attachments);
        addFwdMessages(m.fwdMessages);
        putAllExtra(m.extras);
    }

    public Message(JSONObject obj) {
        this(obj, null, null);
    }

    public Message(JSONObject obj, @Nullable SparseArray<String> users, @Nullable SparseArray<String> photos) {
        this.out = false;
        this.sendFailed = false;
        this.isServiceMessage = false;
        this.readState = false;
        this.extras = Bundle.EMPTY;
        try {
            this.id = obj.optInt("id", obj.optInt("mid"));
            if (obj.has(ServerKeys.FROM_ID)) {
                this.sender = obj.getInt(ServerKeys.FROM_ID);
                this.peer = obj.has("chat_id") ? 2000000000 + obj.getInt("chat_id") : obj.optInt("user_id", obj.optInt(ServerKeys.FROM_ID));
            } else if (obj.has(ArgKeys.UID)) {
                this.sender = obj.getInt("out") == 1 ? VKAccountManager.getCurrent().getUid() : obj.getInt(ArgKeys.UID);
                this.peer = obj.has("chat_id") ? 2000000000 + obj.getInt("chat_id") : obj.getInt(ArgKeys.UID);
            } else {
                this.sender = obj.getInt("out") == 1 ? VKAccountManager.getCurrent().getUid() : obj.getInt("user_id");
                this.peer = obj.has("chat_id") ? 2000000000 + obj.getInt("chat_id") : obj.getInt("user_id");
            }
            setText(obj.getString(TtmlNode.TAG_BODY));
            this.time = obj.getInt(ServerKeys.DATE);
            this.title = obj.optString("title");
            this.randomId = obj.optInt("random_id");
            this.out = obj.optInt("out") == 1;
            this.readState = obj.getInt(LongPollService.EXTRA_READ_STATE) == 1;
            if (obj.has(NativeProtocol.WEB_DIALOG_ACTION)) {
                this.isServiceMessage = true;
                putStringExtra(NativeProtocol.WEB_DIALOG_ACTION, obj.getString(NativeProtocol.WEB_DIALOG_ACTION));
                if (obj.has("action_text")) {
                    putStringExtra("action_text", obj.getString("action_text"));
                }
                if (obj.has("action_mid")) {
                    putIntExtra("action_mid", obj.getInt("action_mid"));
                }
                if (obj.has("action_email")) {
                    putStringExtra("action_email", obj.getString("action_email"));
                }
            }
            if (this.extras.containsKey("action_mid")) {
                int actMid = this.extras.getInt("action_mid", 0);
                ArrayList<UserProfile> u = Friends.getUsersBlocking(Collections.singletonList(Integer.valueOf(actMid)), 3);
                putStringExtra("action_user_name_acc", u.get(0).fullName);
            }
            if (obj.has("attachments")) {
                JSONArray atts = obj.getJSONArray("attachments");
                for (int i = 0; i < atts.length(); i++) {
                    Attachment att = Attachment.parse(atts.getJSONObject(i), users, photos);
                    if (att != null) {
                        addAttachment(att, atts.length() + 1);
                    }
                }
            }
            Attachment.sort(this.attachments);
            if (obj.has("fwd_messages")) {
                JSONArray fwds = obj.getJSONArray("fwd_messages");
                addFwdMessages(parseFwdMessages(fwds, users, photos));
            }
            if (obj.has("geo")) {
                JSONObject jg = obj.getJSONObject("geo");
                if (jg.has("coordinates")) {
                    addAttachment(Attachment.parseGeo(jg), 1);
                }
            }
        } catch (Exception x) {
            Log.w("vk", "error parsing message", x);
        }
    }

    public Message(Cursor cursor) {
        this.out = false;
        this.sendFailed = false;
        this.isServiceMessage = false;
        this.readState = false;
        this.extras = Bundle.EMPTY;
        try {
            this.id = cursor.getInt(0);
            this.peer = cursor.getInt(1);
            this.randomId = cursor.getInt(2);
            this.sender = cursor.getInt(3);
            setText(cursor.getString(4));
            this.time = cursor.getInt(5);
            int flags = cursor.getInt(6);
            this.readState = (flags & 1) == 0;
            this.sendFailed = (flags & 2) > 0;
            this.isServiceMessage = (flags & 4) > 0;
            byte[] att = cursor.getBlob(7);
            if (att != null) {
                DataInputStream is = new DataInputStream(new ByteArrayInputStream(att));
                int num = is.read();
                for (int i = 0; i < num; i++) {
                    Attachment a = Attachment.deserialize(is);
                    if (a != null) {
                        addAttachment(a, num);
                    }
                }
            }
            byte[] fwd = cursor.getBlob(8);
            if (fwd != null) {
                DataInputStream is2 = new DataInputStream(new ByteArrayInputStream(fwd));
                int num2 = is2.read();
                for (int i2 = 0; i2 < num2; i2++) {
                    addFwdMessage(FwdMessage.deserialize(is2), num2);
                }
            }
            this.out = this.sender == VKAccountManager.getCurrent().getUid();
            String xtra = cursor.getString(9);
            if (xtra != null) {
                JSONObject obj = new JSONObject(xtra);
                Iterator<String> keys = obj.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    Object o = obj.get(k);
                    if (o instanceof Integer) {
                        putIntExtra(k, ((Integer) o).intValue());
                    } else if (o instanceof Boolean) {
                        putBooleanExtra(k, ((Boolean) o).booleanValue());
                    } else {
                        putStringExtra(k, (String) o);
                    }
                }
            }
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    public Message(ContentValues values) {
        this.out = false;
        this.sendFailed = false;
        this.isServiceMessage = false;
        this.readState = false;
        this.extras = Bundle.EMPTY;
        try {
            this.id = values.getAsInteger("mid").intValue();
            this.peer = values.getAsInteger("peer").intValue();
            this.randomId = values.getAsInteger("random_id").intValue();
            this.sender = values.getAsInteger(C2DMessaging.EXTRA_SENDER).intValue();
            setText(values.getAsString("text"));
            this.time = values.getAsInteger("time").intValue();
            int flags = values.getAsInteger("flags").intValue();
            this.readState = (flags & 1) == 0;
            this.sendFailed = (flags & 2) > 0;
            this.isServiceMessage = (flags & 4) > 0;
            byte[] att = values.getAsByteArray("attachments");
            if (att != null) {
                DataInputStream is = new DataInputStream(new ByteArrayInputStream(att));
                int num = is.read();
                for (int i = 0; i < num; i++) {
                    Attachment a = Attachment.deserialize(is);
                    if (a != null) {
                        addAttachment(a, num);
                    }
                }
            }
            byte[] fwd = values.getAsByteArray(ArgKeys.FWD);
            if (fwd != null) {
                DataInputStream is2 = new DataInputStream(new ByteArrayInputStream(fwd));
                int num2 = is2.read();
                for (int i2 = 0; i2 < num2; i2++) {
                    addFwdMessage(FwdMessage.deserialize(is2), num2);
                }
            }
            this.out = this.sender == VKAccountManager.getCurrent().getUid();
            String xtra = values.getAsString("extras");
            if (xtra != null) {
                JSONObject obj = new JSONObject(xtra);
                Iterator<String> keys = obj.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    Object o = obj.get(k);
                    if (o instanceof Integer) {
                        putIntExtra(k, ((Integer) o).intValue());
                    } else if (o instanceof Boolean) {
                        putBooleanExtra(k, ((Boolean) o).booleanValue());
                    } else {
                        putStringExtra(k, (String) o);
                    }
                }
            }
        } catch (Exception x) {
            Log.w("vk", "error parsing message", x);
        }
    }

    public void generateRandomId() {
        try {
            String accessToken = VKAccountManager.getCurrent().getAccessToken();
            if (accessToken != null && accessToken.length() >= 4) {
                this.randomId = this.id ^ (((accessToken.charAt(0) | (accessToken.charAt(1) << '\b')) | (accessToken.charAt(2) << 16)) | (accessToken.charAt(3) << 24));
            }
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    public void setText(String t) {
        this.text = t;
        this.displayableText = Global.replaceEmoji(LinkParser.parseLinks(t));
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        int i = 1;
        out.writeBundle(this.extras);
        out.writeString(this.text);
        out.writeString(this.title);
        out.writeInt(this.out ? 1 : 0);
        out.writeInt(this.sendFailed ? 1 : 0);
        out.writeInt(this.readState ? 1 : 0);
        if (!this.isServiceMessage) {
            i = 0;
        }
        out.writeInt(i);
        out.writeInt(this.time);
        out.writeInt(this.id);
        out.writeInt(this.sender);
        out.writeInt(this.peer);
        out.writeInt(this.randomId);
        out.writeInt(this.attachments.size());
        for (int i2 = 0; i2 < this.attachments.size(); i2++) {
            Attachment att = this.attachments.get(i2);
            try {
                ByteArrayOutputStream os = new ByteArrayOutputStream();
                att.serialize(new DataOutputStream(os));
                byte[] b = os.toByteArray();
                out.writeInt(b.length);
                out.writeByteArray(b);
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }
        out.writeInt(this.fwdMessages.size());
        for (int i3 = 0; i3 < this.fwdMessages.size(); i3++) {
            try {
                FwdMessage m = this.fwdMessages.get(i3);
                ByteArrayOutputStream buf = new ByteArrayOutputStream();
                m.serialize(new DataOutputStream(buf));
                byte[] bb = buf.toByteArray();
                out.writeInt(bb.length);
                out.writeByteArray(bb);
            } catch (Exception x2) {
                L.e(x2, new Object[0]);
                return;
            }
        }
    }

    public String toString() {
        return this.id + "; " + this.text + "; " + this.attachments + "; " + this.attachments.size() + "; " + this.extras.getString(NativeProtocol.WEB_DIALOG_ACTION);
    }

    public String getServiceMessageText(UserProfile senderProfile, String userAcc) {
        String name;
        String name2;
        if (senderProfile == null) {
            return "...";
        }
        String act = this.extras.getString(NativeProtocol.WEB_DIALOG_ACTION);
        if ("chat_pin_message".equals(act)) {
            String dtext = VKApplication.context.getResources().getString(senderProfile.f ? R.string.chat_pin_message_f : R.string.chat_pin_message_m, senderProfile.fullName);
            return dtext;
        } else if ("chat_unpin_message".equals(act)) {
            String dtext2 = VKApplication.context.getResources().getString(senderProfile.f ? R.string.chat_unpin_message_f : R.string.chat_unpin_message_m, senderProfile.fullName);
            return dtext2;
        } else if ("chat_photo_update".equals(act)) {
            String dtext3 = VKApplication.context.getResources().getString(senderProfile.f ? R.string.chat_photo_updated_f : R.string.chat_photo_updated_m, senderProfile.fullName);
            return dtext3;
        } else if ("chat_photo_remove".equals(act)) {
            String dtext4 = VKApplication.context.getResources().getString(senderProfile.f ? R.string.chat_photo_removed_f : R.string.chat_photo_removed_m, senderProfile.fullName);
            return dtext4;
        } else if ("chat_create".equals(act)) {
            String dtext5 = VKApplication.context.getResources().getString(senderProfile.f ? R.string.serv_created_chat_f : R.string.serv_created_chat_m, senderProfile.fullName, this.extras.getString("action_text"));
            return dtext5;
        } else if ("chat_title_update".equals(act)) {
            String dtext6 = VKApplication.context.getResources().getString(senderProfile.f ? R.string.serv_renamed_chat_f : R.string.serv_renamed_chat_m, senderProfile.fullName, this.extras.getString("action_text"));
            return dtext6;
        } else if ("chat_invite_user".equals(act)) {
            int uid = this.extras.getInt("action_mid");
            if (uid == this.sender) {
                String dtext7 = VKApplication.context.getResources().getString(senderProfile.f ? R.string.serv_user_returned_f : R.string.serv_user_returned_m, senderProfile.fullName);
                return dtext7;
            }
            if (this.extras.containsKey("action_email")) {
                name2 = this.extras.getString("action_email");
            } else {
                name2 = userAcc;
            }
            String dtext8 = VKApplication.context.getResources().getString(senderProfile.f ? R.string.serv_user_invited_f : R.string.serv_user_invited_m, senderProfile.fullName, name2);
            return dtext8;
        } else if ("chat_kick_user".equals(act)) {
            int uid2 = this.extras.getInt("action_mid");
            if (uid2 == this.sender) {
                String dtext9 = VKApplication.context.getResources().getString(senderProfile.f ? R.string.serv_user_left_f : R.string.serv_user_left_m, senderProfile.fullName);
                return dtext9;
            }
            if (this.extras.containsKey("action_email")) {
                name = this.extras.getString("action_email");
            } else {
                name = userAcc;
            }
            String dtext10 = VKApplication.context.getResources().getString(senderProfile.f ? R.string.serv_user_kicked_f : R.string.serv_user_kicked_m, senderProfile.fullName, name);
            return dtext10;
        } else {
            return "";
        }
    }

    public FwdMessage forward() {
        FwdMessage f = new FwdMessage();
        f.sender = this.sender;
        f.time = this.time;
        f.text = this.text;
        f.displayableText = this.displayableText;
        f.id = this.id;
        f.addAttachments(this.attachments);
        f.addFwdMessages(this.fwdMessages);
        return f;
    }

    private ArrayList<FwdMessage> parseFwdMessages(JSONArray msgs, @Nullable SparseArray<String> names, @Nullable SparseArray<String> photos) throws JSONException {
        ArrayList<FwdMessage> result = new ArrayList<>();
        for (int i = 0; i < msgs.length(); i++) {
            JSONObject jm = msgs.getJSONObject(i);
            FwdMessage m = new FwdMessage();
            m.sender = jm.optInt("user_id", jm.optInt(ArgKeys.UID));
            m.time = jm.getInt(ServerKeys.DATE);
            m.setText(jm.getString(TtmlNode.TAG_BODY));
            m.username = names == null ? "DELETED" : names.get(m.sender, "DELETED");
            m.userphoto = photos == null ? "http://vk.com/images/camera_c.gif" : photos.get(m.sender, "http://vk.com/images/camera_c.gif");
            if (jm.has("attachments")) {
                JSONArray atts = jm.getJSONArray("attachments");
                for (int j = 0; j < atts.length(); j++) {
                    Attachment att = Attachment.parse(atts.getJSONObject(j), names, photos);
                    if (att != null) {
                        m.addAttachment(att, atts.length() + 1);
                    }
                }
            }
            if (jm.has("geo")) {
                JSONObject jg = jm.getJSONObject("geo");
                if (jg.has("coordinates")) {
                    m.addAttachment(Attachment.parseGeo(jg), 1);
                }
            }
            Attachment.sort(m.attachments);
            if (jm.has("fwd_messages")) {
                m.addFwdMessages(parseFwdMessages(jm.getJSONArray("fwd_messages"), names, photos));
            }
            result.add(m);
        }
        return result;
    }

    /* loaded from: classes2.dex */
    public static class FwdMessage extends MessageBase {
        public String username = "";
        public String userphoto = "";

        public static FwdMessage deserialize(DataInputStream s) throws IOException {
            FwdMessage m = new FwdMessage();
            m.sender = s.readInt();
            m.time = s.readInt();
            m.setText(s.readUTF());
            m.username = s.readUTF();
            m.userphoto = s.readUTF();
            m.id = s.readInt();
            int atts = s.readInt();
            for (int i = 0; i < atts; i++) {
                Attachment att = Attachment.deserialize(s);
                if (att != null) {
                    m.addAttachment(att, atts);
                }
            }
            int nfwd = s.readInt();
            for (int i2 = 0; i2 < nfwd; i2++) {
                m.addFwdMessage(deserialize(s), nfwd);
            }
            return m;
        }

        public void setText(String t) {
            this.text = t;
            this.displayableText = Global.replaceEmoji(LinkParser.parseLinks(t));
        }

        public void serialize(DataOutputStream s) throws IOException {
            s.writeInt(this.sender);
            s.writeInt(this.time);
            s.writeUTF(this.text == null ? "" : this.text);
            s.writeUTF(this.username);
            s.writeUTF(this.userphoto);
            s.writeInt(this.id);
            s.writeInt(this.attachments.size());
            for (int i = 0; i < this.attachments.size(); i++) {
                this.attachments.get(i).serialize(s);
            }
            s.writeInt(this.fwdMessages.size());
            for (int i2 = 0; i2 < this.fwdMessages.size(); i2++) {
                this.fwdMessages.get(i2).serialize(s);
            }
        }
    }
}
