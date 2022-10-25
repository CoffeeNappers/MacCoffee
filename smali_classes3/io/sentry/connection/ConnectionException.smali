.class public Lio/sentry/connection/ConnectionException;
.super Ljava/lang/RuntimeException;
.source "ConnectionException.java"


# instance fields
.field private recommendedLockdownTime:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lio/sentry/connection/ConnectionException;->recommendedLockdownTime:Ljava/lang/Long;

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lio/sentry/connection/ConnectionException;->recommendedLockdownTime:Ljava/lang/Long;

    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lio/sentry/connection/ConnectionException;->recommendedLockdownTime:Ljava/lang/Long;

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Long;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "recommendedLockdownTime"    # Ljava/lang/Long;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lio/sentry/connection/ConnectionException;->recommendedLockdownTime:Ljava/lang/Long;

    .line 29
    iput-object p3, p0, Lio/sentry/connection/ConnectionException;->recommendedLockdownTime:Ljava/lang/Long;

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lio/sentry/connection/ConnectionException;->recommendedLockdownTime:Ljava/lang/Long;

    .line 34
    return-void
.end method


# virtual methods
.method public getRecommendedLockdownTime()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lio/sentry/connection/ConnectionException;->recommendedLockdownTime:Ljava/lang/Long;

    return-object v0
.end method
