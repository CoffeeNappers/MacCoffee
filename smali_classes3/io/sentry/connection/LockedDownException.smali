.class public Lio/sentry/connection/LockedDownException;
.super Ljava/lang/RuntimeException;
.source "LockedDownException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 15
    return-void
.end method
