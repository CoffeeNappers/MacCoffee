.class public final enum Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;
.super Ljava/lang/Enum;
.source "AudioGetPlaylists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioGetPlaylists;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Filter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

.field public static final enum all:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

.field public static final enum followed:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

.field public static final enum owned:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    const-string/jumbo v1, "all"

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->all:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    const-string/jumbo v1, "owned"

    invoke-direct {v0, v1, v3}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->owned:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    const-string/jumbo v1, "followed"

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->followed:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    .line 21
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    sget-object v1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->all:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->owned:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->followed:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    aput-object v1, v0, v4

    sput-object v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->$VALUES:[Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

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
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 21
    const-class v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->$VALUES:[Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    invoke-virtual {v0}, [Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    return-object v0
.end method
