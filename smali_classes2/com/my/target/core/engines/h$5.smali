.class final Lcom/my/target/core/engines/h$5;
.super Ljava/lang/Object;
.source "Native320x50Engine.java"

# interfaces
.implements Lcom/my/target/core/facades/h$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/engines/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/engines/h;


# direct methods
.method constructor <init>(Lcom/my/target/core/engines/h;)V
    .locals 0

    .prologue
    .line 144
    iput-object p1, p0, Lcom/my/target/core/engines/h$5;->a:Lcom/my/target/core/engines/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLoad(Lcom/my/target/core/facades/h;)V
    .locals 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/my/target/core/engines/h$5;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->p(Lcom/my/target/core/engines/h;)Lcom/my/target/core/facades/h;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/my/target/core/engines/h$5;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->p(Lcom/my/target/core/engines/h;)Lcom/my/target/core/facades/h;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 151
    iget-object v0, p0, Lcom/my/target/core/engines/h$5;->a:Lcom/my/target/core/engines/h;

    iget-object v1, p0, Lcom/my/target/core/engines/h$5;->a:Lcom/my/target/core/engines/h;

    invoke-static {v1}, Lcom/my/target/core/engines/h;->p(Lcom/my/target/core/engines/h;)Lcom/my/target/core/facades/h;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/my/target/core/engines/h;->a(Lcom/my/target/core/engines/h;Lcom/my/target/core/facades/h;)V

    .line 153
    :cond_0
    return-void
.end method

.method public final onNoAd(Ljava/lang/String;Lcom/my/target/core/facades/h;)V
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/my/target/core/engines/h$5;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->q(Lcom/my/target/core/engines/h;)V

    .line 159
    return-void
.end method
