.class public Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
.super Ljava/lang/Object;
.source "FileInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/proxy/FileInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Part"
.end annotation


# instance fields
.field public final downloaded:Z

.field public final from:J

.field public final to:J


# direct methods
.method public constructor <init>(JJZ)V
    .locals 1
    .param p1, "from"    # J
    .param p3, "to"    # J
    .param p5, "downloaded"    # Z

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    iput-wide p1, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    .line 187
    iput-wide p3, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->to:J

    .line 188
    iput-boolean p5, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->downloaded:Z

    .line 189
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 193
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "from"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->from:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "to"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->to:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "downloaded"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-boolean v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;->downloaded:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/utils/Utils;->objectToString(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
