.class public Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
.super Ljava/lang/Object;
.source "QueryData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/proxy/QueryData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Range"
.end annotation


# instance fields
.field public final from:J

.field public final to:Ljava/lang/Long;


# direct methods
.method public constructor <init>(JLjava/lang/Long;)V
    .locals 1
    .param p1, "from"    # J
    .param p3, "to"    # Ljava/lang/Long;

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    iput-wide p1, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    .line 146
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    .line 147
    return-void
.end method


# virtual methods
.method public isValid()Z
    .locals 4

    .prologue
    .line 150
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 155
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "from"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "to"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/utils/Utils;->objectToString(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
