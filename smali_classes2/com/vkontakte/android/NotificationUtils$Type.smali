.class public final enum Lcom/vkontakte/android/NotificationUtils$Type;
.super Ljava/lang/Enum;
.source "NotificationUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/NotificationUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/NotificationUtils$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum BDays:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum ChatMessages:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum Comments:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum Default:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum FoundFriends:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum FriendRequests:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum Games:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum Gifts:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum GroupInvites:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum Likes:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum LiveBroadcasts:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum Mentions:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum PhotoTags:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum Posts:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum PrivateMessages:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum Replies:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum Reposts:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum UpcomingEvents:Lcom/vkontakte/android/NotificationUtils$Type;

.field public static final enum VideoTags:Lcom/vkontakte/android/NotificationUtils$Type;


# instance fields
.field private final key:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 33
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "PrivateMessages"

    const-string/jumbo v2, "PrivateMessages"

    invoke-direct {v0, v1, v4, v2}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->PrivateMessages:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 34
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "ChatMessages"

    const-string/jumbo v2, "ChatMessages"

    invoke-direct {v0, v1, v5, v2}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->ChatMessages:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 35
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "FriendRequests"

    const-string/jumbo v2, "FriendRequests"

    invoke-direct {v0, v1, v6, v2}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->FriendRequests:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 36
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "FoundFriends"

    const-string/jumbo v2, "FoundFriends"

    invoke-direct {v0, v1, v7, v2}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->FoundFriends:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 37
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "Replies"

    const-string/jumbo v2, "Replies"

    invoke-direct {v0, v1, v8, v2}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->Replies:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 38
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "Comments"

    const/4 v2, 0x5

    const-string/jumbo v3, "Comments"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->Comments:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 39
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "Mentions"

    const/4 v2, 0x6

    const-string/jumbo v3, "Mentions"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->Mentions:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 40
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "Likes"

    const/4 v2, 0x7

    const-string/jumbo v3, "Likes"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->Likes:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 41
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "Reposts"

    const/16 v2, 0x8

    const-string/jumbo v3, "Reposts"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->Reposts:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 42
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "Posts"

    const/16 v2, 0x9

    const-string/jumbo v3, "Posts"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->Posts:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 43
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "GroupInvites"

    const/16 v2, 0xa

    const-string/jumbo v3, "GroupInvites"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->GroupInvites:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 44
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "UpcomingEvents"

    const/16 v2, 0xb

    const-string/jumbo v3, "UpcomingEvents"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->UpcomingEvents:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 45
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "PhotoTags"

    const/16 v2, 0xc

    const-string/jumbo v3, "PhotoTags"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->PhotoTags:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 46
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "VideoTags"

    const/16 v2, 0xd

    const-string/jumbo v3, "VideoTags"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->VideoTags:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 47
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "Games"

    const/16 v2, 0xe

    const-string/jumbo v3, "Games"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->Games:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 48
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "Gifts"

    const/16 v2, 0xf

    const-string/jumbo v3, "Gifts"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->Gifts:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 49
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "BDays"

    const/16 v2, 0x10

    const-string/jumbo v3, "BDays"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->BDays:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 50
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "Default"

    const/16 v2, 0x11

    const-string/jumbo v3, "__"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->Default:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 51
    new-instance v0, Lcom/vkontakte/android/NotificationUtils$Type;

    const-string/jumbo v1, "LiveBroadcasts"

    const/16 v2, 0x12

    const-string/jumbo v3, "LiveBroadcasts"

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/NotificationUtils$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->LiveBroadcasts:Lcom/vkontakte/android/NotificationUtils$Type;

    .line 32
    const/16 v0, 0x13

    new-array v0, v0, [Lcom/vkontakte/android/NotificationUtils$Type;

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->PrivateMessages:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->ChatMessages:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->FriendRequests:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v1, v0, v6

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->FoundFriends:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v1, v0, v7

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->Replies:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->Comments:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->Mentions:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->Likes:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->Reposts:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->Posts:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->GroupInvites:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->UpcomingEvents:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->PhotoTags:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->VideoTags:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->Games:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->Gifts:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->BDays:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->Default:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/vkontakte/android/NotificationUtils$Type;->LiveBroadcasts:Lcom/vkontakte/android/NotificationUtils$Type;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->$VALUES:[Lcom/vkontakte/android/NotificationUtils$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 56
    iput-object p3, p0, Lcom/vkontakte/android/NotificationUtils$Type;->key:Ljava/lang/String;

    .line 57
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/NotificationUtils$Type;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/NotificationUtils$Type;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/NotificationUtils$Type;->key:Ljava/lang/String;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/NotificationUtils$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    const-class v0, Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NotificationUtils$Type;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/NotificationUtils$Type;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/vkontakte/android/NotificationUtils$Type;->$VALUES:[Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-virtual {v0}, [Lcom/vkontakte/android/NotificationUtils$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/NotificationUtils$Type;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/NotificationUtils$Type;->key:Ljava/lang/String;

    return-object v0
.end method
