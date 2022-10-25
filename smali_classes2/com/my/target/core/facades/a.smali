.class public abstract Lcom/my/target/core/facades/a;
.super Ljava/lang/Object;
.source "AbstractAd.java"

# interfaces
.implements Lcom/my/target/core/facades/g;


# instance fields
.field protected adData:Lcom/my/target/core/models/c;

.field protected context:Landroid/content/Context;

.field private executeListener:Lcom/my/target/core/async/commands/b$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/my/target/core/async/commands/b$a",
            "<",
            "Lcom/my/target/core/models/c;",
            ">;"
        }
    .end annotation
.end field

.field protected params:Lcom/my/target/core/a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v0, Lcom/my/target/core/facades/a$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/facades/a$1;-><init>(Lcom/my/target/core/facades/a;)V

    iput-object v0, p0, Lcom/my/target/core/facades/a;->executeListener:Lcom/my/target/core/async/commands/b$a;

    .line 38
    return-void
.end method


# virtual methods
.method protected init(Lcom/my/target/core/a;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/my/target/core/facades/a;->params:Lcom/my/target/core/a;

    .line 43
    iput-object p2, p0, Lcom/my/target/core/facades/a;->context:Landroid/content/Context;

    .line 44
    return-void
.end method

.method public load()V
    .locals 5

    .prologue
    .line 52
    iget-object v1, p0, Lcom/my/target/core/facades/a;->params:Lcom/my/target/core/a;

    iget-object v2, p0, Lcom/my/target/core/facades/a;->context:Landroid/content/Context;

    .line 1043
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/my/target/core/a;->c()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/my/target/core/net/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Lcom/my/target/core/a;->d()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1045
    sget-object v3, Lcom/my/target/core/net/a;->a:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v0, Lcom/my/target/core/net/a;->a:Ljava/lang/String;

    .line 1047
    :cond_0
    new-instance v3, Lcom/my/target/core/models/d;

    invoke-direct {v3, v0}, Lcom/my/target/core/models/d;-><init>(Ljava/lang/String;)V

    .line 1049
    const-string/jumbo v0, "appwall"

    invoke-virtual {v1}, Lcom/my/target/core/a;->c()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1050
    new-instance v0, Lcom/my/target/core/async/commands/d;

    invoke-direct {v0, v3, v1, v2}, Lcom/my/target/core/async/commands/d;-><init>(Lcom/my/target/core/models/d;Lcom/my/target/core/a;Landroid/content/Context;)V

    .line 53
    :goto_0
    iget-object v1, p0, Lcom/my/target/core/facades/a;->executeListener:Lcom/my/target/core/async/commands/b$a;

    invoke-interface {v0, v1}, Lcom/my/target/core/async/commands/b;->a(Lcom/my/target/core/async/commands/b$a;)V

    .line 54
    invoke-interface {v0}, Lcom/my/target/core/async/commands/b;->b()V

    .line 55
    return-void

    .line 1052
    :cond_1
    const-string/jumbo v0, "instreamads"

    invoke-virtual {v1}, Lcom/my/target/core/a;->c()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "instreamaudioads"

    .line 1053
    invoke-virtual {v1}, Lcom/my/target/core/a;->c()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1054
    :cond_2
    new-instance v0, Lcom/my/target/core/async/commands/e;

    invoke-direct {v0, v3, v1, v2}, Lcom/my/target/core/async/commands/e;-><init>(Lcom/my/target/core/models/d;Lcom/my/target/core/a;Landroid/content/Context;)V

    goto :goto_0

    .line 1056
    :cond_3
    new-instance v0, Lcom/my/target/core/async/commands/c;

    invoke-direct {v0, v3, v1, v2}, Lcom/my/target/core/async/commands/c;-><init>(Lcom/my/target/core/models/d;Lcom/my/target/core/a;Landroid/content/Context;)V

    goto :goto_0
.end method

.method protected abstract onLoad(Lcom/my/target/core/models/c;)V
.end method

.method protected abstract onLoadError(Ljava/lang/String;)V
.end method

.method public setTrackingEnvironmentEnabled(Z)V
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/my/target/core/facades/a;->params:Lcom/my/target/core/a;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/my/target/core/facades/a;->params:Lcom/my/target/core/a;

    invoke-virtual {v0, p1}, Lcom/my/target/core/a;->a(Z)V

    .line 65
    :cond_0
    return-void
.end method
