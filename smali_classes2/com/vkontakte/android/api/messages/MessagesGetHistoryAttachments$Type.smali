.class final enum Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;
.super Ljava/lang/Enum;
.source "MessagesGetHistoryAttachments.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

.field public static final enum audio:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

.field public static final enum doc:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

.field public static final enum link:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

.field public static final enum photo:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

.field public static final enum share:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

.field public static final enum video:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

.field public static final enum wall:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

.field public static final enum wall_reply:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;


# instance fields
.field final aClass:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 34
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    const-string/jumbo v1, "photo"

    const-class v2, Lcom/vkontakte/android/Photo;

    invoke-direct {v0, v1, v4, v2}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->photo:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    const-string/jumbo v1, "video"

    const-class v2, Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {v0, v1, v5, v2}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->video:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    const-string/jumbo v1, "doc"

    const-class v2, Lcom/vkontakte/android/api/Document;

    invoke-direct {v0, v1, v6, v2}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->doc:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    const-string/jumbo v1, "share"

    const-class v2, Lcom/vkontakte/android/Link;

    invoke-direct {v0, v1, v7, v2}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->share:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    const-string/jumbo v1, "link"

    const-class v2, Lcom/vkontakte/android/Link;

    invoke-direct {v0, v1, v8, v2}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->link:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    .line 35
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    const-string/jumbo v1, "audio"

    const/4 v2, 0x5

    const-class v3, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->audio:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    const-string/jumbo v1, "wall"

    const/4 v2, 0x6

    const-class v3, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->wall:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    const-string/jumbo v1, "wall_reply"

    const/4 v2, 0x7

    const-class v3, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;-><init>(Ljava/lang/String;ILjava/lang/Class;)V

    sput-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->wall_reply:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    .line 32
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    sget-object v1, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->photo:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->video:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    aput-object v1, v0, v5

    sget-object v1, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->doc:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    aput-object v1, v0, v6

    sget-object v1, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->share:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    aput-object v1, v0, v7

    sget-object v1, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->link:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->audio:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->wall:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->wall_reply:Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->$VALUES:[Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/Class;)V
    .locals 0
    .param p3, "aClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 40
    iput-object p3, p0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->aClass:Ljava/lang/Class;

    .line 41
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    const-class v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->$VALUES:[Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    invoke-virtual {v0}, [Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/api/messages/MessagesGetHistoryAttachments$Type;

    return-object v0
.end method
