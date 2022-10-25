.class public Lcom/patloew/rxlocation/GoogleApiConnectionSuspendedException;
.super Ljava/lang/RuntimeException;
.source "GoogleApiConnectionSuspendedException.java"


# instance fields
.field private final cause:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .param p1, "cause"    # I

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 21
    iput p1, p0, Lcom/patloew/rxlocation/GoogleApiConnectionSuspendedException;->cause:I

    .line 22
    return-void
.end method


# virtual methods
.method public getErrorCause()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lcom/patloew/rxlocation/GoogleApiConnectionSuspendedException;->cause:I

    return v0
.end method
