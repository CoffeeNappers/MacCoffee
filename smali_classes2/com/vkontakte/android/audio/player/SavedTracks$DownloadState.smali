.class public final enum Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;
.super Ljava/lang/Enum;
.source "SavedTracks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/SavedTracks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DownloadState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

.field public static final enum DOWNLOADED:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

.field public static final enum DOWNLOADED_LOST:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

.field public static final enum DOWNLOADING:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

.field public static final enum NONE:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 355
    new-instance v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    const-string/jumbo v1, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->NONE:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    new-instance v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    const-string/jumbo v1, "DOWNLOADING"

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->DOWNLOADING:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    new-instance v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    const-string/jumbo v1, "DOWNLOADED"

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->DOWNLOADED:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    new-instance v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    const-string/jumbo v1, "DOWNLOADED_LOST"

    invoke-direct {v0, v1, v5}, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->DOWNLOADED_LOST:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    .line 354
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    sget-object v1, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->NONE:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->DOWNLOADING:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->DOWNLOADED:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->DOWNLOADED_LOST:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->$VALUES:[Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 354
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 354
    const-class v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;
    .locals 1

    .prologue
    .line 354
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->$VALUES:[Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    invoke-virtual {v0}, [Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    return-object v0
.end method
