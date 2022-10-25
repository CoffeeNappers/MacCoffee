.class public final enum Lcom/vkontakte/android/api/models/Notification$Type;
.super Ljava/lang/Enum;
.source "Notification.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/models/Notification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/api/models/Notification$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum CommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum CommentPost:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum CommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum CopyPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum CopyPost:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum CopyVideo:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum Follow:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum FriendAccepted:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum Grouped:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum Header:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum LikeComment:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum LikeCommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum LikeCommentTopic:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum LikeCommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum LikePhoto:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum LikePost:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum LikeVideo:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum Mention:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum MentionCommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum MentionCommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum MentionComments:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum MoneyTransferAccepted:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum MoneyTransferDeclined:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum MoneyTransferReceived:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum ReplyComment:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum ReplyCommentMarket:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum ReplyCommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum ReplyCommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum ReplyTopic:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum Unknown:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum Wall:Lcom/vkontakte/android/api/models/Notification$Type;

.field public static final enum WallPublish:Lcom/vkontakte/android/api/models/Notification$Type;


# instance fields
.field public final activity:Lcom/vkontakte/android/api/models/Notification$Activity;

.field public final feedbackType:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

.field public final grandParentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

.field private final mType:Ljava/lang/String;

.field public final parentType:Lcom/vkontakte/android/api/models/Notification$ParentType;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .prologue
    const/4 v14, 0x4

    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v2, 0x0

    .line 124
    new-instance v0, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v1, "Follow"

    const-string/jumbo v3, "follow"

    sget-object v4, Lcom/vkontakte/android/api/models/Notification$Activity;->Follow:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v5, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v6, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Type;->Follow:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 125
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "FriendAccepted"

    const-string/jumbo v6, "friend_accepted"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->FriendAccepted:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    move v5, v11

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->FriendAccepted:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 126
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "Mention"

    const-string/jumbo v6, "mention"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Mention:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Post:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    move v5, v12

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->Mention:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 127
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "MentionComments"

    const-string/jumbo v6, "mention_comments"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Mention:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Post:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    move v5, v13

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->MentionComments:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 128
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "Wall"

    const-string/jumbo v6, "wall"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Wall:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Post:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    move v5, v14

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->Wall:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 129
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "WallPublish"

    const/4 v5, 0x5

    const-string/jumbo v6, "wall_publish"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Wall:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Post:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->WallPublish:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 130
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "CommentPost"

    const/4 v5, 0x6

    const-string/jumbo v6, "comment_post"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Comment:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Post:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->CommentPost:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 131
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "CommentPhoto"

    const/4 v5, 0x7

    const-string/jumbo v6, "comment_photo"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Comment:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Photo:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->CommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 132
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "CommentVideo"

    const/16 v5, 0x8

    const-string/jumbo v6, "comment_video"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Comment:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Video:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->CommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 133
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "ReplyComment"

    const/16 v5, 0x9

    const-string/jumbo v6, "reply_comment"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Reply:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Comment:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->Post:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyComment:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 134
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "ReplyCommentPhoto"

    const/16 v5, 0xa

    const-string/jumbo v6, "reply_comment_photo"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Reply:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Comment:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->Photo:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyCommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 135
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "ReplyCommentVideo"

    const/16 v5, 0xb

    const-string/jumbo v6, "reply_comment_video"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Reply:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Comment:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->Video:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyCommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 136
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "ReplyCommentMarket"

    const/16 v5, 0xc

    const-string/jumbo v6, "reply_comment_market"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Reply:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Market:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->Market:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyCommentMarket:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 137
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "ReplyTopic"

    const/16 v5, 0xd

    const-string/jumbo v6, "reply_topic"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Reply:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Topic:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyTopic:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 138
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "LikePost"

    const/16 v5, 0xe

    const-string/jumbo v6, "like_post"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Like:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Post:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->LikePost:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 139
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "LikeComment"

    const/16 v5, 0xf

    const-string/jumbo v6, "like_comment"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Like:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Comment:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->Post:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->LikeComment:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 140
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "LikePhoto"

    const/16 v5, 0x10

    const-string/jumbo v6, "like_photo"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Like:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Photo:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->LikePhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 141
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "LikeVideo"

    const/16 v5, 0x11

    const-string/jumbo v6, "like_video"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Like:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Video:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->LikeVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 142
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "LikeCommentPhoto"

    const/16 v5, 0x12

    const-string/jumbo v6, "like_comment_photo"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Like:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Comment:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->Photo:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->LikeCommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 143
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "LikeCommentVideo"

    const/16 v5, 0x13

    const-string/jumbo v6, "like_comment_video"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Like:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Comment:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->Video:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->LikeCommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 144
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "LikeCommentTopic"

    const/16 v5, 0x14

    const-string/jumbo v6, "like_comment_topic"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Like:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Comment:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Users:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->Topic:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->LikeCommentTopic:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 145
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "CopyPost"

    const/16 v5, 0x15

    const-string/jumbo v6, "copy_post"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Copy:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Post:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Copy:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->CopyPost:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 146
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "CopyPhoto"

    const/16 v5, 0x16

    const-string/jumbo v6, "copy_photo"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Copy:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Photo:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Copy:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->CopyPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 147
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "CopyVideo"

    const/16 v5, 0x17

    const-string/jumbo v6, "copy_video"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Copy:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Video:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Copy:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->CopyVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 148
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "MentionCommentPhoto"

    const/16 v5, 0x18

    const-string/jumbo v6, "mention_comment_photo"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Mention:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Photo:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->MentionCommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 149
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "MentionCommentVideo"

    const/16 v5, 0x19

    const-string/jumbo v6, "mention_comment_video"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->Mention:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->Video:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->MentionCommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 150
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "Grouped"

    const/16 v5, 0x1a

    const-string/jumbo v6, "grouped"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->None:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Group:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->Grouped:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 151
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "Header"

    const/16 v5, 0x1b

    const-string/jumbo v6, "header"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->None:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Header:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->Header:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 152
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "Unknown"

    const/16 v5, 0x1c

    const-string/jumbo v6, "unknown"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->None:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->None:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->Unknown:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 153
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "MoneyTransferReceived"

    const/16 v5, 0x1d

    const-string/jumbo v6, "money_transfer_received"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferReceived:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 154
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "MoneyTransferAccepted"

    const/16 v5, 0x1e

    const-string/jumbo v6, "money_transfer_accepted"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferAccepted:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 155
    new-instance v3, Lcom/vkontakte/android/api/models/Notification$Type;

    const-string/jumbo v4, "MoneyTransferDeclined"

    const/16 v5, 0x1f

    const-string/jumbo v6, "money_transfer_declined"

    sget-object v7, Lcom/vkontakte/android/api/models/Notification$Activity;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$Activity;

    sget-object v8, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v9, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v10, Lcom/vkontakte/android/api/models/Notification$ParentType;->None:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-direct/range {v3 .. v10}, Lcom/vkontakte/android/api/models/Notification$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V

    sput-object v3, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferDeclined:Lcom/vkontakte/android/api/models/Notification$Type;

    .line 121
    const/16 v0, 0x20

    new-array v0, v0, [Lcom/vkontakte/android/api/models/Notification$Type;

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Type;->Follow:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Type;->FriendAccepted:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v1, v0, v11

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Type;->Mention:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v1, v0, v12

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Type;->MentionComments:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v1, v0, v13

    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Type;->Wall:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v1, v0, v14

    const/4 v1, 0x5

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->WallPublish:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->CommentPost:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->CommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->CommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyComment:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyCommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyCommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyCommentMarket:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->ReplyTopic:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->LikePost:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->LikeComment:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->LikePhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->LikeVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->LikeCommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->LikeCommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->LikeCommentTopic:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->CopyPost:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x16

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->CopyPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x17

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->CopyVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x18

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->MentionCommentPhoto:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x19

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->MentionCommentVideo:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->Grouped:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->Header:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->Unknown:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferReceived:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferAccepted:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    sget-object v2, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferDeclined:Lcom/vkontakte/android/api/models/Notification$Type;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/api/models/Notification$Type;->$VALUES:[Lcom/vkontakte/android/api/models/Notification$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Lcom/vkontakte/android/api/models/Notification$Activity;Lcom/vkontakte/android/api/models/Notification$ParentType;Lcom/vkontakte/android/api/models/Notification$FeedbackType;Lcom/vkontakte/android/api/models/Notification$ParentType;)V
    .locals 0
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "activity"    # Lcom/vkontakte/android/api/models/Notification$Activity;
    .param p5, "parent"    # Lcom/vkontakte/android/api/models/Notification$ParentType;
    .param p6, "feedback"    # Lcom/vkontakte/android/api/models/Notification$FeedbackType;
    .param p7, "grandParentType"    # Lcom/vkontakte/android/api/models/Notification$ParentType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/api/models/Notification$Activity;",
            "Lcom/vkontakte/android/api/models/Notification$ParentType;",
            "Lcom/vkontakte/android/api/models/Notification$FeedbackType;",
            "Lcom/vkontakte/android/api/models/Notification$ParentType;",
            ")V"
        }
    .end annotation

    .prologue
    .line 166
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 167
    iput-object p3, p0, Lcom/vkontakte/android/api/models/Notification$Type;->mType:Ljava/lang/String;

    .line 168
    iput-object p5, p0, Lcom/vkontakte/android/api/models/Notification$Type;->parentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

    .line 169
    iput-object p6, p0, Lcom/vkontakte/android/api/models/Notification$Type;->feedbackType:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 170
    iput-object p7, p0, Lcom/vkontakte/android/api/models/Notification$Type;->grandParentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

    .line 171
    iput-object p4, p0, Lcom/vkontakte/android/api/models/Notification$Type;->activity:Lcom/vkontakte/android/api/models/Notification$Activity;

    .line 172
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/vkontakte/android/api/models/Notification$Type;
    .locals 4
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    .line 175
    invoke-static {}, Lcom/vkontakte/android/api/models/Notification$Type;->values()[Lcom/vkontakte/android/api/models/Notification$Type;

    move-result-object v2

    .line 176
    .local v2, "values":[Lcom/vkontakte/android/api/models/Notification$Type;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 177
    aget-object v1, v2, v0

    .line 178
    .local v1, "value":Lcom/vkontakte/android/api/models/Notification$Type;
    iget-object v3, v1, Lcom/vkontakte/android/api/models/Notification$Type;->mType:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 182
    .end local v1    # "value":Lcom/vkontakte/android/api/models/Notification$Type;
    :goto_1
    return-object v1

    .line 176
    .restart local v1    # "value":Lcom/vkontakte/android/api/models/Notification$Type;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 182
    .end local v1    # "value":Lcom/vkontakte/android/api/models/Notification$Type;
    :cond_1
    sget-object v1, Lcom/vkontakte/android/api/models/Notification$Type;->Unknown:Lcom/vkontakte/android/api/models/Notification$Type;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/api/models/Notification$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 121
    const-class v0, Lcom/vkontakte/android/api/models/Notification$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification$Type;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/api/models/Notification$Type;
    .locals 1

    .prologue
    .line 121
    sget-object v0, Lcom/vkontakte/android/api/models/Notification$Type;->$VALUES:[Lcom/vkontakte/android/api/models/Notification$Type;

    invoke-virtual {v0}, [Lcom/vkontakte/android/api/models/Notification$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/api/models/Notification$Type;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/vkontakte/android/api/models/Notification$Type;->mType:Ljava/lang/String;

    return-object v0
.end method
