.class public final Lcom/my/target/core/models/sections/d;
.super Lcom/my/target/core/models/sections/a;
.source "FullscreenSection.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/my/target/core/models/sections/a",
        "<",
        "Lcom/my/target/core/models/banners/a;",
        ">;"
    }
.end annotation


# instance fields
.field private final i:Lcom/my/target/core/models/l;

.field private j:Lcom/my/target/nativeads/models/ImageData;

.field private k:Lcom/my/target/nativeads/models/ImageData;

.field private l:Lcom/my/target/nativeads/models/ImageData;

.field private m:Z

.field private n:Z

.field private o:F

.field private p:Z

.field private q:Ljava/lang/String;

.field private r:Ljava/lang/String;

.field private s:Z

.field private t:Z

.field private u:I

.field private v:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 195
    const-string/jumbo v0, "fullscreen"

    invoke-direct {p0, v0, p1, p2}, Lcom/my/target/core/models/sections/a;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 45
    iput-boolean v1, p0, Lcom/my/target/core/models/sections/d;->p:Z

    .line 46
    const-string/jumbo v0, "Replay"

    iput-object v0, p0, Lcom/my/target/core/models/sections/d;->q:Ljava/lang/String;

    .line 47
    const-string/jumbo v0, "Close"

    iput-object v0, p0, Lcom/my/target/core/models/sections/d;->r:Ljava/lang/String;

    .line 48
    iput-boolean v1, p0, Lcom/my/target/core/models/sections/d;->s:Z

    .line 49
    iput-boolean v1, p0, Lcom/my/target/core/models/sections/d;->t:Z

    .line 196
    new-instance v0, Lcom/my/target/core/models/l;

    invoke-direct {v0}, Lcom/my/target/core/models/l;-><init>()V

    iput-object v0, p0, Lcom/my/target/core/models/sections/d;->i:Lcom/my/target/core/models/l;

    .line 197
    return-void
.end method


# virtual methods
.method public final a(F)V
    .locals 0

    .prologue
    .line 137
    iput p1, p0, Lcom/my/target/core/models/sections/d;->o:F

    .line 138
    return-void
.end method

.method public final a(I)V
    .locals 0

    .prologue
    .line 187
    iput p1, p0, Lcom/my/target/core/models/sections/d;->u:I

    .line 188
    return-void
.end method

.method public final a(Lcom/my/target/nativeads/models/ImageData;)V
    .locals 0

    .prologue
    .line 152
    iput-object p1, p0, Lcom/my/target/core/models/sections/d;->j:Lcom/my/target/nativeads/models/ImageData;

    .line 153
    return-void
.end method

.method public final a(Z)V
    .locals 0

    .prologue
    .line 122
    iput-boolean p1, p0, Lcom/my/target/core/models/sections/d;->v:Z

    .line 123
    return-void
.end method

.method public final a(ILcom/my/target/core/models/banners/d;)Z
    .locals 1

    .prologue
    .line 228
    invoke-virtual {p0, p2}, Lcom/my/target/core/models/sections/d;->a(Lcom/my/target/core/models/banners/d;)Z

    move-result v0

    return v0
.end method

.method public final a(Lcom/my/target/core/models/banners/d;)Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 204
    instance-of v1, p1, Lcom/my/target/core/models/banners/f;

    if-eqz v1, :cond_0

    .line 206
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/my/target/core/models/sections/d;->b(Ljava/lang/String;)Lcom/my/target/core/models/banners/d;

    move-result-object v1

    if-nez v1, :cond_1

    .line 208
    check-cast p1, Lcom/my/target/core/models/banners/f;

    .line 209
    iget-object v1, p0, Lcom/my/target/core/models/sections/d;->f:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    iget v1, p0, Lcom/my/target/core/models/sections/d;->d:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/my/target/core/models/sections/d;->d:I

    .line 222
    :goto_0
    return v0

    .line 213
    :cond_0
    instance-of v1, p1, Lcom/my/target/core/models/banners/g;

    if-eqz v1, :cond_1

    .line 214
    invoke-interface {p1}, Lcom/my/target/core/models/banners/d;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/my/target/core/models/sections/d;->b(Ljava/lang/String;)Lcom/my/target/core/models/banners/d;

    move-result-object v1

    if-nez v1, :cond_1

    .line 216
    check-cast p1, Lcom/my/target/core/models/banners/g;

    .line 217
    iget-object v1, p0, Lcom/my/target/core/models/sections/d;->f:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 218
    iget v1, p0, Lcom/my/target/core/models/sections/d;->d:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/my/target/core/models/sections/d;->d:I

    goto :goto_0

    .line 222
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final b(Lcom/my/target/nativeads/models/ImageData;)V
    .locals 0

    .prologue
    .line 167
    iput-object p1, p0, Lcom/my/target/core/models/sections/d;->k:Lcom/my/target/nativeads/models/ImageData;

    .line 168
    return-void
