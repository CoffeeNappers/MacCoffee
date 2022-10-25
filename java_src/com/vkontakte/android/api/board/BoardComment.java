package com.vkontakte.android.api.board;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import android.text.SpannableStringBuilder;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import com.vkontakte.android.Comment;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.LinkSpan;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ZhukovLayout;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class BoardComment implements ServerKeys, Comment, Parcelable {
    public final ArrayList<Attachment> attachments;
    public boolean canLike;
    public CharSequence displayableText;
    public final int id;
    public boolean isLiked;
    public int likesCount;
    public final ArrayList<String> linkTitles;
    public final ArrayList<String> linkUrls;
    public int offset;
    public final int ownerId;
    public final int replyToCommentID;
    public final String respToName;
    public String text;
    public final int time;
    public final int uid;
    public final String userName;
    public final String userPhoto;
    static final String STRING_PATTERN_REPLY = "\\[((id|club)[0-9]+)(?::bp[-_0-9]+)?\\|([^\\]]+)\\]";
    static final Pattern PATTERN_REPLY = Pattern.compile(STRING_PATTERN_REPLY);
    static final Pattern ptn1 = Pattern.compile("((?:(?:http|https)://)?[a-zA-Zа-яА-Я0-9-]+\\.[a-zA-Zа-яА-Я]{2,4}[a-zA-Z/?\\.=#%&-_]+)");
    static final Pattern ptn2 = Pattern.compile("\\[id(\\d+):bp\\-(\\d+)_(\\d+)\\|([^\\]]+)\\]");
    static final Pattern ptn3 = Pattern.compile("\\[club(\\d+):bp\\-(\\d+)_(\\d+)\\|([^\\]]+)\\]");
    static final Pattern ptn4 = Pattern.compile("\\[id(\\d+)\\|([^\\]]+)\\]");
    static final Pattern ptn5 = Pattern.compile("\\[club(\\d+)\\|([^\\]]+)\\]");
    public static final Parcelable.Creator<BoardComment> CREATOR = new Parcelable.Creator<BoardComment>() { // from class: com.vkontakte.android.api.board.BoardComment.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public BoardComment mo637createFromParcel(Parcel in) {
            return new BoardComment(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public BoardComment[] mo638newArray(int size) {
            return new BoardComment[size];
        }
    };

    public BoardComment(int id, String text, String userName, String userPhoto, int uid, int time, int offset, int ownerId, @Nullable String replyToUser, int replyToComment) {
        this.attachments = new ArrayList<>();
        this.linkTitles = new ArrayList<>();
        this.linkUrls = new ArrayList<>();
        this.likesCount = 0;
        this.isLiked = false;
        this.canLike = true;
        this.ownerId = ownerId;
        this.id = id;
        this.text = text;
        this.userName = userName;
        this.userPhoto = userPhoto;
        this.uid = uid;
        this.time = time;
        this.offset = offset;
        this.respToName = replyToUser;
        this.replyToCommentID = replyToComment;
        processLinksAndEmoji();
    }

    public BoardComment(JSONObject jc, SparseArray<String> names, SparseArray<String> photos, int offset, int ownerId, @Nullable SparseArray<String> names_dat) throws JSONException {
        this.attachments = new ArrayList<>();
        this.linkTitles = new ArrayList<>();
        this.linkUrls = new ArrayList<>();
        this.likesCount = 0;
        this.isLiked = false;
        this.canLike = true;
        this.ownerId = ownerId;
        this.id = jc.getInt("id");
        this.uid = jc.getInt(ServerKeys.FROM_ID);
        String text = jc.getString("text");
        this.time = jc.getInt(ServerKeys.DATE);
        this.userName = names.get(this.uid);
        this.userPhoto = photos.get(this.uid);
        if (jc.has("reply_to_user")) {
            int id = jc.getInt("reply_to_user");
            if (id < 0) {
                this.respToName = VKApplication.context.getString(R.string.comment_to_community);
            } else if (names_dat != null) {
                this.respToName = names_dat.get(id);
            } else {
                this.respToName = null;
            }
        } else {
            this.respToName = null;
        }
        this.replyToCommentID = jc.optInt("reply_to_comment");
        if (jc.has("attachments")) {
            JSONArray atts = jc.getJSONArray("attachments");
            for (int j = 0; j < atts.length(); j++) {
                this.attachments.add(Attachment.parse(atts.getJSONObject(j), names, photos));
            }
        }
        Attachment.sort(this.attachments);
        DisplayMetrics metrics = VKApplication.context.getResources().getDisplayMetrics();
        int tSize = Math.min(Math.min(metrics.widthPixels, metrics.heightPixels) - Global.scale(95.0f), 604);
        ZhukovLayout.processThumbs(tSize, (int) (tSize * 0.666f), this.attachments);
        if (jc.has(ServerKeys.LIKES)) {
            JSONObject likesObj = jc.getJSONObject(ServerKeys.LIKES);
            this.likesCount = likesObj.optInt(ServerKeys.COUNT, this.likesCount);
            this.isLiked = likesObj.optInt(ServerKeys.USER_LIKES, 0) != 0;
            this.canLike = likesObj.optInt("can_like", 1) != 0;
        }
        this.text = text;
        processLinksAndEmoji();
        this.offset = offset;
    }

    public void processLinksAndEmoji() {
        Matcher matcher;
        this.displayableText = Global.replaceEmoji(LinkParser.parseLinks(this.text));
        Matcher matcher2 = ptn2.matcher(this.displayableText);
        while (matcher2.find()) {
            this.linkUrls.add("vkontakte://profile/" + matcher2.group(1));
            this.linkTitles.add(matcher2.group(4));
        }
        Matcher matcher3 = ptn3.matcher(this.displayableText);
        while (matcher3.find()) {
            this.linkUrls.add("vkontakte://profile/-" + matcher3.group(1));
            this.linkTitles.add(matcher3.group(4));
        }
        Matcher matcher4 = ptn4.matcher(this.displayableText);
        while (matcher4.find()) {
            this.linkUrls.add("vkontakte://profile/" + matcher4.group(1));
            this.linkTitles.add(matcher4.group(2));
        }
        Matcher matcher5 = ptn5.matcher(this.displayableText);
        while (matcher5.find()) {
            this.linkUrls.add("vkontakte://profile/-" + matcher5.group(1));
            this.linkTitles.add(matcher5.group(2));
        }
        if (this.displayableText instanceof SpannableStringBuilder) {
            LinkSpan[] spans = (LinkSpan[]) ((SpannableStringBuilder) this.displayableText).getSpans(0, this.displayableText.length() - 1, LinkSpan.class);
            if (spans.length > 0) {
                matcher = ptn1.matcher(spans[0].getLink());
            } else {
                matcher = ptn1.matcher(this.displayableText);
            }
        } else {
            matcher = ptn1.matcher(this.displayableText);
        }
        while (matcher.find()) {
            this.linkUrls.add("vklink://view/?" + matcher.group());
            this.linkTitles.add(matcher.group());
        }
        SpannableStringBuilder result = new SpannableStringBuilder(this.displayableText);
        Matcher matcher6 = PATTERN_REPLY.matcher(this.displayableText);
        int textOffset = 0;
        while (matcher6.find()) {
            LinkSpan span = new LinkSpan("vkontakte://vk.com/" + matcher6.group(1), null);
            result = result.replace(matcher6.start() - textOffset, matcher6.end() - textOffset, (CharSequence) matcher6.group(3));
            result.setSpan(span, matcher6.start() - textOffset, (matcher6.start() - textOffset) + matcher6.group(3).length(), 0);
            textOffset += matcher6.group().length() - matcher6.group(3).length();
        }
        this.displayableText = Global.replaceEmoji(result);
    }

    public int hashCode() {
        return this.id;
    }

    public boolean equals(Object o) {
        return (o != null && o.hashCode() == hashCode()) || ((o instanceof BoardComment) && ((BoardComment) o).id == this.id);
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
        return this.likesCount;
    }

    @Override // com.vkontakte.android.Comment
    public boolean isLiked() {
        return this.isLiked;
    }

    @Override // com.vkontakte.android.Comment
    public int getId() {
        return this.id;
    }

    @Override // com.vkontakte.android.Comment
    public String getResponseName() {
        return this.respToName;
    }

    @Override // com.vkontakte.android.Comment
    public boolean isBanned() {
        return false;
    }

    @Override // com.vkontakte.android.Comment
    public boolean isReported() {
        return false;
    }

    @Override // com.vkontakte.android.Comment
    public boolean isAuthorVerified() {
        return false;
    }

    @Override // com.vkontakte.android.Comment
    public boolean canEdit() {
        boolean canEdit = this.uid == VKAccountManager.getCurrent().getUid();
        return canEdit && !containsGraffiti();
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

    public BoardComment(Parcel parcel) {
        Parcelable[] readParcelableArray;
        boolean z = true;
        this.attachments = new ArrayList<>();
        this.linkTitles = new ArrayList<>();
        this.linkUrls = new ArrayList<>();
        this.likesCount = 0;
        this.isLiked = false;
        this.canLike = true;
        this.id = parcel.readInt();
        this.text = parcel.readString();
        processLinksAndEmoji();
        for (Parcelable parcelable : parcel.readParcelableArray(Attachment.class.getClassLoader())) {
            this.attachments.add((Attachment) parcelable);
        }
        this.userName = parcel.readString();
        this.userPhoto = parcel.readString();
        this.uid = parcel.readInt();
        this.time = parcel.readInt();
        parcel.readStringList(this.linkTitles);
        parcel.readStringList(this.linkUrls);
        this.offset = parcel.readInt();
        this.ownerId = parcel.readInt();
        this.likesCount = parcel.readInt();
        this.isLiked = parcel.readByte() != 0;
        this.canLike = parcel.readByte() == 0 ? false : z;
        this.respToName = parcel.readString();
        this.replyToCommentID = parcel.readInt();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        byte b = 1;
        parcel.writeInt(this.id);
        parcel.writeString(this.text);
        Parcelable[] parcelables = new Parcelable[this.attachments.size()];
        for (int i = 0; i < this.attachments.size(); i++) {
            parcelables[i] = this.attachments.get(i);
        }
        parcel.writeParcelableArray(parcelables, flags);
        parcel.writeString(this.userName);
        parcel.writeString(this.userPhoto);
        parcel.writeInt(this.uid);
        parcel.writeInt(this.time);
        parcel.writeStringList(this.linkTitles);
        parcel.writeStringList(this.linkUrls);
        parcel.writeInt(this.offset);
        parcel.writeInt(this.ownerId);
        parcel.writeInt(this.likesCount);
        parcel.writeByte(this.isLiked ? (byte) 1 : (byte) 0);
        if (!this.canLike) {
            b = 0;
        }
        parcel.writeByte(b);
        parcel.writeString(this.respToName);
        parcel.writeInt(this.replyToCommentID);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public static BoardComment createNewComment(int groupId, int commentId, List<Attachment> atts, String text, boolean fromGroup) {
        return createNewComment(groupId, commentId, atts, text, fromGroup, null, 0);
    }

    public static BoardComment createNewComment(int groupId, int commentId, List<Attachment> atts, String text, boolean fromGroup, @Nullable String replyToUser, int replyToComment) {
        int uid;
        String name;
        String photo;
        Pattern ptn12 = Pattern.compile("((?:(?:http|https)://)?[a-zA-Zа-яА-Я0-9-]+\\.[a-zA-Zа-яА-Я]{2,4}[a-zA-Z/?\\.=#%&-_]+)");
        VKAccount account = VKAccountManager.getCurrent();
        if (fromGroup) {
            uid = -groupId;
            Group g = Groups.getById(groupId);
            if (g != null) {
                name = g.name;
                photo = g.photo;
            } else {
                name = "DELETED";
                photo = null;
            }
        } else {
            uid = VKAccountManager.getCurrent().getUid();
            name = account.getName();
            photo = account.getPhoto();
        }
        BoardComment comment = new BoardComment(commentId, text, name, photo, uid, TimeUtils.getCurrentTime(), 0, groupId, replyToUser, replyToComment);
        comment.processLinksAndEmoji();
        comment.attachments.addAll(atts);
        DisplayMetrics metrics = VKApplication.context.getResources().getDisplayMetrics();
        int tSize = Math.min(Math.min(metrics.widthPixels, metrics.heightPixels) - Global.scale(95.0f), 604);
        ZhukovLayout.processThumbs(tSize, (int) (tSize * 0.666f), comment.attachments);
        Matcher matcher = ptn12.matcher(comment.text);
        while (matcher.find()) {
            comment.linkUrls.add("vklink://view/?" + matcher.group());
            comment.linkTitles.add(matcher.group());
        }
        return comment;
    }
}
