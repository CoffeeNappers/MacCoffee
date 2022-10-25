.class public abstract Lcom/my/tracker/models/events/a;
.super Ljava/lang/Object;
.source "AbstractEvent.java"

# interfaces
.implements Lcom/my/tracker/models/events/c;


# instance fields
.field private a:J

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private h:J

.field private i:J

.field private j:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 143
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/my/tracker/models/events/a;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 144
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/my/tracker/models/events/a;->a:J

    .line 26
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/models/events/a;->c:Ljava/lang/String;

    .line 27
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/models/events/a;->d:Ljava/lang/String;

    .line 28
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/models/events/a;->e:Ljava/lang/String;

    .line 29
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/models/events/a;->f:Ljava/lang/String;

    .line 31
    iput-wide v2, p0, Lcom/my/tracker/models/events/a;->h:J

    .line 32
    iput-wide v2, p0, Lcom/my/tracker/models/events/a;->i:J

    .line 33
    iput-wide v2, p0, Lcom/my/tracker/models/events/a;->j:J

    .line 148
    iput-object p1, p0, Lcom/my/tracker/models/events/a;->b:Ljava/lang/String;

    .line 149
    if-nez p2, :cond_0

    .line 151
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 152
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    :cond_0
    iput-object p2, p0, Lcom/my/tracker/models/events/a;->g:Ljava/util/List;

    .line 155
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/my/tracker/models/events/a;->b:Ljava/lang/String;

    return-object v0
.end method

.method protected final a(J)V
    .locals 1

    .prologue
    .line 105
    iput-wide p1, p0, Lcom/my/tracker/models/events/a;->h:J

    .line 106
    return-void
.end method

.method protected final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 50
    if-nez p1, :cond_0

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/models/events/a;->c:Ljava/lang/String;

    .line 52
    :goto_0
    return-void

    .line 51
    :cond_0
    iput-object p1, p0, Lcom/my/tracker/models/events/a;->c:Ljava/lang/String;

    goto :goto_0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/my/tracker/models/events/a;->c:Ljava/lang/String;

    return-object v0
.end method

.method public final b(J)V
    .locals 1

    .prologue
    .line 115
    iput-wide p1, p0, Lcom/my/tracker/models/events/a;->i:J

    .line 116
    return-void
.end method

.method protected final b(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 61
    if-nez p1, :cond_0

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/models/events/a;->d:Ljava/lang/String;

    .line 63
    :goto_0
    return-void

    .line 62
    :cond_0
    iput-object p1, p0, Lcom/my/tracker/models/events/a;->d:Ljava/lang/String;

    goto :goto_0
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/my/tracker/models/events/a;->d:Ljava/lang/String;

    return-object v0
.end method

.method public final c(J)V
    .locals 1

    .prologue
    .line 135
    iput-wide p1, p0, Lcom/my/tracker/models/events/a;->a:J

    .line 136
    return-void
.end method

.method protected final c(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 83
    if-nez p1, :cond_0

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/models/events/a;->f:Ljava/lang/String;

    .line 85
    :goto_0
    return-void

    .line 84
    :cond_0
    iput-object p1, p0, Lcom/my/tracker/models/events/a;->f:Ljava/lang/String;

    goto :goto_0
.end method

.method public final d()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/my/tracker/models/events/a;->e:Ljava/lang/String;

    return-object v0
.end method

.method public final e()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/my/tracker/models/events/a;->f:Ljava/lang/String;

    return-object v0
.end method

.method public final f()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lcom/my/tracker/models/events/a;->g:Ljava/util/List;

    return-object v0
.end method

.method public final g()J
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/my/tracker/models/events/a;->g:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/models/events/a;->g:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/models/events/a;->g:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 95
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public final h()J
    .locals 2

    .prologue
    .line 100
    iget-wide v0, p0, Lcom/my/tracker/models/events/a;->h:J

    return-wide v0
.end method

.method public final i()J
    .locals 2

    .prologue
    .line 110
    iget-wide v0, p0, Lcom/my/tracker/models/events/a;->i:J

    return-wide v0
.end method

.method public final j()J
    .locals 2

    .prologue
    .line 130
    iget-wide v0, p0, Lcom/my/tracker/models/events/a;->a:J

    return-wide v0
.end method
