.class final Lcom/vkontakte/android/statistics/StatisticPrettyCard$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "StatisticPrettyCard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/statistics/StatisticPrettyCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/statistics/StatisticPrettyCard;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/statistics/StatisticPrettyCard;
    .locals 5
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 39
    new-instance v0, Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/statistics/StatisticPrettyCard;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/statistics/StatisticPrettyCard$1;)V

    .line 40
    .local v0, "statistic":Lcom/vkontakte/android/statistics/StatisticPrettyCard;
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, v0, Lcom/vkontakte/android/statistics/StatisticPrettyCard;->sent:Z

    .line 41
    return-object v0

    .line 40
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 35
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/statistics/StatisticPrettyCard$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/statistics/StatisticPrettyCard;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 46
    new-array v0, p1, [Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 35
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/statistics/StatisticPrettyCard$1;->newArray(I)[Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    move-result-object v0

    return-object v0
.end method
