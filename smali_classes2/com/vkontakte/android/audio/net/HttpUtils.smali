.class public final Lcom/vkontakte/android/audio/net/HttpUtils;
.super Ljava/lang/Object;
.source "HttpUtils.java"


# static fields
.field private static final DATE_FORMAT:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 14
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "EEE, dd MMM yyyy HH:mm:ss z"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/vkontakte/android/audio/net/HttpUtils;->DATE_FORMAT:Ljava/text/SimpleDateFormat;

    .line 15
    sget-object v0, Lcom/vkontakte/android/audio/net/HttpUtils;->DATE_FORMAT:Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 16
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method public static parseDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 2
    .param p0, "date"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 22
    sget-object v1, Lcom/vkontakte/android/audio/net/HttpUtils;->DATE_FORMAT:Ljava/text/SimpleDateFormat;

    monitor-enter v1

    .line 23
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/net/HttpUtils;->DATE_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 24
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
