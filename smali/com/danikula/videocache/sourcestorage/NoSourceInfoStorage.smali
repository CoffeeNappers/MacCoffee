.class public Lcom/danikula/videocache/sourcestorage/NoSourceInfoStorage;
.super Ljava/lang/Object;
.source "NoSourceInfoStorage.java"

# interfaces
.implements Lcom/danikula/videocache/sourcestorage/SourceInfoStorage;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lcom/danikula/videocache/SourceInfo;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 14
    const/4 v0, 0x0

    return-object v0
.end method

.method public put(Ljava/lang/String;Lcom/danikula/videocache/SourceInfo;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "sourceInfo"    # Lcom/danikula/videocache/SourceInfo;

    .prologue
    .line 19
    return-void
.end method

.method public release()V
    .locals 0

    .prologue
    .line 23
    return-void
.end method
