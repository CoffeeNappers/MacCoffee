.class synthetic Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder$1;
.super Ljava/lang/Object;
.source "GameFeedHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$vkontakte$android$data$GameFeedEntry$Type:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 91
    invoke-static {}, Lcom/vkontakte/android/data/GameFeedEntry$Type;->values()[Lcom/vkontakte/android/data/GameFeedEntry$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder$1;->$SwitchMap$com$vkontakte$android$data$GameFeedEntry$Type:[I

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder$1;->$SwitchMap$com$vkontakte$android$data$GameFeedEntry$Type:[I

    sget-object v1, Lcom/vkontakte/android/data/GameFeedEntry$Type;->install:Lcom/vkontakte/android/data/GameFeedEntry$Type;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/GameFeedEntry$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_0
    :try_start_1
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder$1;->$SwitchMap$com$vkontakte$android$data$GameFeedEntry$Type:[I

    sget-object v1, Lcom/vkontakte/android/data/GameFeedEntry$Type;->level:Lcom/vkontakte/android/data/GameFeedEntry$Type;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/GameFeedEntry$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    :try_start_2
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder$1;->$SwitchMap$com$vkontakte$android$data$GameFeedEntry$Type:[I

    sget-object v1, Lcom/vkontakte/android/data/GameFeedEntry$Type;->achievement:Lcom/vkontakte/android/data/GameFeedEntry$Type;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/GameFeedEntry$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder$1;->$SwitchMap$com$vkontakte$android$data$GameFeedEntry$Type:[I

    sget-object v1, Lcom/vkontakte/android/data/GameFeedEntry$Type;->score:Lcom/vkontakte/android/data/GameFeedEntry$Type;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/GameFeedEntry$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    return-void

    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    goto :goto_2

    :catch_2
    move-exception v0

    goto :goto_1

    :catch_3
    move-exception v0

    goto :goto_0
.end method
