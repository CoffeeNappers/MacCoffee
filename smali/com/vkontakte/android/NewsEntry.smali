.class public Lcom/vkontakte/android/NewsEntry;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "NewsEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/NewsEntry$Activity;,
        Lcom/vkontakte/android/NewsEntry$XColorSpan;,
        Lcom/vkontakte/android/NewsEntry$URLSpanNoUnderline;
    }
.end annotation


# static fields
.field private static final CAPTION_ACTION_TEXT:Ljava/lang/String; = "captionActionText"

.field private static final CAPTION_ACTION_URL:Ljava/lang/String; = "captionActionUrl"

.field private static final CAPTION_TEXT:Ljava/lang/String; = "captionText"

.field private static final CAPTION_TYPE:Ljava/lang/String; = "captionType"

.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXTRAS_KEY_ADS_ID_1:Ljava/lang/String; = "extras_key_ads_1"

.field public static final EXTRAS_KEY_ADS_ID_2:Ljava/lang/String; = "extras_key_ads_2"

.field public static final EXTRAS_KEY_LIST_REFER:Ljava/lang/String; = "extras_key_list_refer"

.field public static final EXTRAS_KEY_MARKED_AS_ADS:Ljava/lang/String; = "extras_key_marked_as_ads"

.field public static final EXTRAS_KEY_TRACK_CODE:Ljava/lang/String; = "extras_key_track_code"

.field public static final EXTRAS_KEY_USER_NOTIFICATION:Ljava/lang/String; = "extras_key_user_notification"

.field public static final FLAG_CAN_COMMENT:I = 0x2

.field public static final FLAG_CAN_DELETE:I = 0x40

.field public static final FLAG_CAN_EDIT:I = 0x80

.field public static final FLAG_CAN_FIX:I = 0x10000

.field public static final FLAG_CAN_GROUP_COMMENT:I = 0x20000

.field public static final FLAG_CAN_RETWEET:I = 0x1

.field public static final FLAG_DELETED_PROFILE:I = 0x8000

.field public static final FLAG_EXPORT_FACEBOOK:I = 0x4000

.field public static final FLAG_EXPORT_TWITTER:I = 0x2000

.field public static final FLAG_FIXED:I = 0x400

.field public static final FLAG_FRIENDS_ONLY:I = 0x200

.field public static final FLAG_GRAY_TEXT:I = 0x10

.field public static final FLAG_IS_PROFILE_UPDATE:I = 0x100

.field public static final FLAG_IS_RETWEET:I = 0x20

.field public static final FLAG_LIKED:I = 0x8

.field public static final FLAG_POSTPONED:I = 0x800

.field public static final FLAG_RETWEETED:I = 0x4

.field public static final FLAG_SUGGESTED:I = 0x1000

.field public static final OWNER_ID_FRIENDS_RECOMMENDATION:I = 0x77359400

.field public static final OWNER_ID_NOTIFICATION:I = 0x77359401

.field public static final OWNER_ID_WIDGET:I = 0x77359402

.field public static final PLATFORM_ANDROID:I = 0x2

.field public static final PLATFORM_INSTAGRAM:I = 0x8

.field public static final PLATFORM_IPAD:I = 0x4

.field public static final PLATFORM_IPHONE:I = 0x3

.field public static final PLATFORM_MOBILE_SITE:I = 0x1

.field public static final PLATFORM_OTHER_APP:I = 0x7

.field public static final PLATFORM_PRISMA:I = 0xa

.field public static final PLATFORM_SITE:I = 0x0

.field public static final PLATFORM_SNAPSTER:I = 0x9

.field public static final PLATFORM_WINDOWS:I = 0x6

.field public static final PLATFORM_WINPHONE:I = 0x5

.field private static final SUGGEST_SUBSCRIBE:Ljava/lang/String; = "suggest_subscribe"

.field public static final TYPE_ADDED_PHOTO:I = 0x6

.field public static final TYPE_AD_PROMO_POST:I = 0xc

.field public static final TYPE_AUDIO:I = 0xa

.field public static final TYPE_BIRTHDAY:I = 0x8

.field public static final TYPE_BOARD_COMMENT:I = 0xe

.field public static final TYPE_COMMENT:I = 0x5

.field public static final TYPE_DOCUMENT:I = 0x10

.field public static final TYPE_FRIENDS_RECOMM:I = 0xd

.field public static final TYPE_GOOD:I = 0x12

.field public static final TYPE_MARKET_COMMENT:I = 0x11

.field public static final TYPE_NOTE:I = 0x3

.field public static final TYPE_PHOTO:I = 0x1

.field public static final TYPE_POST:I = 0x0

.field public static final TYPE_SHIT:I = 0xb

.field public static final TYPE_TAGGED_PHOTO:I = 0x7

.field public static final TYPE_TOPIC:I = 0x4

.field public static final TYPE_USER_NOTIFICATION:I = 0xf

.field public static final TYPE_VIDEO:I = 0x2

.field public static final TYPE_WALL_PHOTO:I = 0x9

.field public static final TYPE_WIDGET:I = 0x13


# instance fields
.field public activity:Lcom/vkontakte/android/NewsEntry$Activity;

.field public attachTitle:Ljava/lang/String;

.field public attachType:I

.field public attachments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation
.end field

.field public captionActionText:Ljava/lang/CharSequence;

.field public captionActionUrl:Ljava/lang/CharSequence;

.field public captionText:Ljava/lang/CharSequence;

.field public captionType:Ljava/lang/String;

.field public createdBy:I

.field public displayablePreviewText:Ljava/lang/CharSequence;

.field public displayableRetweetText:Ljava/lang/CharSequence;

.field public extra:Landroid/os/Bundle;

.field public f:Z

.field public flags:I

.field public lastComment:Ljava/lang/String;

.field public lastCommentTime:I

.field public lastCommentUserID:I

.field public lastCommentUserName:Ljava/lang/String;

.field public lastCommentUserPhoto:Ljava/lang/String;

.field public numComments:I

.field public numLikes:I

.field public numRetweets:I

.field public numViews:I

.field public order_position:I

.field public ownerID:I

.field public platform:I

.field public postID:I

.field public postInteract:Lcom/vkontakte/android/data/PostInteract;

.field public repostAttachments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation
.end field

.field public retweetOrigId:I

.field public retweetOrigTime:I

.field public retweetText:Ljava/lang/String;

.field public retweetType:I

.field public retweetUID:I

.field public retweetUserName:Ljava/lang/String;

.field public retweetUserPhoto:Ljava/lang/String;

.field public suggestSubscribe:Ljava/lang/Boolean;

.field public text:Ljava/lang/String;

.field public time:I

.field public type:I

.field public userID:I

.field public userName:Ljava/lang/String;

.field public userPhotoURL:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1252
    new-instance v0, Lcom/vkontakte/android/NewsEntry$1;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/NewsEntry;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 197
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 147
    const-string/jumbo v0, "UNKNOWN"

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 151
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 152
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 153
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 161
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->attachType:I

    .line 164
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    .line 166
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 167
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 168
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 181
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    .line 183
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 188
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 198
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 5
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v1, 0x0

    .line 265
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 147
    const-string/jumbo v0, "UNKNOWN"

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 151
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 152
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 153
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 161
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->attachType:I

    .line 164
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    .line 166
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 167
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 168
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 181
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    .line 183
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 188
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 266
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 267
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->userID:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 268
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 269
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 270
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->type:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 271
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 272
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    .line 273
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->time:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 274
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 278
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    .line 279
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    .line 280
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    .line 281
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    .line 282
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    .line 283
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    .line 284
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 285
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->numViews:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 286
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 288
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 291
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->flags:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 292
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->type:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 293
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 294
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    .line 295
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->platform:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    .line 297
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->order_position:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 298
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    .line 300
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->captionType:Ljava/lang/String;

    iget-object v1, p1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "captionText"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v3, "captionActionText"

    .line 301
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "captionActionUrl"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 300
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/vkontakte/android/NewsEntry;->setCaption(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "suggest_subscribe"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "suggest_subscribe"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/NewsEntry;->setSuggestSubscribe(Z)V

    .line 305
    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/Photo;)V
    .locals 11
    .param p1, "curPhoto"    # Lcom/vkontakte/android/Photo;

    .prologue
    const/4 v9, 0x0

    const-wide v4, -0x3f3e6c0000000000L    # -9000.0

    const/4 v10, 0x0

    .line 200
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 147
    const-string/jumbo v0, "UNKNOWN"

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 151
    iput v10, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 152
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 153
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 161
    iput v10, p0, Lcom/vkontakte/android/NewsEntry;->attachType:I

    .line 164
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    .line 166
    iput v10, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 167
    iput v10, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 168
    iput v10, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 181
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    .line 183
    iput-object v9, p0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 188
    iput v10, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 201
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 202
    iget v0, p1, Lcom/vkontakte/android/Photo;->id:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 203
    iget v0, p1, Lcom/vkontakte/android/Photo;->ownerID:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 204
    iget v0, p1, Lcom/vkontakte/android/Photo;->userID:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 205
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v2, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-direct {v2, p1}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    iget v0, p1, Lcom/vkontakte/android/Photo;->date:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 210
    iget v0, p1, Lcom/vkontakte/android/Photo;->nLikes:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 211
    iget v0, p1, Lcom/vkontakte/android/Photo;->nReposts:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 212
    iget v0, p1, Lcom/vkontakte/android/Photo;->nComments:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 213
    iget-object v0, p1, Lcom/vkontakte/android/Photo;->user:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p1, Lcom/vkontakte/android/Photo;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 215
    iget-object v0, p1, Lcom/vkontakte/android/Photo;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 217
    :cond_0
    iget-wide v2, p1, Lcom/vkontakte/android/Photo;->lat:D

    cmpl-double v0, v2, v4

    if-eqz v0, :cond_1

    iget-wide v2, p1, Lcom/vkontakte/android/Photo;->lon:D

    cmpl-double v0, v2, v4

    if-eqz v0, :cond_1

    .line 218
    new-instance v1, Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v2, p1, Lcom/vkontakte/android/Photo;->lat:D

    iget-wide v4, p1, Lcom/vkontakte/android/Photo;->lon:D

    const-string/jumbo v6, ""

    iget-object v7, p1, Lcom/vkontakte/android/Photo;->geoAddress:Ljava/lang/String;

    const/16 v8, -0x2328

    invoke-direct/range {v1 .. v10}, Lcom/vkontakte/android/attachments/GeoAttachment;-><init>(DDLjava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 219
    .local v1, "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    .end local v1    # "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    :cond_1
    const/16 v0, 0x8

    iget-boolean v2, p1, Lcom/vkontakte/android/Photo;->isLiked:Z

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 222
    const/4 v0, 0x2

    iget-boolean v2, p1, Lcom/vkontakte/android/Photo;->canComment:Z

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 223
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/data/UserNotification;)V
    .locals 2
    .param p1, "userNotification"    # Lcom/vkontakte/android/data/UserNotification;

    .prologue
    const/4 v1, 0x0

    .line 258
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 147
    const-string/jumbo v0, "UNKNOWN"

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 151
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 152
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 153
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 161
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->attachType:I

    .line 164
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    .line 166
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 167
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 168
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 181
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    .line 183
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 188
    iput v1, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 259
    const/16 v0, 0xf

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 260
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "extras_key_user_notification"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 261
    const v0, 0x77359401

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->userID:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 262
    iget v0, p1, Lcom/vkontakte/android/data/UserNotification;->id:I

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 263
    return-void
.end method

.method constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 8
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 1091
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 147
    const-string/jumbo v6, "UNKNOWN"

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 151
    iput v7, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 152
    const-string/jumbo v6, ""

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 153
    const-string/jumbo v6, ""

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 161
    iput v7, p0, Lcom/vkontakte/android/NewsEntry;->attachType:I

    .line 164
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 165
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    .line 166
    iput v7, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 167
    iput v7, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 168
    iput v7, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 181
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    .line 183
    iput-object v5, p0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 188
    iput v7, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 1092
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 1093
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 1094
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 1095
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 1096
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 1097
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 1098
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 1099
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 1100
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 1101
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    .line 1102
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    .line 1103
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 1104
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 1105
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 1106
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->attachType:I

    .line 1107
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->attachTitle:Ljava/lang/String;

    .line 1108
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 1110
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 1111
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    .line 1112
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    .line 1113
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    .line 1114
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    .line 1115
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->createdBy:I

    .line 1116
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    iput v6, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    .line 1118
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    .line 1119
    .local v0, "attachmentsLen":I
    if-ltz v0, :cond_0

    .line 1120
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 1121
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 1122
    iget-object v6, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const-class v7, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-virtual {p1, v7}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1121
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1125
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    .line 1126
    .local v3, "repostAttachmentLen":I
    if-ltz v3, :cond_1

    .line 1127
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    .line 1128
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    if-ge v1, v3, :cond_1

    .line 1129
    iget-object v6, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    const-class v7, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-virtual {p1, v7}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1128
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1133
    .end local v1    # "i":I
    :cond_1
    const-class v6, Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcom/vkontakte/android/utils/Serializer;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    .line 1134
    invoke-direct {p0}, Lcom/vkontakte/android/NewsEntry;->loadExtras()V

    .line 1136
    iget-object v6, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    if-nez v6, :cond_5

    move-object v2, v5

    .line 1137
    .local v2, "listRefer":Ljava/lang/String;
    :goto_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    new-instance v5, Lcom/vkontakte/android/data/PostInteract;

    invoke-direct {v5, v2, p0}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    :cond_2
    iput-object v5, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 1138
    invoke-virtual {p0}, Lcom/vkontakte/android/NewsEntry;->getShitAttachment()Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v4

    .line 1139
    .local v4, "statistic":Lcom/vkontakte/android/statistics/Statistic;
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v5, :cond_3

    if-eqz v4, :cond_3

    .line 1140
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    const-string/jumbo v6, "click_post_link"

    invoke-interface {v4, v6}, Lcom/vkontakte/android/statistics/Statistic;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/data/PostInteract;->setClickPostLinks(Ljava/util/List;)V

    .line 1143
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    iget-object v6, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    invoke-static {v5, v6}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;Lcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    .line 1145
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    if-eqz v5, :cond_4

    .line 1146
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    iget-object v6, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    invoke-static {v5, v6}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;Lcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    .line 1149
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/NewsEntry;->layoutThumbs()V

    .line 1151
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 1152
    const-class v5, Lcom/vkontakte/android/NewsEntry$Activity;

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/NewsEntry$Activity;

    iput-object v5, p0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    .line 1153
    return-void

    .line 1136
    .end local v2    # "listRefer":Ljava/lang/String;
    .end local v4    # "statistic":Lcom/vkontakte/android/statistics/Statistic;
    :cond_5
    iget-object v6, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "extras_key_list_refer"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2
