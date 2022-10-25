.class public final enum Lcom/vkontakte/android/audio/AudioFacade$StorageType;
.super Ljava/lang/Enum;
.source "AudioFacade.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/AudioFacade;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "StorageType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/audio/AudioFacade$StorageType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/audio/AudioFacade$StorageType;

.field public static final enum internal:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

.field public static final enum sdCard:Lcom/vkontakte/android/audio/AudioFacade$StorageType;


# instance fields
.field public final nameForPreference:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 445
    new-instance v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    const-string/jumbo v1, "internal"

    const-string/jumbo v2, "internal"

    invoke-direct {v0, v1, v3, v2}, Lcom/vkontakte/android/audio/AudioFacade$StorageType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->internal:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    new-instance v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    const-string/jumbo v1, "sdCard"

    const-string/jumbo v2, "sdCard"

    invoke-direct {v0, v1, v4, v2}, Lcom/vkontakte/android/audio/AudioFacade$StorageType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->sdCard:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    .line 444
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->internal:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->sdCard:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->$VALUES:[Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "nameForPreference"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 449
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 450
    iput-object p3, p0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->nameForPreference:Ljava/lang/String;

    .line 451
    return-void
.end method

.method public static getFileMap()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcom/vkontakte/android/audio/AudioFacade$StorageType;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 466
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 467
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/vkontakte/android/audio/AudioFacade$StorageType;Ljava/io/File;>;"
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/SavedTracks;->getDownloadDirectories(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 468
    .local v0, "file":Ljava/io/File;
    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->isSdCardPath(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 469
    sget-object v3, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->sdCard:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 471
    :cond_0
    sget-object v3, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->internal:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 474
    .end local v0    # "file":Ljava/io/File;
    :cond_1
    return-object v1
.end method

.method public static parseFromPreferences(Ljava/lang/String;)Lcom/vkontakte/android/audio/AudioFacade$StorageType;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 454
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 455
    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 461
    invoke-static {p0}, Lcom/vkontakte/android/audio/utils/Utils;->isSdCardPath(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->sdCard:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    :goto_1
    return-object v0

    .line 455
    :sswitch_0
    const-string/jumbo v1, "internal"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v1, "sdCard"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 457
    :pswitch_0
    sget-object v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->internal:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    goto :goto_1

    .line 459
    :pswitch_1
    sget-object v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->sdCard:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    goto :goto_1

    .line 461
    :cond_1
    sget-object v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->internal:Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    goto :goto_1

    .line 455
    nop

    :sswitch_data_0
    .sparse-switch
        -0x362192ff -> :sswitch_1
        0x21ffc6bd -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/audio/AudioFacade$StorageType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 444
    const-class v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/audio/AudioFacade$StorageType;
    .locals 1

    .prologue
    .line 444
    sget-object v0, Lcom/vkontakte/android/audio/AudioFacade$StorageType;->$VALUES:[Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    invoke-virtual {v0}, [Lcom/vkontakte/android/audio/AudioFacade$StorageType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/audio/AudioFacade$StorageType;

    return-object v0
.end method