.end method

.method public final b(Z)V
    .locals 0

    .prologue
    .line 132
    iput-boolean p1, p0, Lcom/my/target/core/models/sections/d;->s:Z

    .line 133
    return-void
.end method

.method public final c(Lcom/my/target/nativeads/models/ImageData;)V
    .locals 0

    .prologue
    .line 182
    iput-object p1, p0, Lcom/my/target/core/models/sections/d;->l:Lcom/my/target/nativeads/models/ImageData;

    .line 183
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lcom/my/target/core/models/sections/d;->r:Ljava/lang/String;

    .line 148
    return-void
.end method

.method public final c(Z)V
    .locals 0

    .prologue
    .line 142
    iput-boolean p1, p0, Lcom/my/target/core/models/sections/d;->t:Z

    .line 143
    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 172
    iput-object p1, p0, Lcom/my/target/core/models/sections/d;->q:Ljava/lang/String;

    .line 173
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .prologue
    .line 157
    iput-boolean p1, p0, Lcom/my/target/core/models/sections/d;->n:Z

    .line 158
    return-void
.end method

.method public final e(Z)V
    .locals 0

    .prologue
    .line 162
    iput-boolean p1, p0, Lcom/my/target/core/models/sections/d;->m:Z

    .line 163
    return-void
.end method

.method public final f(Z)V
    .locals 0

    .prologue
    .line 177
    iput-boolean p1, p0, Lcom/my/target/core/models/sections/d;->p:Z

    .line 178
    return-void
.end method

.method public final i()F
    .locals 1

    .prologue
    .line 57
    iget v0, p0, Lcom/my/target/core/models/sections/d;->o:F

    return v0
.end method

.method public final j()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/my/target/core/models/sections/d;->r:Ljava/lang/String;

    return-object v0
.end method

.method public final k()Lcom/my/target/nativeads/models/ImageData;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/my/target/core/models/sections/d;->j:Lcom/my/target/nativeads/models/ImageData;

    return-object v0
.end method

.method public final l()Lcom/my/target/nativeads/models/ImageData;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/my/target/core/models/sections/d;->k:Lcom/my/target/nativeads/models/ImageData;

    return-object v0
.end method

.method public final m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/my/target/core/models/sections/d;->q:Ljava/lang/String;

    return-object v0
.end method

.method public final n()Lcom/my/target/nativeads/models/ImageData;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/my/target/core/models/sections/d;->l:Lcom/my/target/nativeads/models/ImageData;

    return-object v0
.end method

.method public final o()I
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lcom/my/target/core/models/sections/d;->u:I

    return v0
.end method

.method public final p()Lcom/my/target/core/models/l;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/my/target/core/models/sections/d;->i:Lcom/my/target/core/models/l;

    return-object v0
.end method

.method public final q()Z
    .locals 1

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/my/target/core/models/sections/d;->s:Z

    return v0
.end method

.method public final r()Z
    .locals 1

    .prologue
    .line 102
    iget-boolean v0, p0, Lcom/my/target/core/models/sections/d;->t:Z

    return v0
.end method

.method public final s()Z
    .locals 1

    .prologue
    .line 107
    iget-boolean v0, p0, Lcom/my/target/core/models/sections/d;->v:Z

    return v0
.end method

.method public final t()Z
    .locals 1

    .prologue
    .line 112
    iget-boolean v0, p0, Lcom/my/target/core/models/sections/d;->n:Z

    return v0
.end method

.method public final u()Z
    .locals 1

    .prologue
    .line 117
    iget-boolean v0, p0, Lcom/my/target/core/models/sections/d;->m:Z

    return v0
.end method

.method public final v()Z
    .locals 1

    .prologue
    .line 127
    iget-boolean v0, p0, Lcom/my/target/core/models/sections/d;->p:Z

    return v0
.end method