.end method

.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)V
    .locals 6
    .param p1, "item"    # Lorg/json/JSONObject;
    .param p2, "listRefer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 308
    .local p3, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p4, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;)V

    .line 309
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;)V
    .locals 7
    .param p1, "item"    # Lorg/json/JSONObject;
    .param p2, "listRefer"    # Ljava/lang/String;
    .param p5, "sex"    # Landroid/util/SparseBooleanArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseBooleanArray;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 313
    .local p3, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p4, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 314
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 45
    .param p1, "item"    # Lorg/json/JSONObject;
    .param p2, "listRefer"    # Ljava/lang/String;
    .param p5, "sex"    # Landroid/util/SparseBooleanArray;
    .param p6, "shitAttachment"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseBooleanArray;",
            "Lcom/vkontakte/android/attachments/ShitAttachment;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 317
    .local p3, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p4, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 147
    const-string/jumbo v3, "UNKNOWN"

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 151
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 152
    const-string/jumbo v3, ""

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 153
    const-string/jumbo v3, ""

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 161
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->attachType:I

    .line 164
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 165
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    .line 166
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 167
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 168
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 181
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    .line 183
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 188
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 318
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "extras_key_list_refer"

    move-object/from16 v0, p2

    invoke-virtual {v3, v5, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v6, "extras_key_marked_as_ads"

    const-string/jumbo v3, "marked_as_ads"

    const/4 v7, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_9

    const/4 v3, 0x1

    :goto_0
    invoke-virtual {v5, v6, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 320
    const-string/jumbo v3, "track_code"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 321
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "extras_key_track_code"

    const-string/jumbo v6, "track_code"

    const-string/jumbo v7, ""

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    :cond_0
    const-string/jumbo v3, "caption"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    .line 325
    .local v15, "caption":Lorg/json/JSONObject;
    if-eqz v15, :cond_1

    .line 326
    const-string/jumbo v3, "type"

    invoke-virtual {v15, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, "text"

    invoke-virtual {v15, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "action_title"

    .line 327
    invoke-virtual {v15, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "action_url"

    invoke-virtual {v15, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 326
    move-object/from16 v0, p0

    invoke-direct {v0, v3, v5, v6, v7}, Lcom/vkontakte/android/NewsEntry;->setCaption(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    :cond_1
    const-string/jumbo v3, "suggest_subscribe"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 331
    const-string/jumbo v3, "suggest_subscribe"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/vkontakte/android/NewsEntry;->setSuggestSubscribe(Z)V

    .line 335
    :cond_2
    :try_start_0
    const-string/jumbo v3, "type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 337
    const-string/jumbo v3, "type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v3, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_3
    :goto_1
    packed-switch v3, :pswitch_data_0

    .line 363
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    shl-int/lit8 v5, v5, 0x18

    or-int/2addr v3, v5

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 364
    const-string/jumbo v3, "from_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d

    const-string/jumbo v3, "from_id"

    :goto_3
    const-string/jumbo v5, "source_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v35

    .line 365
    .local v35, "posterID":I
    move-object/from16 v0, p3

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 366
    move-object/from16 v0, p4

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 368
    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 369
    const-string/jumbo v3, "owner_id"

    const-string/jumbo v5, "to_id"

    const-string/jumbo v6, "source_id"

    move-object/from16 v0, p0

    iget v7, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 371
    const-string/jumbo v3, "text"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 372
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x4

    if-eq v3, v5, :cond_e

    .line 373
    const-string/jumbo v3, "text"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 377
    :goto_4
    const-string/jumbo v3, "copy_comment_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 378
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f08077f

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "copy_owner_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "copy_post_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "\n\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 382
    :cond_5
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0x12

    if-ne v3, v5, :cond_6

    .line 383
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lcom/vkontakte/android/NewsEntry;->parseMarket(Lorg/json/JSONObject;Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/NewsEntry;

    .line 386
    :cond_6
    const-string/jumbo v3, "id"

    const-string/jumbo v5, "post_id"

    const/4 v6, -0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 387
    if-eqz p6, :cond_f

    .line 388
    new-instance v3, Lcom/vkontakte/android/data/PostInteract;

    move-object/from16 v0, p2

    move-object/from16 v1, p0

    move-object/from16 v2, p6

    invoke-direct {v3, v0, v1, v2}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 393
    :goto_5
    const-string/jumbo v3, "attachments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 394
    const-string/jumbo v3, "attachments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    .line 395
    .local v13, "atts":Lorg/json/JSONArray;
    if-eqz v13, :cond_14

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lez v3, :cond_14

    .line 396
    const/16 v19, 0x0

    .line 397
    .local v19, "hasSnippet":Z
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_6
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/16 v5, 0xa

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    move/from16 v0, v20

    if-ge v0, v3, :cond_10

    .line 400
    move/from16 v0, v20

    invoke-virtual {v13, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-static {v3, v0, v1, v2}, Lcom/vkontakte/android/attachments/Attachment;->parse(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v11

    .line 401
    .local v11, "att":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v11, :cond_7

    .line 402
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 404
    :cond_7
    instance-of v3, v11, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v3, :cond_8

    .line 405
    const/16 v19, 0x1

    .line 397
    :cond_8
    add-int/lit8 v20, v20, 0x1

    goto :goto_6

    .line 319
    .end local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v13    # "atts":Lorg/json/JSONArray;
    .end local v15    # "caption":Lorg/json/JSONObject;
    .end local v19    # "hasSnippet":Z
    .end local v20    # "i":I
    .end local v35    # "posterID":I
    :cond_9
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 337
    .restart local v15    # "caption":Lorg/json/JSONObject;
    :sswitch_0
    const-string/jumbo v6, "topic"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v3, 0x0

    goto/16 :goto_1

    :sswitch_1
    const-string/jumbo v6, "video"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v3, 0x1

    goto/16 :goto_1

    :sswitch_2
    const-string/jumbo v6, "note"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v3, 0x2

    goto/16 :goto_1

    :sswitch_3
    const-string/jumbo v6, "photo"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v3, 0x3

    goto/16 :goto_1

    :sswitch_4
    const-string/jumbo v6, "wall_photo"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v3, 0x4

    goto/16 :goto_1

    :sswitch_5
    const-string/jumbo v6, "photo_tag"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v3, 0x5

    goto/16 :goto_1

    :sswitch_6
    const-string/jumbo v6, "market"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v3, 0x6

    goto/16 :goto_1

    .line 339
    :pswitch_0
    const/4 v3, 0x4

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_2

    .line 748
    :catch_0
    move-exception v43

    .line 749
    .local v43, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    move-object/from16 v0, v43

    invoke-static {v3, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 750
    const-string/jumbo v3, "vk"

    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 751
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    if-nez v3, :cond_a

    .line 752
    const-string/jumbo v3, ""

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 754
    :cond_a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0801f9

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {v43 .. v43}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, ": "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 755
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    .line 757
    .end local v43    # "x":Ljava/lang/Exception;
    :cond_b
    :goto_7
    return-void

    .line 342
    :pswitch_1
    const/4 v3, 0x2

    :try_start_1
    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    goto/16 :goto_2

    .line 345
    :pswitch_2
    const/4 v3, 0x3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    goto/16 :goto_2

    .line 348
    :pswitch_3
    const-string/jumbo v3, "photos"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    const/4 v3, 0x6

    :goto_8
    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    goto/16 :goto_2

    :cond_c
    const/4 v3, 0x1

    goto :goto_8

    .line 351
    :pswitch_4
    const-string/jumbo v3, "photos"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 352
    const/16 v3, 0x9

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    goto/16 :goto_2

    .line 356
    :pswitch_5
    const/4 v3, 0x7

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    goto/16 :goto_2

    .line 359
    :pswitch_6
    const/16 v3, 0x12

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    goto/16 :goto_2

    .line 364
    :cond_d
    const-string/jumbo v3, "owner_id"

    goto/16 :goto_3

    .line 375
    .restart local v35    # "posterID":I
    :cond_e
    const-string/jumbo v3, "text"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    goto/16 :goto_4

    .line 390
    :cond_f
    new-instance v3, Lcom/vkontakte/android/data/PostInteract;

    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-direct {v3, v0, v1}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    goto/16 :goto_5

    .line 408
    .restart local v13    # "atts":Lorg/json/JSONArray;
    .restart local v19    # "hasSnippet":Z
    .restart local v20    # "i":I
    :cond_10
    if-eqz v19, :cond_13

    .line 409
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_11
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_13

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/attachments/Attachment;

    .line 410
    .restart local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v11, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-eqz v5, :cond_11

    .line 411
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_12
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_13

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/vkontakte/android/attachments/Attachment;

    .line 412
    .local v12, "att1":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v12, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v5, :cond_12

    .line 413
    move-object v0, v12

    check-cast v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    move-object/from16 v38, v0

    .line 414
    .local v38, "sa":Lcom/vkontakte/android/attachments/SnippetAttachment;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    new-instance v6, Lcom/vkontakte/android/attachments/LinkAttachment;

    move-object/from16 v0, v38

    iget-object v7, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;->link:Ljava/lang/String;

    move-object/from16 v0, v38

    iget-object v8, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;->title:Ljava/lang/String;

    move-object/from16 v0, v38

    iget-object v9, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;->previewPage:Ljava/lang/String;

    invoke-direct {v6, v7, v8, v9}, Lcom/vkontakte/android/attachments/LinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v5, v6}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 422
    .end local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v12    # "att1":Lcom/vkontakte/android/attachments/Attachment;
    .end local v38    # "sa":Lcom/vkontakte/android/attachments/SnippetAttachment;
    :cond_13
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/Attachment;->sort(Ljava/util/List;)V

    .line 429
    .end local v13    # "atts":Lorg/json/JSONArray;
    .end local v19    # "hasSnippet":Z
    .end local v20    # "i":I
    :cond_14
    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_15

    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "count"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_15

    .line 430
    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "count"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 432
    :cond_15
    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_16

    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "can_post"

    const/4 v6, 0x1

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_16

    .line 433
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 435
    :cond_16
    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_17

    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "groups_can_post"

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 436
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    const/high16 v5, 0x20000

    or-int/2addr v3, v5

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 439
    :cond_17
    const-string/jumbo v3, "reposts"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_18

    const-string/jumbo v3, "reposts"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "user_reposted"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_18

    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v3, v5, :cond_18

    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-ne v3, v5, :cond_18

    .line 440
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x4

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 442
    :cond_18
    const-string/jumbo v3, "reposts"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 443
    const-string/jumbo v3, "reposts"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "count"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 445
    :cond_19
    const-string/jumbo v3, "views"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v42

    .line 446
    .local v42, "views":Lorg/json/JSONObject;
    if-eqz v42, :cond_2a

    .line 447
    const-string/jumbo v3, "count"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 451
    :cond_1a
    :goto_9
    const-string/jumbo v3, "likes"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1b

    const-string/jumbo v3, "likes"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "can_publish"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-eq v3, v5, :cond_1c

    :cond_1b
    const-string/jumbo v3, "reposts"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1d

    const-string/jumbo v3, "reposts"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "user_reposted"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_1d

    .line 452
    :cond_1c
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 454
    :cond_1d
    const-string/jumbo v3, "likes"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1e

    const-string/jumbo v3, "likes"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "count"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1e

    .line 455
    const-string/jumbo v3, "likes"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "count"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 457
    :cond_1e
    const-string/jumbo v3, "likes"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1f

    const-string/jumbo v3, "likes"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "user_likes"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_1f

    .line 458
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x8

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 460
    :cond_1f
    const-string/jumbo v3, "can_edit"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_20

    .line 461
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit16 v3, v3, 0x80

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 463
    :cond_20
    const-string/jumbo v3, "can_delete"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_21

    .line 464
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x40

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 466
    :cond_21
    const-string/jumbo v3, "friends_only"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_22

    .line 467
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit16 v3, v3, 0x200

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 469
    :cond_22
    const-string/jumbo v3, "can_pin"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_23

    .line 470
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    const/high16 v5, 0x10000

    or-int/2addr v3, v5

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 472
    :cond_23
    const-string/jumbo v3, "is_pinned"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-eq v3, v5, :cond_24

    const-string/jumbo v3, "fixed"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_25

    .line 473
    :cond_24
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit16 v3, v3, 0x400

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 483
    :cond_25
    const-string/jumbo v3, "post_type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 484
    const-string/jumbo v3, "post_type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 485
    .local v36, "ptype":Ljava/lang/String;
    const-string/jumbo v3, "reply"

    move-object/from16 v0, v36

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 486
    const/4 v3, 0x5

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 487
    const-string/jumbo v3, "post_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 488
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "parent_post"

    const-string/jumbo v6, "post_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 492
    .end local v36    # "ptype":Ljava/lang/String;
    :cond_26
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x1

    if-ne v3, v5, :cond_27

    .line 493
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/attachments/PhotoAttachment;

    new-instance v6, Lcom/vkontakte/android/Photo;

    move-object/from16 v0, p1

    invoke-direct {v6, v0}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 496
    :cond_27
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x2

    if-ne v3, v5, :cond_2d

    .line 497
    const-string/jumbo v3, "video"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v26

    .line 498
    .local v26, "jsonVideo":Lorg/json/JSONObject;
    if-nez v26, :cond_2b

    const/16 v25, 0x0

    .line 499
    .local v25, "jsonArrayItems":Lorg/json/JSONArray;
    :goto_a
    if-eqz v25, :cond_2c

    invoke-virtual/range {v25 .. v25}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lez v3, :cond_2c

    .line 500
    const/16 v3, 0xa

    invoke-virtual/range {v25 .. v25}, Lorg/json/JSONArray;->length()I

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v30

    .line 502
    .local v30, "len":I
    const/16 v20, 0x0

    .restart local v20    # "i":I
    :goto_b
    move/from16 v0, v20

    move/from16 v1, v30

    if-ge v0, v1, :cond_2d

    .line 503
    move-object/from16 v0, v25

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v41

    .line 504
    .local v41, "video":Lorg/json/JSONObject;
    if-eqz v41, :cond_29

    .line 505
    new-instance v40, Lcom/vkontakte/android/api/VideoFile;

    invoke-direct/range {v40 .. v41}, Lcom/vkontakte/android/api/VideoFile;-><init>(Lorg/json/JSONObject;)V

    .line 506
    .local v40, "vf":Lcom/vkontakte/android/api/VideoFile;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, v40

    invoke-direct {v5, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 507
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->comments:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 508
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->likes:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 509
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->reposts:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 510
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 511
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 512
    move-object/from16 v0, v40

    iget-boolean v3, v0, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    if-eqz v3, :cond_28

    .line 513
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 515
    :cond_28
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, v40

    iput-object v3, v0, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    .line 516
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, v40

    iput-object v3, v0, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    .line 502
    .end local v40    # "vf":Lcom/vkontakte/android/api/VideoFile;
    :cond_29
    add-int/lit8 v20, v20, 0x1

    goto :goto_b

    .line 448
    .end local v20    # "i":I
    .end local v25    # "jsonArrayItems":Lorg/json/JSONArray;
    .end local v26    # "jsonVideo":Lorg/json/JSONObject;
    .end local v30    # "len":I
    .end local v41    # "video":Lorg/json/JSONObject;
    :cond_2a
    const-string/jumbo v3, "views"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 449
    const-string/jumbo v3, "views"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    goto/16 :goto_9

    .line 498
    .restart local v26    # "jsonVideo":Lorg/json/JSONObject;
    :cond_2b
    const-string/jumbo v3, "items"

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v25

    goto/16 :goto_a

    .line 520
    .restart local v25    # "jsonArrayItems":Lorg/json/JSONArray;
    :cond_2c
    new-instance v40, Lcom/vkontakte/android/api/VideoFile;

    move-object/from16 v0, v40

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VideoFile;-><init>(Lorg/json/JSONObject;)V

    .line 521
    .restart local v40    # "vf":Lcom/vkontakte/android/api/VideoFile;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, v40

    invoke-direct {v5, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 522
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->comments:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 523
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->likes:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 524
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 525
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 526
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, v40

    iput-object v3, v0, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    .line 527
    move-object/from16 v0, v40

    iget v3, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, v40

    iput-object v3, v0, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    .line 530
    .end local v25    # "jsonArrayItems":Lorg/json/JSONArray;
    .end local v26    # "jsonVideo":Lorg/json/JSONObject;
    .end local v40    # "vf":Lcom/vkontakte/android/api/VideoFile;
    :cond_2d
    const-string/jumbo v3, "geo"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 532
    const-string/jumbo v3, "geo"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v18

    .line 533
    .local v18, "geo":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-static/range {v18 .. v18}, Lcom/vkontakte/android/attachments/Attachment;->parseGeo(Lorg/json/JSONObject;)Lcom/vkontakte/android/attachments/GeoAttachment;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 535
    .end local v18    # "geo":Lorg/json/JSONObject;
    :cond_2e
    if-eqz p5, :cond_32

    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    const/4 v5, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v3, v5}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result v3

    if-eqz v3, :cond_32

    const/16 v17, 0x1

    .line 536
    .local v17, "ff":Z
    :goto_c
    const-string/jumbo v3, "post_source"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 537
    const-string/jumbo v3, "post_source"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v39

    .line 538
    .local v39, "source":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v39

    move/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/NewsEntry;->setInfoFromPostSource(Lorg/json/JSONObject;Z)V

    .line 540
    .end local v39    # "source":Lorg/json/JSONObject;
    :cond_2f
    const-string/jumbo v3, "photos"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_30

    const-string/jumbo v3, "photo_tags"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_35

    .line 541
    :cond_30
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/NewsEntry;->f:Z

    .line 542
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x6

    if-eq v3, v5, :cond_31

    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0x9

    if-ne v3, v5, :cond_33

    :cond_31
    const-string/jumbo v3, "photos"

    :goto_d
    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/vkontakte/android/api/APIUtils;->unwrapArray(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/vkontakte/android/api/JSONArrayWithCount;

    move-result-object v23

    .line 543
    .local v23, "jc":Lcom/vkontakte/android/api/JSONArrayWithCount;
    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/vkontakte/android/api/JSONArrayWithCount;->array:Lorg/json/JSONArray;

    move-object/from16 v33, v0

    .line 549
    .local v33, "ph":Lorg/json/JSONArray;
    move-object/from16 v0, v23

    iget v3, v0, Lcom/vkontakte/android/api/JSONArrayWithCount;->count:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 550
    const/16 v20, 0x0

    .restart local v20    # "i":I
    :goto_e
    invoke-virtual/range {v33 .. v33}, Lorg/json/JSONArray;->length()I

    move-result v3

    move/from16 v0, v20

    if-ge v0, v3, :cond_34

    .line 551
    move-object/from16 v0, v33

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v34

    .line 552
    .local v34, "photo":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/attachments/PhotoAttachment;

    new-instance v6, Lcom/vkontakte/android/Photo;

    move-object/from16 v0, v34

    invoke-direct {v6, v0}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 550
    add-int/lit8 v20, v20, 0x1

    goto :goto_e

    .line 535
    .end local v17    # "ff":Z
    .end local v20    # "i":I
    .end local v23    # "jc":Lcom/vkontakte/android/api/JSONArrayWithCount;
    .end local v33    # "ph":Lorg/json/JSONArray;
    .end local v34    # "photo":Lorg/json/JSONObject;
    :cond_32
    const/16 v17, 0x0

    goto/16 :goto_c

    .line 542
    .restart local v17    # "ff":Z
    :cond_33
    const-string/jumbo v3, "photo_tags"

    goto :goto_d

    .line 554
    .restart local v20    # "i":I
    .restart local v23    # "jc":Lcom/vkontakte/android/api/JSONArrayWithCount;
    .restart local v33    # "ph":Lorg/json/JSONArray;
    :cond_34
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x10

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 556
    .end local v20    # "i":I
    .end local v23    # "jc":Lcom/vkontakte/android/api/JSONArrayWithCount;
    .end local v33    # "ph":Lorg/json/JSONArray;
    :cond_35
    const-string/jumbo v3, "copy_history"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_42

    const-string/jumbo v3, "copy_history"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    if-eqz v3, :cond_42

    const-string/jumbo v3, "copy_history"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lez v3, :cond_42

    .line 557
    const-string/jumbo v3, "copy_history"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v32

    .line 558
    .local v32, "origPost":Lorg/json/JSONObject;
    const-string/jumbo v3, "text"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 559
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    const/4 v5, 0x7

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    invoke-static {v3, v5, v6}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    .line 560
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    if-eqz v3, :cond_36

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_36

    .line 561
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    invoke-static {v3}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    .line 563
    :cond_36
    const-string/jumbo v3, "text"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 564
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    .line 565
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 566
    const-string/jumbo v3, "attachments"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v22

    .line 567
    .local v22, "jatts":Lorg/json/JSONArray;
    if-eqz v22, :cond_3c

    .line 568
    const/16 v19, 0x0

    .line 569
    .restart local v19    # "hasSnippet":Z
    const/16 v20, 0x0

    .restart local v20    # "i":I
    :goto_f
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/16 v5, 0xa

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    move/from16 v0, v20

    if-ge v0, v3, :cond_39

    .line 572
    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-static {v3, v0, v1, v2}, Lcom/vkontakte/android/attachments/Attachment;->parse(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v11

    .line 573
    .restart local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v11, :cond_37

    .line 574
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 576
    :cond_37
    instance-of v3, v11, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v3, :cond_38

    .line 577
    const/16 v19, 0x1

    .line 569
    :cond_38
    add-int/lit8 v20, v20, 0x1

    goto :goto_f

    .line 580
    .end local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_39
    if-eqz v19, :cond_3c

    .line 581
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/attachments/Attachment;

    .line 582
    .restart local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v11, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-eqz v5, :cond_3a

    .line 583
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/vkontakte/android/attachments/Attachment;

    .line 584
    .restart local v12    # "att1":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v12, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v5, :cond_3b

    .line 585
    move-object v0, v12

    check-cast v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    move-object/from16 v38, v0

    .line 586
    .restart local v38    # "sa":Lcom/vkontakte/android/attachments/SnippetAttachment;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    new-instance v6, Lcom/vkontakte/android/attachments/LinkAttachment;

    move-object/from16 v0, v38

    iget-object v7, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;->link:Ljava/lang/String;

    move-object/from16 v0, v38

    iget-object v8, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;->title:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/vkontakte/android/attachments/LinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v5, v6}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 595
    .end local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v12    # "att1":Lcom/vkontakte/android/attachments/Attachment;
    .end local v19    # "hasSnippet":Z
    .end local v20    # "i":I
    .end local v38    # "sa":Lcom/vkontakte/android/attachments/SnippetAttachment;
    :cond_3c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/Attachment;->sort(Ljava/util/List;)V

    .line 596
    const-string/jumbo v3, "geo"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 597
    const-string/jumbo v3, "geo"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v18

    .line 598
    .restart local v18    # "geo":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-static/range {v18 .. v18}, Lcom/vkontakte/android/attachments/Attachment;->parseGeo(Lorg/json/JSONObject;)Lcom/vkontakte/android/attachments/GeoAttachment;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 600
    .end local v18    # "geo":Lorg/json/JSONObject;
    :cond_3d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/Attachment;->sort(Ljava/util/List;)V

    .line 601
    const-string/jumbo v3, "owner_id"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    .line 602
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x20

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 603
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    const-string/jumbo v5, "DELETED"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3, v5}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    .line 604
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    .line 605
    const-string/jumbo v3, "id"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    .line 606
    const-string/jumbo v3, "date"

    const/4 v5, 0x0

    move-object/from16 v0, v32

    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    .line 607
    const-string/jumbo v3, "reply"

    const-string/jumbo v5, "post_type"

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 608
    const/4 v3, 0x5

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    .line 609
    const-string/jumbo v3, "reply_post_id"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    .line 610
    const-string/jumbo v3, "from_id"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v16

    .line 611
    .local v16, "commentUid":I
    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    .line 612
    move-object/from16 v0, p4

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    .line 614
    .end local v16    # "commentUid":I
    :cond_3e
    const-string/jumbo v3, "photo"

    const-string/jumbo v5, "post_type"

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 615
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    .line 617
    :cond_3f
    const-string/jumbo v3, "video"

    const-string/jumbo v5, "post_type"

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_40

    .line 618
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    .line 620
    :cond_40
    const-string/jumbo v3, "copy_history"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/4 v5, 0x1

    if-le v3, v5, :cond_41

    .line 621
    const-string/jumbo v3, "copy_history"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v37

    .line 622
    .local v37, "repost":Lorg/json/JSONObject;
    const-string/jumbo v3, "owner_id"

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 623
    .local v4, "oid":I
    const-string/jumbo v3, "reply"

    const-string/jumbo v5, "post_type"

    move-object/from16 v0, v37

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_44

    .line 624
    const-string/jumbo v3, "from_id"

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v31

    .line 625
    .end local v4    # "oid":I
    .local v31, "oid":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v44, v0

    new-instance v3, Lcom/vkontakte/android/attachments/RepostAttachment;

    const-string/jumbo v5, "owner_id"

    move-object/from16 v0, v37

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string/jumbo v5, "reply_post_id"

    move-object/from16 v0, v37

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    const-string/jumbo v6, "date"

    move-object/from16 v0, v37

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string/jumbo v7, "DELETED"

    move-object/from16 v0, p3

    move/from16 v1, v31

    invoke-virtual {v0, v1, v7}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string/jumbo v8, "http://vk.com/images/question_a.gif"

    move-object/from16 v0, p4

    move/from16 v1, v31

    invoke-virtual {v0, v1, v8}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const/4 v9, 0x5

    invoke-direct/range {v3 .. v9}, Lcom/vkontakte/android/attachments/RepostAttachment;-><init>(IIILjava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, v44

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 645
    .end local v31    # "oid":I
    .end local v37    # "repost":Lorg/json/JSONObject;
    :cond_41
    :goto_10
    const-string/jumbo v3, "post_source"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_42

    .line 646
    const-string/jumbo v3, "post_source"

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v39

    .line 647
    .restart local v39    # "source":Lorg/json/JSONObject;
    if-eqz p5, :cond_45

    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    const/4 v5, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v3, v5}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result v3

    if-eqz v3, :cond_45

    const/4 v3, 0x1

    :goto_11
    move-object/from16 v0, p0

    move-object/from16 v1, v39

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/NewsEntry;->setInfoFromPostSource(Lorg/json/JSONObject;Z)V

    .line 651
    .end local v22    # "jatts":Lorg/json/JSONArray;
    .end local v32    # "origPost":Lorg/json/JSONObject;
    .end local v39    # "source":Lorg/json/JSONObject;
    :cond_42
    const-string/jumbo v3, "date"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 652
    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_48

    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "list"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_48

    .line 653
    const-string/jumbo v3, "comments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "list"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v29

    .line 654
    .local v29, "lca":Lorg/json/JSONArray;
    invoke-virtual/range {v29 .. v29}, Lorg/json/JSONArray;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v28

    .line 655
    .local v28, "lc":Lorg/json/JSONObject;
    const-string/jumbo v3, "text"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 656
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    invoke-static {v3}, Lcom/vkontakte/android/LinkParser;->isMention(Ljava/lang/String;)Z

    move-result v21

    .line 657
    .local v21, "isMention":Z
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x4

    if-ne v3, v5, :cond_46

    .line 658
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    const-string/jumbo v5, "\\[(id|club)(\\d+):bp-(\\d+)_(\\d+)\\|([^\\]]+)\\]"

    const-string/jumbo v6, "$5"

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 662
    :goto_12
    const-string/jumbo v3, "from_id"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserName:Ljava/lang/String;

    .line 663
    const-string/jumbo v3, "from_id"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserPhoto:Ljava/lang/String;

    .line 664
    const-string/jumbo v3, "from_id"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserID:I

    .line 666
    const-string/jumbo v3, "date"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->lastCommentTime:I

    .line 667
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_43

    if-eqz v21, :cond_48

    :cond_43
    const-string/jumbo v3, "attachments"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_48

    .line 668
    const-string/jumbo v3, "attachments"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 669
    .local v10, "aa":Lorg/json/JSONArray;
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lez v3, :cond_48

    .line 670
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 671
    .local v14, "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/16 v20, 0x0

    .restart local v20    # "i":I
    :goto_13
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v3

    move/from16 v0, v20

    if-ge v0, v3, :cond_47

    .line 672
    move/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-static {v3, v0, v1, v2}, Lcom/vkontakte/android/attachments/Attachment;->parse(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 671
    add-int/lit8 v20, v20, 0x1

    goto :goto_13

    .line 627
    .end local v10    # "aa":Lorg/json/JSONArray;
    .end local v14    # "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v20    # "i":I
    .end local v21    # "isMention":Z
    .end local v28    # "lc":Lorg/json/JSONObject;
    .end local v29    # "lca":Lorg/json/JSONArray;
    .restart local v4    # "oid":I
    .restart local v22    # "jatts":Lorg/json/JSONArray;
    .restart local v32    # "origPost":Lorg/json/JSONObject;
    .restart local v37    # "repost":Lorg/json/JSONObject;
    :cond_44
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v44, v0

    new-instance v3, Lcom/vkontakte/android/attachments/RepostAttachment;

    const-string/jumbo v5, "id"

    move-object/from16 v0, v37

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    const-string/jumbo v6, "date"

    move-object/from16 v0, v37

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string/jumbo v7, "DELETED"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4, v7}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string/jumbo v8, "http://vk.com/images/question_a.gif"

    move-object/from16 v0, p4

    invoke-virtual {v0, v4, v8}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const/4 v9, 0x0

    invoke-direct/range {v3 .. v9}, Lcom/vkontakte/android/attachments/RepostAttachment;-><init>(IIILjava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, v44

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_10

    .line 647
    .end local v4    # "oid":I
    .end local v37    # "repost":Lorg/json/JSONObject;
    .restart local v39    # "source":Lorg/json/JSONObject;
    :cond_45
    const/4 v3, 0x0

    goto/16 :goto_11

    .line 660
    .end local v22    # "jatts":Lorg/json/JSONArray;
    .end local v32    # "origPost":Lorg/json/JSONObject;
    .end local v39    # "source":Lorg/json/JSONObject;
    .restart local v21    # "isMention":Z
    .restart local v28    # "lc":Lorg/json/JSONObject;
    .restart local v29    # "lca":Lorg/json/JSONArray;
    :cond_46
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    const-string/jumbo v5, "\\[(id|club)(\\d+)\\|([^\\]]+)\\]"

    const-string/jumbo v6, "$3"

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    goto/16 :goto_12

    .line 674
    .restart local v10    # "aa":Lorg/json/JSONArray;
    .restart local v14    # "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .restart local v20    # "i":I
    :cond_47
    if-eqz v21, :cond_55

    .line 675
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v14}, Lcom/vkontakte/android/attachments/Attachment;->getLocalizedDescription(Ljava/util/List;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 683
    .end local v10    # "aa":Lorg/json/JSONArray;
    .end local v14    # "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v20    # "i":I
    .end local v21    # "isMention":Z
    .end local v28    # "lc":Lorg/json/JSONObject;
    .end local v29    # "lca":Lorg/json/JSONArray;
    :cond_48
    :goto_14
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/NewsEntry;->layoutThumbs()V

    .line 686
    const-string/jumbo v3, "signer_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_49

    .line 687
    new-instance v27, Lcom/vkontakte/android/attachments/SignatureLinkAttachment;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "https://vkontakte.ru/id"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "signer_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v3, "signer_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, v27

    invoke-direct {v0, v5, v3}, Lcom/vkontakte/android/attachments/SignatureLinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 688
    .local v27, "la":Lcom/vkontakte/android/attachments/SignatureLinkAttachment;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 691
    .end local v27    # "la":Lcom/vkontakte/android/attachments/SignatureLinkAttachment;
    :cond_49
    const-string/jumbo v3, "final_post"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_4a

    .line 692
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    const v5, 0x8000

    or-int/2addr v3, v5

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 695
    :cond_4a
    const-string/jumbo v3, "reply_owner_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 696
    new-instance v27, Lcom/vkontakte/android/attachments/LinkAttachment;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "https://vkontakte.ru/wall"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "reply_owner_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "reply_post_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f080786

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, ""

    move-object/from16 v0, v27

    invoke-direct {v0, v3, v5, v6}, Lcom/vkontakte/android/attachments/LinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 697
    .local v27, "la":Lcom/vkontakte/android/attachments/LinkAttachment;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 700
    .end local v27    # "la":Lcom/vkontakte/android/attachments/LinkAttachment;
    :cond_4b
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v3, :cond_4f

    .line 701
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v3, v3

    invoke-static {v3}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v3

    const/4 v5, 0x1

    if-lt v3, v5, :cond_4c

    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-gtz v3, :cond_4d

    :cond_4c
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v3, v3

    invoke-static {v3}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v3

    const/4 v5, 0x2

    if-lt v3, v5, :cond_4e

    .line 702
    :cond_4d
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x40

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 704
    :cond_4e
    const-string/jumbo v3, "created_by"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->createdBy:I

    .line 706
    :cond_4f
    const-string/jumbo v3, "postpone"

    const-string/jumbo v5, "post_type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_51

    .line 707
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit16 v3, v3, 0x800

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 708
    const-string/jumbo v3, "twitter_export"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_50

    .line 709
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit16 v3, v3, 0x2000

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 711
    :cond_50
    const-string/jumbo v3, "facebook_export"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_51

    .line 712
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit16 v3, v3, 0x4000

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 715
    :cond_51
    const-string/jumbo v3, "suggest"

    const-string/jumbo v5, "post_type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_52

    .line 716
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit16 v3, v3, 0x1000

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 719
    :cond_52
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x6

    if-ne v3, v5, :cond_53

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_53

    .line 720
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Lcom/vkontakte/android/attachments/PhotoAttachment;

    .line 721
    .local v34, "photo":Lcom/vkontakte/android/attachments/PhotoAttachment;
    move-object/from16 v0, v34

    iget v3, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;->pid:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 722
    move-object/from16 v0, v34

    iget v3, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;->oid:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 723
    const/16 v3, 0x10

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v5}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 724
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;->descr:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 725
    const-string/jumbo v3, "photos"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "items"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v24

    .line 726
    .local v24, "jphoto":Lorg/json/JSONObject;
    const-string/jumbo v3, "likes"

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "count"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 727
    const/16 v5, 0x8

    const-string/jumbo v3, "likes"

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v6, "user_likes"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    const/4 v6, 0x1

    if-ne v3, v6, :cond_56

    const/4 v3, 0x1

    :goto_15
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v3}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 728
    const-string/jumbo v3, "comments"

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v5, "count"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 729
    const/4 v5, 0x2

    const-string/jumbo v3, "can_comment"

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    const/4 v6, 0x1

    if-ne v3, v6, :cond_57

    const/4 v3, 0x1

    :goto_16
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v3}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 730
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "converted_to_photo"

    const/4 v6, 0x1

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 731
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "orig_type"

    move-object/from16 v0, p0

    iget v6, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 732
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 735
    .end local v24    # "jphoto":Lorg/json/JSONObject;
    .end local v34    # "photo":Lcom/vkontakte/android/attachments/PhotoAttachment;
    :cond_53
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    if-eqz v3, :cond_54

    .line 736
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x4

    if-ne v3, v5, :cond_58

    .line 737
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f08020e

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " <a href=\'http://vk.com\'>"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "</a>"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    check-cast v3, Landroid/text/Spannable;

    invoke-static {v3}, Lcom/vkontakte/android/NewsEntry;->stripUnderlines(Landroid/text/Spannable;)Landroid/text/Spannable;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    .line 738
    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x10

    move-object/from16 v0, p0

    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 745
    :cond_54
    :goto_17
    const-string/jumbo v3, "activity"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 746
    const-string/jumbo v3, "activity"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-static {v3, v0, v1}, Lcom/vkontakte/android/NewsEntry$Activity;->parse(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/NewsEntry$Activity;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    goto/16 :goto_7

    .line 677
    .restart local v10    # "aa":Lorg/json/JSONArray;
    .restart local v14    # "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .restart local v20    # "i":I
    .restart local v21    # "isMention":Z
    .restart local v28    # "lc":Lorg/json/JSONObject;
    .restart local v29    # "lca":Lorg/json/JSONArray;
    :cond_55
    invoke-static {v14}, Lcom/vkontakte/android/attachments/Attachment;->getLocalizedDescription(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    goto/16 :goto_14

    .line 727
    .end local v10    # "aa":Lorg/json/JSONArray;
    .end local v14    # "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v20    # "i":I
    .end local v21    # "isMention":Z
    .end local v28    # "lc":Lorg/json/JSONObject;
    .end local v29    # "lca":Lorg/json/JSONArray;
    .restart local v24    # "jphoto":Lorg/json/JSONObject;
    .restart local v34    # "photo":Lcom/vkontakte/android/attachments/PhotoAttachment;
    :cond_56
    const/4 v3, 0x0

    goto/16 :goto_15

    .line 729
    :cond_57
    const/4 v3, 0x0

    goto/16 :goto_16

    .line 740
    .end local v24    # "jphoto":Lorg/json/JSONObject;
    .end local v34    # "photo":Lcom/vkontakte/android/attachments/PhotoAttachment;
    :cond_58
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    const/4 v5, 0x7

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 741
    invoke-static {v3, v5, v6}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v3

    .line 740
    invoke-static {v3}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_17

    .line 337
    :sswitch_data_0
    .sparse-switch
        -0x7756cc83 -> :sswitch_4
        -0x40736bc4 -> :sswitch_6
        -0x32863bf3 -> :sswitch_5
        0x33aff2 -> :sswitch_2
        0x65b3e32 -> :sswitch_3
        0x696cd2f -> :sswitch_0
        0x6b0147b -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private deserializeActivity([B)V
    .locals 4
    .param p1, "b"    # [B

    .prologue
    .line 1450
    if-eqz p1, :cond_0

    .line 1451
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1452
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1454
    .local v1, "is":Ljava/io/DataInputStream;
    :try_start_0
    invoke-static {v1}, Lcom/vkontakte/android/NewsEntry$Activity;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/NewsEntry$Activity;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1459
    .end local v0    # "buf":Ljava/io/ByteArrayInputStream;
    .end local v1    # "is":Ljava/io/DataInputStream;
    :cond_0
    :goto_0
    return-void

    .line 1455
    .restart local v0    # "buf":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "is":Ljava/io/DataInputStream;
    :catch_0
    move-exception v2

    .line 1456
    .local v2, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    invoke-static {v3, v2}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private deserializeAttachments([B)V
    .locals 7
    .param p1, "b"    # [B

    .prologue
    .line 1429
    if-nez p1, :cond_1

    .line 1447
    :cond_0
    :goto_0
    return-void

    .line 1433
    :cond_1
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1434
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    new-instance v3, Ljava/io/DataInputStream;

    invoke-direct {v3, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1436
    .local v3, "is":Ljava/io/DataInputStream;
    :try_start_0
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 1437
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v1, :cond_2

    .line 1438
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/Attachment;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1437
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1440
    :cond_2
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 1441
    const/4 v2, 0x0

    :goto_2
    if-ge v2, v1, :cond_0

    .line 1442
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/Attachment;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1441
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1444
    .end local v1    # "count":I
    .end local v2    # "i":I
    :catch_0
    move-exception v4

    .line 1445
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private deserializeExtras(Ljava/lang/String;)V
    .locals 7
    .param p1, "xtra"    # Ljava/lang/String;

    .prologue
    .line 1156
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 1158
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1159
    .local v3, "obj":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 1160
    .local v1, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1161
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1162
    .local v0, "k":Ljava/lang/String;
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 1163
    .local v2, "o":Ljava/lang/Object;
    instance-of v5, v2, Ljava/lang/Integer;

    if-eqz v5, :cond_1

    .line 1164
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v5, v0, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1173
    .end local v0    # "k":Ljava/lang/String;
    .end local v1    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v3    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v4

    .line 1174
    .local v4, "x":Lorg/json/JSONException;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1177
    .end local v4    # "x":Lorg/json/JSONException;
    :cond_0
    return-void

    .line 1165
    .restart local v0    # "k":Ljava/lang/String;
    .restart local v1    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v2    # "o":Ljava/lang/Object;
    .restart local v3    # "obj":Lorg/json/JSONObject;
    :cond_1
    :try_start_1
    instance-of v5, v2, Ljava/lang/Boolean;

    if-eqz v5, :cond_2

    .line 1166
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    check-cast v2, Ljava/lang/Boolean;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v5, v0, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 1167
    .restart local v2    # "o":Ljava/lang/Object;
    :cond_2
    instance-of v5, v2, Lorg/json/JSONObject;

    if-eqz v5, :cond_3

    .line 1168
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    check-cast v2, Lorg/json/JSONObject;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-static {v2}, Lcom/vkontakte/android/utils/JSONSerializable$Factory;->from(Lorg/json/JSONObject;)Lcom/vkontakte/android/utils/JSONSerializable;

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_0

    .line 1170
    .restart local v2    # "o":Ljava/lang/Object;
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    check-cast v2, Ljava/lang/String;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-virtual {v5, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private static ell(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "lim"    # I

    .prologue
    .line 1677
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 1678
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1680
    .end local p0    # "s":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public static getMaxThumbsWidth()I
    .locals 6

    .prologue
    .line 1622
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 1624
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    const/4 v2, 0x0

    .line 1625
    .local v2, "tSize":I
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x11

    if-lt v4, v5, :cond_0

    .line 1626
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 1627
    .local v1, "p":Landroid/graphics/Point;
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v5, "window"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    .line 1628
    .local v3, "wm":Landroid/view/WindowManager;
    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 1629
    iget v4, v1, Landroid/graphics/Point;->x:I

    iget v5, v1, Landroid/graphics/Point;->y:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1633
    .end local v1    # "p":Landroid/graphics/Point;
    .end local v3    # "wm":Landroid/view/WindowManager;
    :goto_0
    invoke-static {}, Lcom/vk/core/util/Screen;->isTablet()Z

    move-result v4

    if-eqz v4, :cond_1

    const/high16 v4, 0x42a80000    # 84.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    :goto_1
    sub-int/2addr v2, v4

    .line 1634
    const/high16 v4, 0x44200000    # 640.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    return v4

    .line 1631
    :cond_0
    iget v4, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v5, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    goto :goto_0

    .line 1633
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public static isTypeAd(I)Z
    .locals 1
    .param p0, "type"    # I

    .prologue
    .line 193
    const/16 v0, 0xb

    if-eq p0, v0, :cond_0

    const/16 v0, 0xc

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static layoutThumbs(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1653
    .local p0, "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_1

    .line 1674
    :cond_0
    return-void

    .line 1656
    :cond_1
    const/4 v1, 0x0

    .local v1, "hasAnyThumbs":Z
    const/4 v2, 0x0

    .line 1657
    .local v2, "hasSnippets":Z
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1658
    .local v0, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v0, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-eqz v5, :cond_3

    .line 1659
    const/4 v1, 0x1

    .line 1661
    :cond_3
    instance-of v5, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v5, :cond_2

    .line 1662
    const/4 v2, 0x1

    goto :goto_0

    .line 1665
    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_4
    invoke-static {}, Lcom/vkontakte/android/NewsEntry;->getMaxThumbsWidth()I

    move-result v3

    .line 1666
    .local v3, "tSize":I
    invoke-static {v3, v3, p0}, Lcom/vkontakte/android/ZhukovLayout;->processThumbs(IILjava/util/List;)V

    .line 1667
    if-nez v1, :cond_5

    if-eqz v2, :cond_0

    .line 1668
    :cond_5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_6
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1669
    .restart local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v5, :cond_6

    .line 1670
    check-cast v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    const/4 v5, 0x1

    iput v5, v0, Lcom/vkontakte/android/attachments/GeoAttachment;->style:I

    goto :goto_1
.end method

.method private loadExtras()V
    .locals 5

    .prologue
    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "captionType"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "captionText"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v3, "captionActionText"

    .line 251
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "captionActionUrl"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 250
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/vkontakte/android/NewsEntry;->setCaption(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "suggest_subscribe"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 253
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "suggest_subscribe"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/NewsEntry;->setSuggestSubscribe(Z)V

    .line 256
    :cond_0
    return-void
.end method

.method public static parseAd(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;Ljava/util/Vector;Ljava/lang/String;)Lcom/vkontakte/android/NewsEntry;
    .locals 8
    .param p0, "obj"    # Lorg/json/JSONObject;
    .param p3, "userSex"    # Landroid/util/SparseBooleanArray;
    .param p5, "listRefer"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseBooleanArray;",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/vkontakte/android/NewsEntry;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "userNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p2, "userPhotos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p4, "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 899
    const-string/jumbo v3, "ads"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 900
    .local v1, "o":Lorg/json/JSONObject;
    const-string/jumbo v3, "type"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 901
    const-string/jumbo v2, "vk"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 913
    :goto_0
    return-object v0

    .line 904
    :cond_0
    const-string/jumbo v3, "type"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v3, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_1
    move v2, v3

    :goto_1
    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 909
    :pswitch_0
    invoke-static {p0}, Lcom/vkontakte/android/NewsEntry;->parseAdApp(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    goto :goto_0

    .line 904
    :sswitch_0
    const-string/jumbo v5, "site"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :sswitch_1
    const-string/jumbo v2, "app"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :sswitch_2
    const-string/jumbo v2, "app_video"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x2

    goto :goto_1

    :sswitch_3
    const-string/jumbo v2, "app_slider"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x3

    goto :goto_1

    :sswitch_4
    const-string/jumbo v2, "post"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x4

    goto :goto_1

    .line 911
    :pswitch_1
    const-string/jumbo v0, "post"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-static/range {v0 .. v7}, Lcom/vkontakte/android/NewsEntry;->parseAdPost(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;Ljava/util/Vector;Ljava/lang/String;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    goto :goto_0

    .line 904
    :sswitch_data_0
    .sparse-switch
        0x17a21 -> :sswitch_1
        0x3498a0 -> :sswitch_4
        0x35df47 -> :sswitch_0
        0x4c1884bf -> :sswitch_3
        0x6df814dd -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static parseAdApp(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;
    .locals 14
    .param p0, "obj"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 962
    const-string/jumbo v0, "ads_id1"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 963
    .local v6, "adsId1":I
    const-string/jumbo v0, "ads_id2"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    .line 965
    .local v7, "adsId2":I
    new-instance v11, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v11}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 966
    .local v11, "e":Lcom/vkontakte/android/NewsEntry;
    const/16 v0, 0xb

    iput v0, v11, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 967
    iput v6, v11, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 968
    iput v7, v11, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 969
    iget-object v0, v11, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "ads_title"

    const-string/jumbo v3, "ads_title"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 971
    const-string/jumbo v0, "ads_debug"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 972
    iget-object v0, v11, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "ads_debug"

    const-string/jumbo v3, "ads_debug"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 975
    :cond_0
    const-string/jumbo v0, "ads"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 976
    .local v10, "ads":Lorg/json/JSONArray;
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_0
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v12, v0, :cond_8

    .line 977
    invoke-virtual {v10, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    .line 978
    .local v13, "o":Lorg/json/JSONObject;
    new-instance v9, Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-direct {v9}, Lcom/vkontakte/android/attachments/ShitAttachment;-><init>()V

    .line 979
    .local v9, "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->guid:Ljava/lang/String;

    .line 980
    iget-object v0, v11, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "age_restriction"

    const-string/jumbo v3, "age_restriction"

    invoke-virtual {v13, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 982
    const-string/jumbo v0, "description"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->text:Ljava/lang/String;

    .line 983
    sget v0, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_4

    const-string/jumbo v0, "photo_100"

    :goto_1
    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->userPhoto:Ljava/lang/String;

    .line 984
    const-string/jumbo v0, "title"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->userName:Ljava/lang/String;

    .line 985
    const-string/jumbo v0, "genre"

    const-string/jumbo v1, "domain"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->genre:Ljava/lang/String;

    .line 986
    const-string/jumbo v0, "time_to_live"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->timeToLive:I

    .line 987
    iget v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->timeToLive:I

    if-eqz v0, :cond_1

    iget v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->timeToLive:I

    const v1, 0x278d00

    if-ge v0, v1, :cond_1

    .line 988
    iget v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->timeToLive:I

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->timeToLive:I

    .line 991
    :cond_1
    const-string/jumbo v0, "cards"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 992
    const-string/jumbo v0, "cards"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {v0, v6, v7}, Lcom/vkontakte/android/NewsEntry;->parseCards(Lorg/json/JSONArray;II)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    .line 999
    :goto_2
    const-string/jumbo v0, "age_restriction"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->ageRestriction:Ljava/lang/String;

    .line 1000
    const-string/jumbo v0, "button"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonText:Ljava/lang/String;

    .line 1001
    const-string/jumbo v0, "followers"

    const-string/jumbo v1, "site_description"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->followers:Ljava/lang/String;

    .line 1002
    const-string/jumbo v0, "link_url"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->link:Ljava/lang/String;

    .line 1003
    invoke-static {v13}, Lcom/vkontakte/android/NewsEntry;->parseLinkUrlTarget(Lorg/json/JSONObject;)I

    move-result v0

    iput v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->linkTarget:I

    .line 1004
    const-string/jumbo v0, "rating"

    const-wide/16 v4, 0x0

    invoke-virtual {v13, v0, v4, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->rating:F

    .line 1005
    const-string/jumbo v0, "button_open"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->buttonTextInstalled:Ljava/lang/String;

    .line 1006
    const-string/jumbo v0, "ad_data"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    .line 1007
    new-instance v3, Lcom/vkontakte/android/statistics/StatisticUrl;

    const-string/jumbo v0, "ad_data_impression"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "impression"

    const/4 v8, -0x1

    invoke-direct/range {v3 .. v9}, Lcom/vkontakte/android/statistics/StatisticUrl;-><init>(Ljava/lang/String;Ljava/lang/String;IIILcom/vkontakte/android/statistics/Statistic;)V

    iput-object v3, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->dataImpression:Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 1008
    const-string/jumbo v0, "android_app"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1009
    const-string/jumbo v0, "android_app"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "app_id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->appPackage:Ljava/lang/String;

    .line 1010
    const-string/jumbo v0, "android_app"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "open_url"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->deepLink:Ljava/lang/String;

    .line 1012
    :cond_2
    if-nez v12, :cond_3

    .line 1013
    const-string/jumbo v0, "ads_statistics"

    invoke-static {p0, v0, v9, v6, v7}, Lcom/vkontakte/android/NewsEntry;->parseStatistics(Lorg/json/JSONObject;Ljava/lang/String;Lcom/vkontakte/android/statistics/Statistic;II)V

    .line 1015
    :cond_3
    const-string/jumbo v0, "statistics"

    invoke-static {v13, v0, v9, v6, v7}, Lcom/vkontakte/android/NewsEntry;->parseStatistics(Lorg/json/JSONObject;Ljava/lang/String;Lcom/vkontakte/android/statistics/Statistic;II)V

    .line 1017
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object v9, v0, v2

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 1018
    iget-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->text:Ljava/lang/String;

    if-nez v0, :cond_7

    const-string/jumbo v0, ""

    :goto_3
    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->text:Ljava/lang/String;

    .line 1020
    iget-object v0, v11, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 976
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 983
    :cond_4
    const-string/jumbo v0, "photo_50"

    goto/16 :goto_1

    .line 993
    :cond_5
    const-string/jumbo v0, "video"

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 994
    new-instance v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    new-instance v1, Lcom/vkontakte/android/api/VideoFile;

    const-string/jumbo v3, "video"

    invoke-virtual {v13, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/vkontakte/android/api/VideoFile;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    goto/16 :goto_2

    .line 996
    :cond_6
    new-instance v0, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-static {v13}, Lcom/vkontakte/android/NewsEntry;->parseAdImages(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v1

    const-string/jumbo v5, ""

    move v3, v2

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Ljava/util/HashMap;IIILjava/lang/String;)V

    iput-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    goto/16 :goto_2

    .line 1018
    :cond_7
    iget-object v0, v9, Lcom/vkontakte/android/attachments/ShitAttachment;->text:Ljava/lang/String;

    goto :goto_3

    .line 1023
    .end local v9    # "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    .end local v13    # "o":Lorg/json/JSONObject;
    :cond_8
    return-object v11
.end method

.method private static parseAdImages(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 7
    .param p0, "o"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/attachments/PhotoAttachment$Image;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1063
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1064
    .local v1, "images":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/attachments/PhotoAttachment$Image;>;"
    const-string/jumbo v5, "photo_main"

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 1065
    .local v4, "sizes":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v0, v5, :cond_0

    .line 1066
    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 1067
    .local v3, "ji":Lorg/json/JSONObject;
    new-instance v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    invoke-direct {v2}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>()V

    .line 1068
    .local v2, "img":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    const-string/jumbo v5, "width"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    .line 1069
    const-string/jumbo v5, "height"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    .line 1070
    const-string/jumbo v5, "type"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    iput-char v5, v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->type:C

    .line 1071
    const-string/jumbo v5, "src"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    .line 1072
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-char v6, v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->type:C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1065
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1074
    .end local v2    # "img":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    .end local v3    # "ji":Lorg/json/JSONObject;
    :cond_0
    return-object v1
.end method

.method private static parseAdPost(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;Ljava/util/Vector;Ljava/lang/String;)Lcom/vkontakte/android/NewsEntry;
    .locals 15
    .param p0, "obj"    # Lorg/json/JSONObject;
    .param p1, "oAd"    # Lorg/json/JSONObject;
    .param p2, "o"    # Lorg/json/JSONObject;
    .param p5, "userSex"    # Landroid/util/SparseBooleanArray;
    .param p7, "listRefer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lorg/json/JSONObject;",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseBooleanArray;",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/vkontakte/android/NewsEntry;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 925
    .local p3, "userNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p4, "userPhotos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p6, "adminGroups":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/Integer;>;"
    const-string/jumbo v1, "ads_id1"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    .line 926
    .local v4, "adsId1":I
    const-string/jumbo v1, "ads_id2"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    .line 928
    .local v5, "adsId2":I
    new-instance v7, Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-direct {v7}, Lcom/vkontakte/android/attachments/ShitAttachment;-><init>()V

    .line 929
    .local v7, "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    const-string/jumbo v1, "ad_data"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v7, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    .line 930
    new-instance v1, Lcom/vkontakte/android/statistics/StatisticUrl;

    const-string/jumbo v2, "ad_data_impression"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "impression"

    const/4 v6, -0x1

    invoke-direct/range {v1 .. v7}, Lcom/vkontakte/android/statistics/StatisticUrl;-><init>(Ljava/lang/String;Ljava/lang/String;IIILcom/vkontakte/android/statistics/Statistic;)V

    iput-object v1, v7, Lcom/vkontakte/android/attachments/ShitAttachment;->dataImpression:Lcom/vkontakte/android/statistics/StatisticUrl;

    .line 931
    const-string/jumbo v1, "ads_statistics"

    invoke-static {p0, v1, v7, v4, v5}, Lcom/vkontakte/android/NewsEntry;->parseStatistics(Lorg/json/JSONObject;Ljava/lang/String;Lcom/vkontakte/android/statistics/Statistic;II)V

    .line 932
    const-string/jumbo v1, "statistics"

    move-object/from16 v0, p1

    invoke-static {v0, v1, v7, v4, v5}, Lcom/vkontakte/android/NewsEntry;->parseStatistics(Lorg/json/JSONObject;Ljava/lang/String;Lcom/vkontakte/android/statistics/Statistic;II)V

    .line 934
    new-instance v8, Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v9, p2

    move-object/from16 v10, p7

    move-object/from16 v11, p3

    move-object/from16 v12, p4

    move-object/from16 v13, p5

    move-object v14, v7

    invoke-direct/range {v8 .. v14}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 935
    .local v8, "e":Lcom/vkontakte/android/NewsEntry;
    iget-object v1, v8, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "ads_title"

    const-string/jumbo v3, "ads_title"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 936
    iget-object v1, v8, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "age_restriction"

    const-string/jumbo v3, "age_restriction"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 937
    iget v1, v8, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v1, :cond_0

    iget v1, v8, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p6

    invoke-virtual {v0, v1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 938
    iget v1, v8, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v1, v1, 0x40

    iput v1, v8, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 940
    :cond_0
    const/16 v1, 0xc

    iput v1, v8, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 942
    const-string/jumbo v1, "time_to_live"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v8, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    .line 943
    iget v1, v8, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    if-eqz v1, :cond_1

    iget v1, v8, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    const v2, 0x278d00

    if-ge v1, v2, :cond_1

    .line 944
    iget v1, v8, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v8, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    .line 946
    :cond_1
    const-string/jumbo v1, "ads_debug"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 947
    iget-object v1, v8, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "ads_debug"

    const-string/jumbo v3, "ads_debug"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 950
    :cond_2
    iget-object v1, v8, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 951
    iget-object v1, v8, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v1, :cond_3

    .line 952
    iget-object v1, v8, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    const-string/jumbo v2, "click_post_link"

    invoke-virtual {v7, v2}, Lcom/vkontakte/android/attachments/ShitAttachment;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->setClickPostLinks(Ljava/util/List;)V

    .line 955
    :cond_3
    iget-object v1, v8, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "extras_key_ads_1"

    invoke-virtual {v1, v2, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 956
    iget-object v1, v8, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "extras_key_ads_2"

    invoke-virtual {v1, v2, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 958
    return-object v8
.end method

.method private static parseCards(Lorg/json/JSONArray;II)Ljava/util/ArrayList;
    .locals 10
    .param p0, "array"    # Lorg/json/JSONArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "adsId1"    # I
    .param p2, "adsId2"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "II)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/ShitAttachment$Card;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1039
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1040
    .local v7, "cards":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/ShitAttachment$Card;>;"
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v8, v0, :cond_1

    .line 1041
    invoke-virtual {p0, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 1042
    .local v9, "o":Lorg/json/JSONObject;
    new-instance v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    invoke-direct {v6}, Lcom/vkontakte/android/attachments/ShitAttachment$Card;-><init>()V

    .line 1043
    .local v6, "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    const-string/jumbo v0, "link_url"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->link:Ljava/lang/String;

    .line 1044
    const-string/jumbo v0, "title"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->title:Ljava/lang/String;

    .line 1045
    const-string/jumbo v0, "description"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->description:Ljava/lang/String;

    .line 1046
    const-string/jumbo v0, "followers"

    const-string/jumbo v1, "site_description"

    invoke-virtual {v9, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->followers:Ljava/lang/String;

    .line 1047
    const-string/jumbo v0, "rating"

    const-wide/16 v4, 0x0

    invoke-virtual {v9, v0, v4, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->rating:F

    .line 1048
    const-string/jumbo v0, "button"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->buttonText:Ljava/lang/String;

    .line 1049
    const-string/jumbo v0, "button_open"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->buttonTextInstalled:Ljava/lang/String;

    .line 1050
    invoke-static {v9}, Lcom/vkontakte/android/NewsEntry;->parseLinkUrlTarget(Lorg/json/JSONObject;)I

    move-result v0

    iput v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->linkTarget:I

    .line 1051
    new-instance v0, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-static {v9}, Lcom/vkontakte/android/NewsEntry;->parseAdImages(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v1

    const-string/jumbo v5, ""

    move v3, v2

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Ljava/util/HashMap;IIILjava/lang/String;)V

    iput-object v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    .line 1052
    const-string/jumbo v0, "android_app"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1053
    const-string/jumbo v0, "android_app"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "app_id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->appPackage:Ljava/lang/String;

    .line 1054
    const-string/jumbo v0, "android_app"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string/jumbo v1, "open_url"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->deepLink:Ljava/lang/String;

    .line 1056
    :cond_0
    const-string/jumbo v0, "statistics"

    invoke-static {v9, v0, v6, p1, p2}, Lcom/vkontakte/android/NewsEntry;->parseStatistics(Lorg/json/JSONObject;Ljava/lang/String;Lcom/vkontakte/android/statistics/Statistic;II)V

    .line 1057
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1040
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    .line 1059
    .end local v6    # "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    .end local v9    # "o":Lorg/json/JSONObject;
    :cond_1
    return-object v7
.end method

.method public static parseFriendsRecomm(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;
    .locals 7
    .param p0, "obj"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 864
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 865
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    const v4, 0x77359400

    iput v4, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 866
    new-instance v4, Ljava/util/Random;

    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    move-result v4

    iput v4, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 867
    const/16 v4, 0xd

    iput v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 868
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 869
    .local v3, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v4, "profiles"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 870
    .local v2, "ja":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 871
    new-instance v4, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 870
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 873
    :cond_0
    const-string/jumbo v4, "date"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 874
    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    const-string/jumbo v6, "next_from"

    invoke-virtual {p0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v3, v6}, Lcom/vkontakte/android/attachments/FriendsRecommAttachment;-><init>(Ljava/util/ArrayList;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 875
    return-object v0
.end method

.method public static parseLinkUrlTarget(Lorg/json/JSONObject;)I
    .locals 6
    .param p0, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x2

    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 1027
    const-string/jumbo v3, "link_url_target"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v3, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v3, :pswitch_data_0

    move v0, v2

    .line 1034
    :goto_1
    :pswitch_0
    return v0

    .line 1027
    :sswitch_0
    const-string/jumbo v5, "internal_hidden"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v3, v2

    goto :goto_0

    :sswitch_1
    const-string/jumbo v5, "internal"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v3, v0

    goto :goto_0

    :sswitch_2
    const-string/jumbo v5, "external"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v3, v1

    goto :goto_0

    :pswitch_1
    move v0, v1

    .line 1031
    goto :goto_1

    .line 1027
    :sswitch_data_0
    .sparse-switch
        -0x6c869c35 -> :sswitch_2
        -0x5c0dca94 -> :sswitch_0
        0x21ffc6bd -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static parseMarket(Lorg/json/JSONObject;Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/NewsEntry;
    .locals 3
    .param p0, "market"    # Lorg/json/JSONObject;
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 831
    if-nez p1, :cond_0

    new-instance p1, Lcom/vkontakte/android/NewsEntry;

    .end local p1    # "e":Lcom/vkontakte/android/NewsEntry;
    invoke-direct {p1}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 832
    .restart local p1    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_0
    const/16 v1, 0x12

    iput v1, p1, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 833
    new-instance v0, Lcom/vkontakte/android/data/Good;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/data/Good;-><init>(Lorg/json/JSONObject;)V

    .line 834
    .local v0, "good":Lcom/vkontakte/android/data/Good;
    iget v1, v0, Lcom/vkontakte/android/data/Good;->id:I

    iput v1, p1, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 835
    iget v1, v0, Lcom/vkontakte/android/data/Good;->owner_id:I

    iput v1, p1, Lcom/vkontakte/android/NewsEntry;->userID:I

    iput v1, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 836
    iget v1, v0, Lcom/vkontakte/android/data/Good;->date:I

    iput v1, p1, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 837
    iget-object v1, p1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v2, Lcom/vkontakte/android/attachments/MarketAttachment;

    invoke-direct {v2, v0}, Lcom/vkontakte/android/attachments/MarketAttachment;-><init>(Lcom/vkontakte/android/data/Good;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 838
    iget-object v1, v0, Lcom/vkontakte/android/data/Good;->title:Ljava/lang/String;

    iput-object v1, p1, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    .line 839
    return-object p1
.end method

.method public static parsePhoto(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;
    .locals 4
    .param p0, "photo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 813
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 814
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    iput v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 815
    const-string/jumbo v1, "id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "id"

    :goto_0
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 816
    const-string/jumbo v1, "owner_id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 817
    const-string/jumbo v1, "text"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 818
    const-string/jumbo v1, "date"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 819
    const-string/jumbo v1, "likes"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 820
    const-string/jumbo v1, "likes"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "count"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 821
    const-string/jumbo v1, "likes"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "user_likes"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v3, :cond_0

    .line 822
    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v1, v1, 0x8

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 825
    :cond_0
    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v1, v1, 0x2

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 826
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v2, Lcom/vkontakte/android/attachments/PhotoAttachment;

    new-instance v3, Lcom/vkontakte/android/Photo;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {v2, v3}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 827
    return-object v0

    .line 815
    :cond_1
    const-string/jumbo v1, "pid"

    goto :goto_0
.end method

.method private static parseStatistics(Lorg/json/JSONObject;Ljava/lang/String;Lcom/vkontakte/android/statistics/Statistic;II)V
    .locals 10
    .param p0, "obj"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "ad"    # Lcom/vkontakte/android/statistics/Statistic;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "adsId1"    # I
    .param p4, "adsId2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1079
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1080
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 1081
    .local v9, "stats":Lorg/json/JSONArray;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v7, v0, :cond_0

    .line 1082
    invoke-virtual {v9, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 1083
    .local v8, "s":Lorg/json/JSONObject;
    const-string/jumbo v0, "url"

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1084
    .local v1, "url":Ljava/lang/String;
    const-string/jumbo v0, "type"

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1085
    .local v2, "type":Ljava/lang/String;
    invoke-interface {p2, v2}, Lcom/vkontakte/android/statistics/Statistic;->getStatisticSizeByType(Ljava/lang/String;)I

    move-result v5

    .line 1086
    .local v5, "statisticSize":I
    new-instance v0, Lcom/vkontakte/android/statistics/StatisticUrl;

    move v3, p3

    move v4, p4

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/statistics/StatisticUrl;-><init>(Ljava/lang/String;Ljava/lang/String;IIILcom/vkontakte/android/statistics/Statistic;)V

    invoke-interface {p2, v0}, Lcom/vkontakte/android/statistics/Statistic;->addStatisticUrl(Lcom/vkontakte/android/statistics/StatisticUrl;)V

    .line 1081
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1089
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "type":Ljava/lang/String;
    .end local v5    # "statisticSize":I
    .end local v7    # "i":I
    .end local v8    # "s":Lorg/json/JSONObject;
    .end local v9    # "stats":Lorg/json/JSONArray;
    :cond_0
    return-void
.end method

.method public static parseTopic(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;
    .locals 2
    .param p0, "topic"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 855
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 856
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    const/4 v1, 0x4

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 857
    const-string/jumbo v1, "title"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 858
    const-string/jumbo v1, "id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 859
    const-string/jumbo v1, "owner_id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 860
    return-object v0
.end method

.method public static parseVideo(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;
    .locals 4
    .param p0, "video"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 844
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 845
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    new-instance v1, Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/VideoFile;-><init>(Lorg/json/JSONObject;)V

    .line 846
    .local v1, "vf":Lcom/vkontakte/android/api/VideoFile;
    const/4 v2, 0x2

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 847
    iget v2, v1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 848
    iget v2, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 849
    iget v2, v1, Lcom/vkontakte/android/api/VideoFile;->date:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 850
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v3, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-direct {v3, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 851
    return-object v0
.end method

.method public static parseWidget(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;
    .locals 4
    .param p0, "obj"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 879
    const-string/jumbo v2, "app_widget"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/api/widget/Widget;->create(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/widget/Widget;

    move-result-object v1

    .line 880
    .local v1, "widget":Lcom/vkontakte/android/api/widget/Widget;
    if-nez v1, :cond_0

    .line 881
    const/4 v0, 0x0

    .line 888
    :goto_0
    return-object v0

    .line 883
    :cond_0
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 884
    .local v0, "entry":Lcom/vkontakte/android/NewsEntry;
    const v2, 0x77359402

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 885
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2}, Ljava/util/Random;->nextInt()I

    move-result v2

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 886
    const/16 v2, 0x13

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 887
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v3, Lcom/vkontakte/android/attachments/WidgetAttachment;

    invoke-direct {v3, v1}, Lcom/vkontakte/android/attachments/WidgetAttachment;-><init>(Lcom/vkontakte/android/api/widget/Widget;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private serializeActivity()[B
    .locals 4

    .prologue
    .line 1305
    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    if-nez v3, :cond_0

    .line 1306
    const/4 v3, 0x0

    .line 1316
    :goto_0
    return-object v3

    .line 1308
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1309
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1311
    .local v1, "os":Ljava/io/DataOutputStream;
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/NewsEntry$Activity;->serialize(Ljava/io/DataOutputStream;)V

    .line 1312
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1316
    :goto_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    goto :goto_0

    .line 1313
    :catch_0
    move-exception v2

    .line 1314
    .local v2, "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method private serializeAttachments()[B
    .locals 6

    .prologue
    .line 1283
    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_0

    .line 1284
    const/4 v4, 0x0

    .line 1301
    :goto_0
    return-object v4

    .line 1286
    :cond_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1287
    .local v1, "buf":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/DataOutputStream;

    invoke-direct {v2, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1289
    .local v2, "os":Ljava/io/DataOutputStream;
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 1290
    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1291
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/Attachment;->serialize(Ljava/io/DataOutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1298
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :catch_0
    move-exception v3

    .line 1299
    .local v3, "x":Ljava/lang/Exception;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 1301
    .end local v3    # "x":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    goto :goto_0

    .line 1293
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 1294
    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1295
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/Attachment;->serialize(Ljava/io/DataOutputStream;)V

    goto :goto_3

    .line 1297
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_2
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method private serializeExtras()Ljava/lang/String;
    .locals 7

    .prologue
    .line 1180
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    invoke-virtual {v5}, Landroid/os/Bundle;->size()I

    move-result v5

    if-nez v5, :cond_1

    .line 1181
    :cond_0
    const-string/jumbo v5, ""

    .line 1198
    :goto_0
    return-object v5

    .line 1184
    :cond_1
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 1185
    .local v3, "obj":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    invoke-virtual {v5}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 1186
    .local v1, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1187
    .local v0, "k":Ljava/lang/String;
    iget-object v6, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 1188
    .local v2, "o":Ljava/lang/Object;
    instance-of v6, v2, Lcom/vkontakte/android/utils/JSONSerializable;

    if-eqz v6, :cond_2

    .line 1189
    check-cast v2, Lcom/vkontakte/android/utils/JSONSerializable;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-static {v2}, Lcom/vkontakte/android/utils/JSONSerializable$Factory;->to(Lcom/vkontakte/android/utils/JSONSerializable;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v3, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1195
    .end local v0    # "k":Ljava/lang/String;
    .end local v1    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v3    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v4

    .line 1196
    .local v4, "x":Lorg/json/JSONException;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1198
    const-string/jumbo v5, ""

    goto :goto_0

    .line 1191
    .end local v4    # "x":Lorg/json/JSONException;
    .restart local v0    # "k":Ljava/lang/String;
    .restart local v1    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v2    # "o":Ljava/lang/Object;
    .restart local v3    # "obj":Lorg/json/JSONObject;
    :cond_2
    :try_start_1
    invoke-virtual {v3, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 1194
    .end local v0    # "k":Ljava/lang/String;
    .end local v2    # "o":Ljava/lang/Object;
    :cond_3
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_0
.end method

.method private setCaption(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "captionType"    # Ljava/lang/String;
    .param p2, "captionText"    # Ljava/lang/String;
    .param p3, "actionText"    # Ljava/lang/String;
    .param p4, "actionUrl"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 231
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "captionType"

    iput-object p1, p0, Lcom/vkontakte/android/NewsEntry;->captionType:Ljava/lang/String;

    invoke-virtual {v2, v4, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "captionText"

    invoke-virtual {v2, v4, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "captionActionText"

    invoke-virtual {v2, v4, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "captionActionUrl"

    invoke-virtual {v2, v4, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    iput-object p3, p0, Lcom/vkontakte/android/NewsEntry;->captionActionText:Ljava/lang/CharSequence;

    .line 236
    iput-object p4, p0, Lcom/vkontakte/android/NewsEntry;->captionActionUrl:Ljava/lang/CharSequence;

    .line 237
    invoke-static {p2}, Lcom/vkontakte/android/TextStyleParser;->parse(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/NewsEntry;->captionText:Ljava/lang/CharSequence;

    .line 238
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->captionText:Ljava/lang/CharSequence;

    instance-of v2, v2, Landroid/text/Spannable;

    if-eqz v2, :cond_0

    .line 239
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->captionText:Ljava/lang/CharSequence;

    check-cast v2, Landroid/text/Spannable;

    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->captionText:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    const-class v5, Lcom/vkontakte/android/LinkSpan;

    invoke-interface {v2, v3, v4, v5}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/vkontakte/android/LinkSpan;

    .line 240
    .local v1, "linkSpans":[Lcom/vkontakte/android/LinkSpan;
    if-eqz v1, :cond_0

    .line 241
    array-length v4, v1

    move v2, v3

    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v0, v1, v2

    .line 242
    .local v0, "linkSpan":Lcom/vkontakte/android/LinkSpan;
    const-string/jumbo v3, "#7C828A"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/LinkSpan;->setColor(I)V

    .line 241
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 246
    .end local v0    # "linkSpan":Lcom/vkontakte/android/LinkSpan;
    .end local v1    # "linkSpans":[Lcom/vkontakte/android/LinkSpan;
    :cond_0
    return-void
.end method

.method private setInfoFromPostSource(Lorg/json/JSONObject;Z)V
    .locals 5
    .param p1, "source"    # Lorg/json/JSONObject;
    .param p2, "ff"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 760
    const-string/jumbo v2, "data"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v2, "profile_photo"

    const-string/jumbo v3, "data"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 761
    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v2, :cond_2

    .line 762
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080728

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 766
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    iput-object v2, p0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    .line 768
    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v2, v2, 0x10

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 769
    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit16 v2, v2, 0x100

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 772
    :cond_0
    const-string/jumbo v2, "type"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 773
    .local v1, "ptype":Ljava/lang/String;
    const-string/jumbo v2, "api"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 774
    const-string/jumbo v2, "platform"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 775
    .local v0, "jplatform":Ljava/lang/String;
    const-string/jumbo v2, "android"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 776
    const/4 v2, 0x2

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    .line 801
    .end local v0    # "jplatform":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 764
    .end local v1    # "ptype":Ljava/lang/String;
    :cond_2
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz p2, :cond_3

    const v2, 0x7f080727

    :goto_2
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    goto :goto_0

    :cond_3
    const v2, 0x7f080729

    goto :goto_2

    .line 777
    .restart local v0    # "jplatform":Ljava/lang/String;
    .restart local v1    # "ptype":Ljava/lang/String;
    :cond_4
    const-string/jumbo v2, "iphone"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 778
    const/4 v2, 0x3

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    goto :goto_1

    .line 779
    :cond_5
    const-string/jumbo v2, "ipad"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 780
    const/4 v2, 0x4

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    goto :goto_1

    .line 781
    :cond_6
    const-string/jumbo v2, "wphone"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 782
    const/4 v2, 0x5

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    goto :goto_1

    .line 783
    :cond_7
    const-string/jumbo v2, "windows"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 784
    const/4 v2, 0x6

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    goto :goto_1

    .line 785
    :cond_8
    const-string/jumbo v2, "instagram"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 786
    const/16 v2, 0x8

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    .line 787
    const-string/jumbo v2, "url"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 788
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v3, "post_source_url"

    const-string/jumbo v4, "url"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 790
    :cond_9
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v2, :cond_1

    .line 791
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/GeoAttachment;

    const/4 v3, 0x1

    iput v3, v2, Lcom/vkontakte/android/attachments/GeoAttachment;->style:I

    goto/16 :goto_1

    .line 793
    :cond_a
    const-string/jumbo v2, "chronicle"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 794
    const/16 v2, 0x9

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    goto/16 :goto_1

    .line 795
    :cond_b
    const-string/jumbo v2, "prisma"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 796
    const/16 v2, 0xa

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    goto/16 :goto_1

    .line 798
    :cond_c
    const/4 v2, 0x7

    iput v2, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    goto/16 :goto_1
.end method

.method private setSuggestSubscribe(Z)V
    .locals 2
    .param p1, "suggestSubscribe"    # Z

    .prologue
    .line 226
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "suggest_subscribe"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 227
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry;->suggestSubscribe:Ljava/lang/Boolean;

    .line 228
    return-void
.end method

.method public static stripUnderlines(Landroid/text/Spannable;)Landroid/text/Spannable;
    .locals 11
    .param p0, "s"    # Landroid/text/Spannable;

    .prologue
    const/4 v8, 0x0

    .line 1550
    invoke-interface {p0}, Landroid/text/Spannable;->length()I

    move-result v7

    const-class v9, Landroid/text/style/URLSpan;

    invoke-interface {p0, v8, v7, v9}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Landroid/text/style/URLSpan;

    .line 1551
    .local v5, "spans":[Landroid/text/style/URLSpan;
    array-length v9, v5

    move v7, v8

    :goto_0
    if-ge v7, v9, :cond_0

    aget-object v3, v5, v7

    .line 1552
    .local v3, "span":Landroid/text/style/URLSpan;
    invoke-interface {p0, v3}, Landroid/text/Spannable;->getSpanStart(Ljava/lang/Object;)I

    move-result v6

    .line 1553
    .local v6, "start":I
    invoke-interface {p0, v3}, Landroid/text/Spannable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    .line 1554
    .local v2, "end":I
    invoke-interface {p0, v3}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 1555
    new-instance v4, Lcom/vkontakte/android/NewsEntry$URLSpanNoUnderline;

    invoke-virtual {v3}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v4, v10}, Lcom/vkontakte/android/NewsEntry$URLSpanNoUnderline;-><init>(Ljava/lang/String;)V

    .line 1556
    .end local v3    # "span":Landroid/text/style/URLSpan;
    .local v4, "span":Landroid/text/style/URLSpan;
    invoke-interface {p0, v4, v6, v2, v8}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1551
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1558
    .end local v2    # "end":I
    .end local v4    # "span":Landroid/text/style/URLSpan;
    .end local v6    # "start":I
    :cond_0
    invoke-interface {p0}, Landroid/text/Spannable;->length()I

    move-result v7

    const-class v9, Landroid/text/style/ForegroundColorSpan;

    invoke-interface {p0, v8, v7, v9}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/text/style/ForegroundColorSpan;

    .line 1559
    .local v1, "aspans":[Landroid/text/style/ForegroundColorSpan;
    array-length v9, v1

    move v7, v8

    :goto_1
    if-ge v7, v9, :cond_1

    aget-object v3, v1, v7

    .line 1560
    .local v3, "span":Landroid/text/style/ForegroundColorSpan;
    invoke-interface {p0, v3}, Landroid/text/Spannable;->getSpanStart(Ljava/lang/Object;)I

    move-result v6

    .line 1561
    .restart local v6    # "start":I
    invoke-interface {p0, v3}, Landroid/text/Spannable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    .line 1562
    .restart local v2    # "end":I
    invoke-interface {p0, v3}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 1563
    new-instance v0, Lcom/vkontakte/android/NewsEntry$XColorSpan;

    invoke-virtual {v3}, Landroid/text/style/ForegroundColorSpan;->getForegroundColor()I

    move-result v10

    invoke-direct {v0, v10}, Lcom/vkontakte/android/NewsEntry$XColorSpan;-><init>(I)V

    .line 1564
    .local v0, "as":Lcom/vkontakte/android/NewsEntry$XColorSpan;
    invoke-interface {p0, v0, v6, v2, v8}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1559
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1566
    .end local v0    # "as":Lcom/vkontakte/android/NewsEntry$XColorSpan;
    .end local v2    # "end":I
    .end local v3    # "span":Landroid/text/style/ForegroundColorSpan;
    .end local v6    # "start":I
    :cond_1
    return-object p0
.end method


# virtual methods
.method public equals(Lcom/vkontakte/android/NewsEntry;)Z
    .locals 2
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 1510
    if-eqz p1, :cond_0

    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->userID:I

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->type:I

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public flag(IZ)V
    .locals 2
    .param p1, "f"    # I
    .param p2, "v"    # Z

    .prologue
    .line 1502
    if-eqz p2, :cond_0

    .line 1503
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/2addr v0, p1

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 1507
    :goto_0
    return-void

    .line 1505
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    xor-int/lit8 v1, p1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    goto :goto_0
.end method

.method public flag(I)Z
    .locals 1
    .param p1, "f"    # I

    .prologue
    .line 1498
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    and-int/2addr v0, p1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImageAttachment(I)Lcom/vkontakte/android/attachments/ImageAttachment;
    .locals 4
    .param p1, "idx"    # I

    .prologue
    .line 1477
    const/4 v1, 0x0

    .line 1478
    .local v1, "cnt":I
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1479
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v3, :cond_0

    .line 1480
    if-ne v1, p1, :cond_1

    .line 1481
    check-cast v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    .line 1494
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :goto_1
    return-object v0

    .line 1483
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1486
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1487
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v3, :cond_3

    .line 1488
    if-ne v1, p1, :cond_4

    .line 1489
    check-cast v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    goto :goto_1

    .line 1491
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1494
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_5
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getImageCount()I
    .locals 4

    .prologue
    .line 1462
    const/4 v1, 0x0

    .line 1463
    .local v1, "cnt":I
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1464
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v3, :cond_0

    .line 1465
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1468
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1469
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v3, :cond_2

    .line 1470
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1473
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_3
    return v1
.end method

.method public getPlatformIconResource()I
    .locals 1

    .prologue
    .line 1264
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    packed-switch v0, :pswitch_data_0

    .line 1278
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 1266
    :pswitch_1
    const v0, 0x7f020246

    goto :goto_0

    .line 1269
    :pswitch_2
    const v0, 0x7f020248

    goto :goto_0

    .line 1272
    :pswitch_3
    const v0, 0x7f02024a

    goto :goto_0

    .line 1274
    :pswitch_4
    const v0, 0x7f020247

    goto :goto_0

    .line 1276
    :pswitch_5
    const v0, 0x7f020249

    goto :goto_0

    .line 1264
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method public getRepostTypeString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1532
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    packed-switch v0, :pswitch_data_0

    .line 1545
    const-string/jumbo v0, "wall"

    :goto_0
    return-object v0

    .line 1534
    :pswitch_0
    const-string/jumbo v0, "wallreply"

    goto :goto_0

    .line 1536
    :pswitch_1
    const-string/jumbo v0, "note"

    goto :goto_0

    .line 1538
    :pswitch_2
    const-string/jumbo v0, "photo"

    goto :goto_0

    .line 1540
    :pswitch_3
    const-string/jumbo v0, "topic"

    goto :goto_0

    .line 1542
    :pswitch_4
    const-string/jumbo v0, "video"

    goto :goto_0

    .line 1532
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method public getShitAttachment()Lcom/vkontakte/android/attachments/ShitAttachment;
    .locals 3

    .prologue
    .line 804
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 805
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v2, :cond_0

    .line 806
    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 809
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTrackCode()Ljava/lang/String;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1689
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "extras_key_track_code"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTypeString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1514
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    packed-switch v0, :pswitch_data_0

    .line 1527
    const-string/jumbo v0, "wall"

    :goto_0
    return-object v0

    .line 1516
    :pswitch_0
    const-string/jumbo v0, "wallreply"

    goto :goto_0

    .line 1518
    :pswitch_1
    const-string/jumbo v0, "note"

    goto :goto_0

    .line 1520
    :pswitch_2
    const-string/jumbo v0, "photo"

    goto :goto_0

    .line 1522
    :pswitch_3
    const-string/jumbo v0, "topic"

    goto :goto_0

    .line 1524
    :pswitch_4
    const-string/jumbo v0, "video"

    goto :goto_0

    .line 1514
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method public hasTrackCode()Z
    .locals 2

    .prologue
    .line 1693
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "extras_key_track_code"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public layoutThumbs()V
    .locals 3

    .prologue
    .line 1638
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/vkontakte/android/NewsEntry;->layoutThumbs(Ljava/util/List;)V

    .line 1639
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/vkontakte/android/NewsEntry;->layoutThumbs(Ljava/util/List;)V

    .line 1640
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1641
    .local v0, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v2, :cond_0

    .line 1642
    check-cast v0, Lcom/vkontakte/android/attachments/PollAttachment;

    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    iput-object p0, v0, Lcom/vkontakte/android/attachments/PollAttachment;->parentPost:Lcom/vkontakte/android/NewsEntry;

    goto :goto_0

    .line 1645
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1646
    .restart local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v2, :cond_2

    .line 1647
    check-cast v0, Lcom/vkontakte/android/attachments/PollAttachment;

    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    iput-object p0, v0, Lcom/vkontakte/android/attachments/PollAttachment;->parentPost:Lcom/vkontakte/android/NewsEntry;

    goto :goto_1

    .line 1650
    :cond_3
    return-void
.end method

.method public readFromSQLite(Landroid/database/Cursor;)V
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v3, 0x0

    .line 1360
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 1361
    .local v2, "values":Landroid/content/ContentValues;
    invoke-static {p1, v2}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 1362
    const-string/jumbo v4, "pid"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 1363
    const-string/jumbo v4, "uid"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 1364
    const-string/jumbo v4, "text"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 1365
    const-string/jumbo v4, "time"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 1366
    const-string/jumbo v4, "likes"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 1367
    const-string/jumbo v4, "retweets"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 1368
    const-string/jumbo v4, "viewers"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    .line 1370
    const-string/jumbo v4, "comments"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 1371
    const-string/jumbo v4, "username"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 1372
    const-string/jumbo v4, "userphoto"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 1376
    const-string/jumbo v4, "attachments"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/vkontakte/android/NewsEntry;->deserializeAttachments([B)V

    .line 1377
    const-string/jumbo v4, "flags"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 1379
    const-string/jumbo v4, "retweet_uid"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    .line 1380
    const-string/jumbo v4, "retweet_username"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    .line 1381
    const-string/jumbo v4, "retweet_text"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 1382
    const-string/jumbo v4, "retweet_user_photo"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    .line 1383
    const-string/jumbo v4, "retweet_orig_id"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    .line 1384
    const-string/jumbo v4, "retweet_orig_time"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    .line 1385
    const-string/jumbo v4, "retweet_type"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    .line 1387
    iget v4, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    shr-int/lit8 v4, v4, 0x18

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 1389
    const-string/jumbo v4, "last_comment_name"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1390
    const-string/jumbo v4, "last_comment_name"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserName:Ljava/lang/String;

    .line 1391
    const-string/jumbo v4, "last_comment_photo"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserPhoto:Ljava/lang/String;

    .line 1392
    const-string/jumbo v4, "last_comment_text"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    .line 1393
    const-string/jumbo v4, "last_comment_time"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->lastCommentTime:I

    .line 1395
    :cond_0
    const-string/jumbo v4, "created_by"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->createdBy:I

    .line 1396
    const-string/jumbo v4, "platform"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    .line 1398
    const-string/jumbo v4, "extra"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/vkontakte/android/NewsEntry;->deserializeExtras(Ljava/lang/String;)V

    .line 1399
    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "converted_to_photo"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1400
    const/4 v4, 0x1

    iput v4, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 1402
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/NewsEntry;->loadExtras()V

    .line 1404
    invoke-virtual {p0}, Lcom/vkontakte/android/NewsEntry;->layoutThumbs()V

    .line 1406
    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    if-nez v4, :cond_5

    move-object v0, v3

    .line 1407
    .local v0, "listRefer":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    new-instance v3, Lcom/vkontakte/android/data/PostInteract;

    invoke-direct {v3, v0, p0}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    :cond_2
    iput-object v3, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 1408
    invoke-virtual {p0}, Lcom/vkontakte/android/NewsEntry;->getShitAttachment()Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v1

    .line 1409
    .local v1, "statistic":Lcom/vkontakte/android/statistics/Statistic;
    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v3, :cond_3

    if-eqz v1, :cond_3

    .line 1410
    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    const-string/jumbo v4, "click_post_link"

    invoke-interface {v1, v4}, Lcom/vkontakte/android/statistics/Statistic;->getStatisticByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/data/PostInteract;->setClickPostLinks(Ljava/util/List;)V

    .line 1413
    :cond_3
    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_6

    .line 1414
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08020e

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " <a href=\'http://vk.com\'>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "</a>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    check-cast v3, Landroid/text/Spannable;

    invoke-static {v3}, Lcom/vkontakte/android/NewsEntry;->stripUnderlines(Landroid/text/Spannable;)Landroid/text/Spannable;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    .line 1415
    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v3, v3, 0x10

    iput v3, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 1420
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    if-eqz v3, :cond_4

    .line 1421
    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    invoke-static {v3, v4}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;Lcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    .line 1424
    :cond_4
    const-string/jumbo v3, "order_position"

    invoke-virtual {v2, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    .line 1425
    const-string/jumbo v3, "activity"

    invoke-virtual {v2, v3}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/vkontakte/android/NewsEntry;->deserializeActivity([B)V

    .line 1426
    return-void

    .line 1406
    .end local v0    # "listRefer":Ljava/lang/String;
    .end local v1    # "statistic":Lcom/vkontakte/android/statistics/Statistic;
    :cond_5
    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "extras_key_list_refer"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1417
    .restart local v0    # "listRefer":Ljava/lang/String;
    .restart local v1    # "statistic":Lcom/vkontakte/android/statistics/Statistic;
    :cond_6
    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    invoke-static {v3, v4}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;Lcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    goto :goto_1
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "out"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v2, -0x1

    .line 1203
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1204
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->userID:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1205
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1206
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1207
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1208
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1209
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->time:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1210
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1211
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1212
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1213
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1214
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1215
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1216
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1217
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->attachType:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1218
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachTitle:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1219
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1220
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1221
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1222
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1223
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1224
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1225
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->createdBy:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1226
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1228
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    if-nez v1, :cond_2

    .line 1229
    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1237
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    if-nez v1, :cond_3

    .line 1238
    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1246
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeBundle(Landroid/os/Bundle;)V

    .line 1248
    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1249
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 1250
    return-void

    .line 1231
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1232
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1233
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/utils/Serializer$Serializable;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 1232
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1240
    .end local v0    # "i":I
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1241
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1242
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/utils/Serializer$Serializable;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 1241
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0xc8

    .line 1684
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "NewsEntry {id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", text="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/vkontakte/android/NewsEntry;->ell(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", repostText="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/vkontakte/android/NewsEntry;->ell(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", flags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", attachments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", repostAttachments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToSQLite(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V
    .locals 5
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 1321
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1322
    .local v0, "values":Landroid/content/ContentValues;
    const-string/jumbo v1, "pid"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1323
    const-string/jumbo v1, "uid"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->userID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1324
    const-string/jumbo v1, "text"

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1325
    const-string/jumbo v1, "time"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->time:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1326
    const-string/jumbo v1, "likes"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1327
    const-string/jumbo v1, "comments"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1328
    const-string/jumbo v1, "username"

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1329
    const-string/jumbo v1, "userphoto"

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1330
    const-string/jumbo v1, "retweet_uid"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1331
    const-string/jumbo v1, "retweet_username"

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1332
    const-string/jumbo v3, "attachments"

    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/NewsEntry;->serializeAttachments()[B

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 1333
    const-string/jumbo v1, "flags"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->flags:I

    iget v4, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    shl-int/lit8 v4, v4, 0x18

    or-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1334
    const-string/jumbo v1, "retweet_text"

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1335
    const-string/jumbo v1, "retweets"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1336
    const-string/jumbo v1, "viewers"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->numViews:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1337
    const-string/jumbo v1, "retweet_user_photo"

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1338
    const-string/jumbo v1, "retweet_orig_id"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1339
    const-string/jumbo v1, "retweet_orig_time"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1340
    const-string/jumbo v1, "retweet_type"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1341
    const-string/jumbo v1, "created_by"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->createdBy:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1342
    const-string/jumbo v1, "platform"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->platform:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1343
    const-string/jumbo v1, "extra"

    invoke-direct {p0}, Lcom/vkontakte/android/NewsEntry;->serializeExtras()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1344
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 1345
    const-string/jumbo v1, "last_comment_name"

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserName:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1346
    const-string/jumbo v1, "last_comment_photo"

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserPhoto:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1347
    const-string/jumbo v1, "last_comment_text"

    iget-object v3, p0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1348
    const-string/jumbo v1, "last_comment_time"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->lastCommentTime:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1350
    :cond_1
    const-string/jumbo v1, "order_position"

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->order_position:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1351
    const-string/jumbo v1, "activity"

    invoke-direct {p0}, Lcom/vkontakte/android/NewsEntry;->serializeActivity()[B

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 1354
    invoke-virtual {p1, p2, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1355
    return-void

    :cond_2
    move-object v1, v2

    .line 1332
    goto/16 :goto_0
.end method
