.class public final Lcom/my/target/core/models/f;
.super Ljava/lang/Object;
.source "AudioParams.java"


# instance fields
.field private a:I

.field private b:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/16 v0, 0xa

    iput v0, p0, Lcom/my/target/core/models/f;->a:I

    .line 12
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 1

    .prologue
    .line 21
    iget v0, p0, Lcom/my/target/core/models/f;->a:I

    return v0
.end method

.method public final b()I
    .locals 1

    .prologue
    .line 26
    iget v0, p0, Lcom/my/target/core/models/f;->b:I

    return v0
.end method
