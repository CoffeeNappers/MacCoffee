package com.vkontakte.android;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseArray;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NewsComment implements Parcelable, Comment {
    public static final Parcelable.Creator<NewsComment> CREATOR = new Parcelable.Creator<NewsComment>() { // from class: com.vkontakte.android.NewsComment.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public NewsComment mo554createFromParcel(Parcel in) {
            return new NewsComment(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public NewsComment[] mo555newArray(int size) {
            return new NewsComment[size];
        }
    };
    public ArrayList<Attachment> attachments = new ArrayList<>();
    public boolean canDelete;
    public boolean canEdit;
    public int cid;
    public int cnum;
    public CharSequence displayableText;
    public boolean isAuthorVerified;
    public boolean isBanned;
    public boolean isDeleted;
    public boolean isLiked;
    public boolean isReported;
    public int numLikes;
    public int replyToCommentID;
    public String respToName;
    public String text;
    public int time;
    public int uid;
    public String userName;
    public String userPhoto;
    public String userRName;
    public String userWName;

    public NewsComment() {
    }

    public NewsComment(Parcel p) {
        boolean z = true;
        this.text = p.readString();
        this.userName = p.readString();
        this.userRName = p.readString();
        this.userWName = p.readString();
        this.time = p.readInt();
        this.respToName = p.readString();
        this.userPhoto = p.readString();
        this.cid = p.readInt();
        this.uid = p.readInt();
        this.cnum = p.readInt();
        this.replyToCommentID = p.readInt();
        this.canDelete = p.readInt() != 0;
        this.numLikes = p.readInt();
        this.isLiked = p.readInt() != 0;
        this.isDeleted = p.readInt() == 0 ? false : z;
    }

    public NewsComment(JSONObject jc, SparseArray<String> names, SparseArray<String> photos, SparseArray<String> names_dat, ArrayList<Integer> verifiedList) throws JSONException {
        boolean z = true;
        this.cid = jc.getInt("id");
        this.uid = jc.getInt(ServerKeys.FROM_ID);
        String txt = jc.getString("text");
        setText(txt);
        this.userPhoto = photos.get(this.uid);
        this.userName = names.get(this.uid);
        this.userRName = names_dat.get(this.uid);
        this.isAuthorVerified = verifiedList.contains(Integer.valueOf(this.uid));
        if (this.userRName == null || this.userRName.isEmpty()) {
            this.userRName = this.userName;
        }
        if (jc.has("reply_to_user")) {
            int id = jc.getInt("reply_to_user");
            if (id < 0) {
                this.respToName = VKApplication.context.getString(R.string.comment_to_community);
            } else {
                this.respToName = names_dat.get(id);
            }
        }
        this.time = jc.getInt(ServerKeys.DATE);
        this.canEdit = jc.optInt("can_edit") == 1;
        this.replyToCommentID = jc.optInt("reply_to_comment");
        if (jc.has(ServerKeys.LIKES)) {
            this.numLikes = jc.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.COUNT);
            this.isLiked = jc.getJSONObject(ServerKeys.LIKES).optInt(ServerKeys.USER_LIKES) != 1 ? false : z;
        }
        if (jc.has("attachments")) {
            JSONArray atts = jc.getJSONArray("attachments");
            for (int i = 0; i < atts.length(); i++) {
                this.attachments.add(Attachment.parse(atts.getJSONObject(i), names, photos));
            }
            Attachment.sort(this.attachments);
        }
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel p, int flags) {
        int i = 1;
        p.writeString(this.text);
        p.writeString(this.userName);
        p.writeString(this.userRName);
        p.writeString(this.userWName);
        p.writeInt(this.time);
        p.writeString(this.respToName);
        p.writeString(this.userPhoto);
        p.writeInt(this.cid);
        p.writeInt(this.uid);
        p.writeInt(this.cnum);
        p.writeInt(this.replyToCommentID);
        p.writeInt(this.canDelete ? 1 : 0);
        p.writeInt(this.numLikes);
        p.writeInt(this.isLiked ? 1 : 0);
        if (!this.isDeleted) {
            i = 0;
        }
        p.writeInt(i);
    }

    public void setText(String t) {
        this.text = t;
        this.displayableText = Global.replaceEmoji(LinkParser.parseLinks(this.text));
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.Comment
    public ArrayList<Attachment> getAttachments() {
        return this.attachments;
    }

    @Override // com.vkontakte.android.Comment
    public String getUserPhoto() {
        return this.userPhoto;
    }

    @Override // com.vkontakte.android.Comment
    public String getUserName() {
        return this.userName;
    }

    @Override // com.vkontakte.android.Comment
    public CharSequence getDisplayableText() {
        return this.displayableText;
    }

    @Override // com.vkontakte.android.Comment
    public int getTime() {
        return this.time;
    }

    @Override // com.vkontakte.android.Comment
    public int getUid() {
        return this.uid;
    }

    @Override // com.vkontakte.android.Comment
    public int getNumLikes() {
        return this.numLikes;
    }

    @Override // com.vkontakte.android.Comment
    public boolean isLiked() {
        return this.isLiked;
    }

    @Override // com.vkontakte.android.Comment
    public int getId() {
        return this.cid;
    }

    @Override // com.vkontakte.android.Comment
    public String getResponseName() {
        return this.respToName;
    }

    @Override // com.vkontakte.android.Comment
    public boolean isBanned() {
        return this.isBanned;
    }

    @Override // com.vkontakte.android.Comment
    public boolean isReported() {
        return this.isReported;
    }

    @Override // com.vkontakte.android.Comment
    public boolean canEdit() {
        return this.canEdit && !containsGraffiti();
    }

    @Override // com.vkontakte.android.Comment
    public boolean isAuthorVerified() {
        return this.isAuthorVerified;
    }

    @Override // com.vkontakte.android.Comment
    public boolean containsGraffiti() {
        if (this.attachments != null) {
            for (int i = 0; i < this.attachments.size(); i++) {
                Attachment att = this.attachments.get(i);
                if (att instanceof GraffitiAttachment) {
                    return true;
                }
            }
        }
        return false;
    }
}
