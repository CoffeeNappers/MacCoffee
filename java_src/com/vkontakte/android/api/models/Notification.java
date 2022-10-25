package com.vkontakte.android.api.models;

import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.Log;
import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.ui.posts.PostDisplayItem;
import java.util.List;
/* loaded from: classes2.dex */
public class Notification extends Model {
    public int commentID;
    public UserProfile commentUser;
    public int date;
    private CharSequence displayableText;
    public List<UserProfile> feedBackUsers;
    public NewsEntry grandParentPost;
    public List<Notification> group;
    public int id;
    public PostDisplayItem item;
    public CharSequence link;
    public MoneyTransfer moneyTransfer;
    public NewsEntry parentPost;
    public String stringDate;
    public Type type;

    /* loaded from: classes2.dex */
    public enum Activity {
        Follow,
        FriendAccepted,
        Mention,
        Wall,
        Comment,
        Reply,
        Like,
        Copy,
        None,
        MoneyTransfer
    }

    /* loaded from: classes2.dex */
    public enum FeedbackType {
        Users,
        Post,
        Comment,
        Copy,
        None,
        Group,
        Header,
        MoneyTransfer
    }

    /* loaded from: classes2.dex */
    public enum ParentType {
        Post,
        Photo,
        Video,
        Comment,
        Topic,
        Market,
        None
    }

    public void setText(CharSequence t) {
        setText(t, false);
    }

    public void setText(CharSequence t, boolean hasAttach) {
        if (!TextUtils.isEmpty(t)) {
            try {
                this.displayableText = Global.replaceEmoji(LinkParser.parseLinks(t));
            } catch (Exception x) {
                Log.w("vk", x);
                this.displayableText = t;
            }
            if (hasAttach) {
                SpannableStringBuilder builder = new SpannableStringBuilder(this.displayableText);
                builder.append((CharSequence) "\n");
                builder.append(getAttachmentString());
                this.displayableText = builder;
                return;
            }
            return;
        }
        this.displayableText = getAttachmentString();
    }

    public CharSequence getText() {
        return this.displayableText;
    }

    private static CharSequence getAttachmentString() {
        return VKApplication.context.getResources().getString(R.string.attachment);
    }

    /* loaded from: classes2.dex */
    public enum Type {
        Follow("follow", Activity.Follow, ParentType.None, FeedbackType.Users, ParentType.None),
        FriendAccepted("friend_accepted", Activity.FriendAccepted, ParentType.None, FeedbackType.Users, ParentType.None),
        Mention("mention", Activity.Mention, ParentType.None, FeedbackType.Post, ParentType.None),
        MentionComments("mention_comments", Activity.Mention, ParentType.Post, FeedbackType.Comment, ParentType.None),
        Wall(ReportAppInputData.REPORT_TYPE_WALL, Activity.Wall, ParentType.None, FeedbackType.Post, ParentType.None),
        WallPublish("wall_publish", Activity.Wall, ParentType.None, FeedbackType.Post, ParentType.None),
        CommentPost("comment_post", Activity.Comment, ParentType.Post, FeedbackType.Comment, ParentType.None),
        CommentPhoto("comment_photo", Activity.Comment, ParentType.Photo, FeedbackType.Comment, ParentType.None),
        CommentVideo("comment_video", Activity.Comment, ParentType.Video, FeedbackType.Comment, ParentType.None),
        ReplyComment("reply_comment", Activity.Reply, ParentType.Comment, FeedbackType.Comment, ParentType.Post),
        ReplyCommentPhoto("reply_comment_photo", Activity.Reply, ParentType.Comment, FeedbackType.Comment, ParentType.Photo),
        ReplyCommentVideo("reply_comment_video", Activity.Reply, ParentType.Comment, FeedbackType.Comment, ParentType.Video),
        ReplyCommentMarket("reply_comment_market", Activity.Reply, ParentType.Market, FeedbackType.Comment, ParentType.Market),
        ReplyTopic("reply_topic", Activity.Reply, ParentType.Topic, FeedbackType.Comment, ParentType.None),
        LikePost(Statistic.TYPE_POST_LIKE, Activity.Like, ParentType.Post, FeedbackType.Users, ParentType.None),
        LikeComment("like_comment", Activity.Like, ParentType.Comment, FeedbackType.Users, ParentType.Post),
        LikePhoto("like_photo", Activity.Like, ParentType.Photo, FeedbackType.Users, ParentType.None),
        LikeVideo("like_video", Activity.Like, ParentType.Video, FeedbackType.Users, ParentType.None),
        LikeCommentPhoto("like_comment_photo", Activity.Like, ParentType.Comment, FeedbackType.Users, ParentType.Photo),
        LikeCommentVideo("like_comment_video", Activity.Like, ParentType.Comment, FeedbackType.Users, ParentType.Video),
        LikeCommentTopic("like_comment_topic", Activity.Like, ParentType.Comment, FeedbackType.Users, ParentType.Topic),
        CopyPost("copy_post", Activity.Copy, ParentType.Post, FeedbackType.Copy, ParentType.None),
        CopyPhoto("copy_photo", Activity.Copy, ParentType.Photo, FeedbackType.Copy, ParentType.None),
        CopyVideo("copy_video", Activity.Copy, ParentType.Video, FeedbackType.Copy, ParentType.None),
        MentionCommentPhoto("mention_comment_photo", Activity.Mention, ParentType.Photo, FeedbackType.Comment, ParentType.None),
        MentionCommentVideo("mention_comment_video", Activity.Mention, ParentType.Video, FeedbackType.Comment, ParentType.None),
        Grouped("grouped", Activity.None, ParentType.None, FeedbackType.Group, ParentType.None),
        Header("header", Activity.None, ParentType.None, FeedbackType.Header, ParentType.None),
        Unknown("unknown", Activity.None, ParentType.None, FeedbackType.None, ParentType.None),
        MoneyTransferReceived("money_transfer_received", Activity.MoneyTransfer, ParentType.None, FeedbackType.MoneyTransfer, ParentType.None),
        MoneyTransferAccepted("money_transfer_accepted", Activity.MoneyTransfer, ParentType.None, FeedbackType.MoneyTransfer, ParentType.None),
        MoneyTransferDeclined("money_transfer_declined", Activity.MoneyTransfer, ParentType.None, FeedbackType.MoneyTransfer, ParentType.None);
        
        public final Activity activity;
        public final FeedbackType feedbackType;
        public final ParentType grandParentType;
        private final String mType;
        public final ParentType parentType;

        Type(String type, Activity activity, ParentType parent, FeedbackType feedback, ParentType grandParentType) {
            this.mType = type;
            this.parentType = parent;
            this.feedbackType = feedback;
            this.grandParentType = grandParentType;
            this.activity = activity;
        }

        public static Type parse(String type) {
            Type[] values = values();
            for (Type value : values) {
                if (value.mType.equals(type)) {
                    return value;
                }
            }
            return Unknown;
        }

        @Override // java.lang.Enum
        public String toString() {
            return this.mType;
        }
    }
}
