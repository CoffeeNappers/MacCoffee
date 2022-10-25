.class public final enum Lcom/vk/music/formatter/Duration;
.super Ljava/lang/Enum;
.source "Duration.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/music/formatter/Duration;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/music/formatter/Duration;

.field public static final enum DAY:Lcom/vk/music/formatter/Duration;

.field public static final enum HOUR:Lcom/vk/music/formatter/Duration;

.field public static final enum MINUTE:Lcom/vk/music/formatter/Duration;

.field public static final enum MONTH:Lcom/vk/music/formatter/Duration;

.field public static final enum WEEK:Lcom/vk/music/formatter/Duration;

.field public static final enum YEAR:Lcom/vk/music/formatter/Duration;


# instance fields
.field private seconds:J


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const-wide/16 v4, 0x1

    .line 10
    new-instance v0, Lcom/vk/music/formatter/Duration;

    const-string/jumbo v1, "MINUTE"

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v2

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/vk/music/formatter/Duration;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/vk/music/formatter/Duration;->MINUTE:Lcom/vk/music/formatter/Duration;

    .line 11
    new-instance v0, Lcom/vk/music/formatter/Duration;

    const-string/jumbo v1, "HOUR"

    sget-object v2, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v2

    invoke-direct {v0, v1, v9, v2, v3}, Lcom/vk/music/formatter/Duration;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/vk/music/formatter/Duration;->HOUR:Lcom/vk/music/formatter/Duration;

    .line 12
    new-instance v0, Lcom/vk/music/formatter/Duration;

    const-string/jumbo v1, "DAY"

    sget-object v2, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v2

    invoke-direct {v0, v1, v10, v2, v3}, Lcom/vk/music/formatter/Duration;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/vk/music/formatter/Duration;->DAY:Lcom/vk/music/formatter/Duration;

    .line 13
    new-instance v0, Lcom/vk/music/formatter/Duration;

    const-string/jumbo v1, "WEEK"

    sget-object v2, Lcom/vk/music/formatter/Duration;->DAY:Lcom/vk/music/formatter/Duration;

    iget-wide v2, v2, Lcom/vk/music/formatter/Duration;->seconds:J

    const-wide/16 v4, 0x7

    mul-long/2addr v2, v4

    invoke-direct {v0, v1, v11, v2, v3}, Lcom/vk/music/formatter/Duration;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/vk/music/formatter/Duration;->WEEK:Lcom/vk/music/formatter/Duration;

    .line 14
    new-instance v0, Lcom/vk/music/formatter/Duration;

    const-string/jumbo v1, "MONTH"

    const/4 v2, 0x4

    sget-object v3, Lcom/vk/music/formatter/Duration;->DAY:Lcom/vk/music/formatter/Duration;

    iget-wide v4, v3, Lcom/vk/music/formatter/Duration;->seconds:J

    const-wide/16 v6, 0x1e

    mul-long/2addr v4, v6

    invoke-direct {v0, v1, v2, v4, v5}, Lcom/vk/music/formatter/Duration;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/vk/music/formatter/Duration;->MONTH:Lcom/vk/music/formatter/Duration;

    .line 15
    new-instance v0, Lcom/vk/music/formatter/Duration;

    const-string/jumbo v1, "YEAR"

    const/4 v2, 0x5

    sget-object v3, Lcom/vk/music/formatter/Duration;->DAY:Lcom/vk/music/formatter/Duration;

    iget-wide v4, v3, Lcom/vk/music/formatter/Duration;->seconds:J

    const-wide/16 v6, 0x16d

    mul-long/2addr v4, v6

    invoke-direct {v0, v1, v2, v4, v5}, Lcom/vk/music/formatter/Duration;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/vk/music/formatter/Duration;->YEAR:Lcom/vk/music/formatter/Duration;

    .line 9
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/vk/music/formatter/Duration;

    sget-object v1, Lcom/vk/music/formatter/Duration;->MINUTE:Lcom/vk/music/formatter/Duration;

    aput-object v1, v0, v8

    sget-object v1, Lcom/vk/music/formatter/Duration;->HOUR:Lcom/vk/music/formatter/Duration;

    aput-object v1, v0, v9

    sget-object v1, Lcom/vk/music/formatter/Duration;->DAY:Lcom/vk/music/formatter/Duration;

    aput-object v1, v0, v10

    sget-object v1, Lcom/vk/music/formatter/Duration;->WEEK:Lcom/vk/music/formatter/Duration;

    aput-object v1, v0, v11

    const/4 v1, 0x4

    sget-object v2, Lcom/vk/music/formatter/Duration;->MONTH:Lcom/vk/music/formatter/Duration;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/vk/music/formatter/Duration;->YEAR:Lcom/vk/music/formatter/Duration;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/music/formatter/Duration;->$VALUES:[Lcom/vk/music/formatter/Duration;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IJ)V
    .locals 1
    .param p3, "seconds"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)V"
        }
    .end annotation

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 20
    iput-wide p3, p0, Lcom/vk/music/formatter/Duration;->seconds:J

    .line 21
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/music/formatter/Duration;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 9
    const-class v0, Lcom/vk/music/formatter/Duration;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/music/formatter/Duration;

    return-object v0
.end method

.method public static values()[Lcom/vk/music/formatter/Duration;
    .locals 1

    .prologue
    .line 9
    sget-object v0, Lcom/vk/music/formatter/Duration;->$VALUES:[Lcom/vk/music/formatter/Duration;

    invoke-virtual {v0}, [Lcom/vk/music/formatter/Duration;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/music/formatter/Duration;

    return-object v0
.end method


# virtual methods
.method public isGreaterThan(J)Z
    .locals 3
    .param p1, "seconds"    # J

    .prologue
    .line 32
    iget-wide v0, p0, Lcom/vk/music/formatter/Duration;->seconds:J

    cmp-long v0, v0, p1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLowerThan(J)Z
    .locals 3
    .param p1, "seconds"    # J

    .prologue
    .line 28
    iget-wide v0, p0, Lcom/vk/music/formatter/Duration;->seconds:J

    cmp-long v0, v0, p1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public seconds()J
    .locals 2

    .prologue
    .line 24
    iget-wide v0, p0, Lcom/vk/music/formatter/Duration;->seconds:J

    return-wide v0
.end method
