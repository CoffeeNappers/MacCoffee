.class final Lio/sentry/marshaller/json/JsonMarshaller$1;
.super Ljava/lang/ThreadLocal;
.source "JsonMarshaller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/sentry/marshaller/json/JsonMarshaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Ljava/text/DateFormat;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 110
    invoke-virtual {p0}, Lio/sentry/marshaller/json/JsonMarshaller$1;->initialValue()Ljava/text/DateFormat;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Ljava/text/DateFormat;
    .locals 2

    .prologue
    .line 113
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy-MM-dd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 114
    .local v0, "dateFormat":Ljava/text/DateFormat;
    const-string/jumbo v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 115
    return-object v0
.end method
