.class public final Lcom/my/target/core/facades/h;
.super Lcom/my/target/core/facades/a;
.source "StandardAd.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/core/facades/h$a;
    }
.end annotation


# instance fields
.field private final a:Lcom/my/target/core/a;

.field private b:Z

.field private c:Lcom/my/target/core/models/sections/i;

.field private d:Lcom/my/target/core/facades/h$a;


# direct methods
.method public constructor <init>(ILjava/lang/String;Landroid/content/Context;Lcom/my/target/ads/CustomParams;Ljava/lang/Boolean;)V
    .locals 1

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/my/target/core/facades/a;-><init>()V

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/facades/h;->b:Z

    .line 75
    new-instance v0, Lcom/my/target/core/a;

    invoke-direct {v0, p1, p2}, Lcom/my/target/core/a;-><init>(ILjava/lang/String;)V

    iput-object v0, p0, Lcom/my/target/core/facades/h;->a:Lcom/my/target/core/a;

    .line 77
    if-eqz p4, :cond_0

    .line 78
    iget-object v0, p0, Lcom/my/target/core/facades/h;->a:Lcom/my/target/core/a;

    invoke-virtual {v0, p4}, Lcom/my/target/core/a;->a(Lcom/my/target/ads/CustomParams;)V

    .line 79
    :cond_0
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/my/target/core/facades/h;->b:Z

    .line 80
    iget-object v0, p0, Lcom/my/target/core/facades/h;->a:Lcom/my/target/core/a;

    invoke-virtual {p0, v0, p3}, Lcom/my/target/core/facades/h;->init(Lcom/my/target/core/a;Landroid/content/Context;)V

    .line 81
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/my/target/core/facades/h;->a:Lcom/my/target/core/a;

    invoke-virtual {v0}, Lcom/my/target/core/a;->c()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final a(Lcom/my/target/core/facades/h$a;)V
    .locals 0

    .prologue
    .line 59
    iput-object p1, p0, Lcom/my/target/core/facades/h;->d:Lcom/my/target/core/facades/h$a;

    .line 60
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 118
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/h;->adData:Lcom/my/target/core/models/c;

    if-nez v0, :cond_1

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 120
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    invoke-interface {v0, p1}, Lcom/my/target/core/models/sections/i;->b(Ljava/lang/String;)Lcom/my/target/core/models/banners/d;

    move-result-object v0

    .line 121
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/my/target/core/facades/h;->adData:Lcom/my/target/core/models/c;

    iget-object v2, p0, Lcom/my/target/core/facades/h;->context:Landroid/content/Context;

    invoke-virtual {v1, v0, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    goto :goto_0
.end method

.method public final b(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 143
    const/4 v0, 0x0

    .line 144
    iget-object v1, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    if-eqz v1, :cond_0

    .line 146
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    invoke-interface {v0, p1}, Lcom/my/target/core/models/sections/i;->b(Ljava/lang/String;)Lcom/my/target/core/models/banners/d;

    move-result-object v0

    .line 148
    :cond_0
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/my/target/core/facades/h;->context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/my/target/core/models/c;->c(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 149
    :cond_1
    return-void
.end method

.method public final b()Z
    .locals 1

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/my/target/core/facades/h;->b:Z

    return v0
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/my/target/core/facades/h;->adData:Lcom/my/target/core/models/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/h;->adData:Lcom/my/target/core/models/c;

    invoke-virtual {v0}, Lcom/my/target/core/models/c;->e()Ljava/lang/String;

    move-result-object v0

    .line 89
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final d()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/my/target/core/facades/h;->adData:Lcom/my/target/core/models/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/h;->adData:Lcom/my/target/core/models/c;

    invoke-virtual {v0}, Lcom/my/target/core/models/c;->c()Lorg/json/JSONObject;

    move-result-object v0

    .line 95
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final e()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    invoke-interface {v0}, Lcom/my/target/core/models/sections/i;->c()Ljava/lang/String;

    move-result-object v0

    .line 101
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final f()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/banners/j;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    invoke-interface {v0}, Lcom/my/target/core/models/sections/i;->g()Ljava/util/ArrayList;

    move-result-object v0

    .line 107
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final g()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/my/target/core/facades/h;->adData:Lcom/my/target/core/models/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/h;->adData:Lcom/my/target/core/models/c;

    invoke-virtual {v0}, Lcom/my/target/core/models/c;->b()Ljava/lang/String;

    move-result-object v0

    .line 113
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final h()Lcom/my/target/core/models/sections/j;
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "standard"

    iget-object v1, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    invoke-interface {v1}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    check-cast v0, Lcom/my/target/core/models/sections/j;

    .line 138
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final i()Lcom/my/target/core/facades/h;
    .locals 6

    .prologue
    .line 153
    new-instance v0, Lcom/my/target/core/facades/h;

    iget-object v1, p0, Lcom/my/target/core/facades/h;->a:Lcom/my/target/core/a;

    invoke-virtual {v1}, Lcom/my/target/core/a;->d()I

    move-result v1

    iget-object v2, p0, Lcom/my/target/core/facades/h;->a:Lcom/my/target/core/a;

    .line 154
    invoke-virtual {v2}, Lcom/my/target/core/a;->c()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/my/target/core/facades/h;->context:Landroid/content/Context;

    iget-object v4, p0, Lcom/my/target/core/facades/h;->a:Lcom/my/target/core/a;

    .line 155
    invoke-virtual {v4}, Lcom/my/target/core/a;->b()Lcom/my/target/ads/CustomParams;

    move-result-object v4

    iget-boolean v5, p0, Lcom/my/target/core/facades/h;->b:Z

    .line 156
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/my/target/core/facades/h;-><init>(ILjava/lang/String;Landroid/content/Context;Lcom/my/target/ads/CustomParams;Ljava/lang/Boolean;)V

    .line 157
    iget-object v1, p0, Lcom/my/target/core/facades/h;->a:Lcom/my/target/core/a;

    invoke-virtual {v1}, Lcom/my/target/core/a;->f()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->setTrackingEnvironmentEnabled(Z)V

    .line 158
    return-object v0
.end method

.method public final j()Lcom/my/target/core/models/j;
    .locals 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "standard"

    iget-object v1, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    invoke-interface {v1}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    check-cast v0, Lcom/my/target/core/models/sections/j;

    invoke-virtual {v0}, Lcom/my/target/core/models/sections/j;->i()Lcom/my/target/core/models/j;

    move-result-object v0

    .line 167
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final onLoad(Lcom/my/target/core/models/c;)V
    .locals 2

    .prologue
    .line 173
    iget-object v0, p0, Lcom/my/target/core/facades/h;->d:Lcom/my/target/core/facades/h$a;

    if-nez v0, :cond_0

    .line 182
    :goto_0
    return-void

    .line 175
    :cond_0
    invoke-virtual {p1}, Lcom/my/target/core/models/c;->g()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/my/target/core/models/c;->e()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 177
    iget-object v0, p0, Lcom/my/target/core/facades/h;->a:Lcom/my/target/core/a;

    invoke-virtual {v0}, Lcom/my/target/core/a;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/my/target/core/models/c;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/i;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    .line 178
    iget-object v0, p0, Lcom/my/target/core/facades/h;->c:Lcom/my/target/core/models/sections/i;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/core/facades/h;->d:Lcom/my/target/core/facades/h$a;

    invoke-interface {v0, p0}, Lcom/my/target/core/facades/h$a;->onLoad(Lcom/my/target/core/facades/h;)V

    goto :goto_0

    .line 179
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/facades/h;->d:Lcom/my/target/core/facades/h$a;

    const-string/jumbo v1, "No ad"

    invoke-interface {v0, v1, p0}, Lcom/my/target/core/facades/h$a;->onNoAd(Ljava/lang/String;Lcom/my/target/core/facades/h;)V

    goto :goto_0

    .line 181
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/facades/h;->d:Lcom/my/target/core/facades/h$a;

    const-string/jumbo v1, "No ad"

    invoke-interface {v0, v1, p0}, Lcom/my/target/core/facades/h$a;->onNoAd(Ljava/lang/String;Lcom/my/target/core/facades/h;)V

    goto :goto_0
.end method

.method protected final onLoadError(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/my/target/core/facades/h;->d:Lcom/my/target/core/facades/h$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/h;->d:Lcom/my/target/core/facades/h$a;

    invoke-interface {v0, p1, p0}, Lcom/my/target/core/facades/h$a;->onNoAd(Ljava/lang/String;Lcom/my/target/core/facades/h;)V

    .line 188
    :cond_0
    return-void
.end method
