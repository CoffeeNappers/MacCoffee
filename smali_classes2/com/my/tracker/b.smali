.class public final Lcom/my/tracker/b;
.super Ljava/lang/Object;
.source "TrackerParams.java"


# instance fields
.field private final a:Ljava/lang/String;

.field private volatile b:Z

.field private volatile c:Z

.field private volatile d:Z

.field private volatile e:Z

.field private volatile f:Ljava/lang/String;

.field private volatile g:I

.field private volatile h:Ljava/lang/String;

.field private volatile i:Ljava/lang/String;

.field private volatile j:Ljava/lang/String;

.field private volatile k:[Ljava/lang/String;

.field private volatile l:[Ljava/lang/String;

.field private volatile m:[Ljava/lang/String;

.field private volatile n:[Ljava/lang/String;

.field private volatile o:[Ljava/lang/String;

.field private volatile p:I

.field private volatile q:I

.field private volatile r:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-boolean v2, p0, Lcom/my/tracker/b;->b:Z

    .line 34
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/tracker/b;->c:Z

    .line 35
    iput-boolean v2, p0, Lcom/my/tracker/b;->d:Z

    .line 36
    iput-boolean v2, p0, Lcom/my/tracker/b;->e:Z

    .line 38
    iput-object v1, p0, Lcom/my/tracker/b;->f:Ljava/lang/String;

    .line 39
    const/16 v0, 0x1e

    iput v0, p0, Lcom/my/tracker/b;->g:I

    .line 41
    iput-object v1, p0, Lcom/my/tracker/b;->h:Ljava/lang/String;

    .line 42
    iput-object v1, p0, Lcom/my/tracker/b;->i:Ljava/lang/String;

    .line 43
    iput-object v1, p0, Lcom/my/tracker/b;->j:Ljava/lang/String;

    .line 45
    iput-object v1, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    .line 46
    iput-object v1, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    .line 47
    iput-object v1, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    .line 48
    iput-object v1, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    .line 49
    iput-object v1, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    .line 51
    iput v3, p0, Lcom/my/tracker/b;->p:I

    .line 52
    iput v3, p0, Lcom/my/tracker/b;->q:I

    .line 54
    iput-object v1, p0, Lcom/my/tracker/b;->r:Ljava/lang/String;

    .line 323
    iput-object p1, p0, Lcom/my/tracker/b;->a:Ljava/lang/String;

    .line 324
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/my/tracker/b;->p:I

    return v0
.end method

.method public final a(I)V
    .locals 0

    .prologue
    .line 187
    iput p1, p0, Lcom/my/tracker/b;->p:I

    .line 188
    return-void
.end method

.method public final a(Lcom/my/tracker/builders/a;)V
    .locals 2

    .prologue
    .line 328
    iget-object v0, p0, Lcom/my/tracker/b;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->a(Ljava/lang/String;)V

    .line 1336
    iget v0, p0, Lcom/my/tracker/b;->g:I

    const/16 v1, 0x1e

    if-eq v0, v1, :cond_0

    .line 1338
    iget v0, p0, Lcom/my/tracker/b;->g:I

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->g(I)V

    .line 1341
    :cond_0
    iget-boolean v0, p0, Lcom/my/tracker/b;->d:Z

    if-nez v0, :cond_1

    .line 1343
    invoke-virtual {p1}, Lcom/my/tracker/builders/a;->a()V

    .line 1346
    :cond_1
    iget-boolean v0, p0, Lcom/my/tracker/b;->b:Z

    if-nez v0, :cond_2

    .line 1348
    invoke-virtual {p1}, Lcom/my/tracker/builders/a;->b()V

    .line 1351
    :cond_2
    iget-boolean v0, p0, Lcom/my/tracker/b;->e:Z

    if-nez v0, :cond_3

    .line 1353
    invoke-virtual {p1}, Lcom/my/tracker/builders/a;->c()V

    .line 1359
    :cond_3
    iget-object v0, p0, Lcom/my/tracker/b;->h:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/my/tracker/b;->h:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->u(Ljava/lang/String;)V

    .line 1360
    :cond_4
    iget-object v0, p0, Lcom/my/tracker/b;->i:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/my/tracker/b;->i:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->v(Ljava/lang/String;)V

    .line 1361
    :cond_5
    iget-object v0, p0, Lcom/my/tracker/b;->j:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/my/tracker/b;->j:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->d(Ljava/lang/String;)V

    .line 1363
    :cond_6
    iget-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_7

    iget-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->a([Ljava/lang/String;)V

    .line 1364
    :cond_7
    iget-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_8

    iget-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->b([Ljava/lang/String;)V

    .line 1365
    :cond_8
    iget-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_9

    iget-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->c([Ljava/lang/String;)V

    .line 1366
    :cond_9
    iget-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_a

    iget-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->d([Ljava/lang/String;)V

    .line 1367
    :cond_a
    iget-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_b

    iget-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->e([Ljava/lang/String;)V

    .line 1369
    :cond_b
    iget v0, p0, Lcom/my/tracker/b;->p:I

    if-ltz v0, :cond_c

    iget v0, p0, Lcom/my/tracker/b;->p:I

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->e(I)V

    .line 1370
    :cond_c
    iget v0, p0, Lcom/my/tracker/b;->q:I

    if-eqz v0, :cond_d

    iget v0, p0, Lcom/my/tracker/b;->q:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_d

    iget v0, p0, Lcom/my/tracker/b;->q:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_e

    .line 1371
    :cond_d
    iget v0, p0, Lcom/my/tracker/b;->q:I

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->f(I)V

    .line 1373
    :cond_e
    iget-object v0, p0, Lcom/my/tracker/b;->r:Ljava/lang/String;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/my/tracker/b;->r:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->j(Ljava/lang/String;)V

    .line 331
    :cond_f
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 192
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 193
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    .line 195
    :goto_0
    return-void

    .line 194
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final a(Z)V
    .locals 0

    .prologue
    .line 281
    iput-boolean p1, p0, Lcom/my/tracker/b;->c:Z

    .line 282
    return-void
.end method

.method public final a([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 199
    if-eqz p1, :cond_0

    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    .line 201
    :goto_0
    return-void

    .line 200
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final b()Ljava/lang/String;
    .locals 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 68
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final b(I)V
    .locals 0

    .prologue
    .line 223
    iput p1, p0, Lcom/my/tracker/b;->q:I

    .line 224
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 210
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 211
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    .line 213
    :goto_0
    return-void

    .line 212
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final b(Z)V
    .locals 0

    .prologue
    .line 286
    iput-boolean p1, p0, Lcom/my/tracker/b;->e:Z

    .line 287
    return-void
.end method

.method public final b([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 217
    if-eqz p1, :cond_0

    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    .line 219
    :goto_0
    return-void

    .line 218
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final c(I)V
    .locals 2

    .prologue
    const/16 v0, 0x1c20

    const/16 v1, 0x1e

    .line 246
    if-le p1, v0, :cond_1

    move p1, v0

    .line 248
    :cond_0
    :goto_0
    iput p1, p0, Lcom/my/tracker/b;->g:I

    .line 249
    return-void

    .line 247
    :cond_1
    if-ge p1, v1, :cond_0

    move p1, v1

    goto :goto_0
.end method

.method public final c(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 228
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 229
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    .line 231
    :goto_0
    return-void

    .line 230
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final c(Z)V
    .locals 0

    .prologue
    .line 291
    iput-boolean p1, p0, Lcom/my/tracker/b;->b:Z

    .line 292
    return-void
.end method

.method public final c([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 235
    if-eqz p1, :cond_0

    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    .line 237
    :goto_0
    return-void

    .line 236
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final c()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 74
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/my/tracker/b;->o:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_0
.end method

.method public final d()Ljava/lang/String;
    .locals 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 80
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final d(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 241
    iput-object p1, p0, Lcom/my/tracker/b;->r:Ljava/lang/String;

    .line 242
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .prologue
    .line 296
    iput-boolean p1, p0, Lcom/my/tracker/b;->d:Z

    .line 297
    return-void
.end method

.method public final d([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 275
    if-eqz p1, :cond_0

    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    .line 277
    :goto_0
    return-void

    .line 276
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final e(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 253
    iput-object p1, p0, Lcom/my/tracker/b;->h:Ljava/lang/String;

    .line 254
    return-void
.end method

.method public final e([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 308
    if-eqz p1, :cond_0

    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    .line 310
    :goto_0
    return-void

    .line 309
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final e()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 86
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/my/tracker/b;->k:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_0
.end method

.method public final f()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lcom/my/tracker/b;->q:I

    return v0
.end method

.method public final f(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 258
    iput-object p1, p0, Lcom/my/tracker/b;->j:Ljava/lang/String;

    .line 259
    return-void
.end method

.method public final g()Ljava/lang/String;
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 97
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final g(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 263
    iput-object p1, p0, Lcom/my/tracker/b;->i:Ljava/lang/String;

    .line 264
    return-void
.end method

.method public final h(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 268
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 269
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    .line 271
    :goto_0
    return-void

    .line 270
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final h()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 103
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/my/tracker/b;->n:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_0
.end method

.method public final i()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/my/tracker/b;->a:Ljava/lang/String;

    return-object v0
.end method

.method public final i(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 301
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 302
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    .line 304
    :goto_0
    return-void

    .line 303
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    goto :goto_0
.end method

.method public final j()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/my/tracker/b;->r:Ljava/lang/String;

    return-object v0
.end method

.method public final j(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 314
    iput-object p1, p0, Lcom/my/tracker/b;->f:Ljava/lang/String;

    .line 315
    return-void
.end method

.method public final k()I
    .locals 1

    .prologue
    .line 118
    iget v0, p0, Lcom/my/tracker/b;->g:I

    return v0
.end method

.method public final l()Ljava/lang/String;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/my/tracker/b;->h:Ljava/lang/String;

    return-object v0
.end method

.method public final m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/my/tracker/b;->j:Ljava/lang/String;

    return-object v0
.end method

.method public final n()Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/my/tracker/b;->i:Ljava/lang/String;

    return-object v0
.end method

.method public final o()Ljava/lang/String;
    .locals 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 139
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final p()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 145
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/my/tracker/b;->l:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_0
.end method

.method public final q()Ljava/lang/String;
    .locals 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 151
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final r()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 157
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/my/tracker/b;->m:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_0
.end method

.method public final s()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/my/tracker/b;->f:Ljava/lang/String;

    return-object v0
.end method

.method public final t()Z
    .locals 1

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/my/tracker/b;->c:Z

    return v0
.end method

.method public final u()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/my/tracker/b;->e:Z

    return v0
.end method

.method public final v()Z
    .locals 1

    .prologue
    .line 177
    iget-boolean v0, p0, Lcom/my/tracker/b;->b:Z

    return v0
.end method

.method public final w()Z
    .locals 1

    .prologue
    .line 182
    iget-boolean v0, p0, Lcom/my/tracker/b;->d:Z

    return v0
.end method

.method public final x()V
    .locals 1

    .prologue
    .line 205
    const-string/jumbo v0, "com.my.games.vendorapp"

    iput-object v0, p0, Lcom/my/tracker/b;->f:Ljava/lang/String;

    .line 206
    return-void
.end method
