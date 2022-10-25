.class public Lcom/patloew/rxlocation/StatusException;
.super Ljava/lang/RuntimeException;
.source "StatusException.java"


# instance fields
.field private final result:Lcom/google/android/gms/common/api/Result;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Result;)V
    .locals 1
    .param p1, "result"    # Lcom/google/android/gms/common/api/Result;

    .prologue
    .line 29
    invoke-interface {p1}, Lcom/google/android/gms/common/api/Result;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 30
    iput-object p1, p0, Lcom/patloew/rxlocation/StatusException;->result:Lcom/google/android/gms/common/api/Result;

    .line 31
    return-void
.end method


# virtual methods
.method public getResult()Lcom/google/android/gms/common/api/Result;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/patloew/rxlocation/StatusException;->result:Lcom/google/android/gms/common/api/Result;

    return-object v0
.end method

.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/patloew/rxlocation/StatusException;->result:Lcom/google/android/gms/common/api/Result;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Result;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    return-object v0
.end method
