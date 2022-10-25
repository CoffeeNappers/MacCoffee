.class public final Lcom/my/tracker/providers/e;
.super Lcom/my/tracker/providers/a;
.source "FingerprintDataProvider.java"


# static fields
.field private static a:Lcom/my/tracker/providers/e;


# instance fields
.field private b:Lcom/my/tracker/providers/c;

.field private c:Lcom/my/tracker/providers/f;

.field private d:Lcom/my/tracker/providers/h;

.field private e:Lcom/my/tracker/providers/g;

.field private f:Lcom/my/tracker/providers/b;

.field private g:Lcom/my/tracker/providers/d;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/my/tracker/providers/a;-><init>()V

    .line 37
    new-instance v0, Lcom/my/tracker/providers/c;

    invoke-direct {v0}, Lcom/my/tracker/providers/c;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/providers/e;->b:Lcom/my/tracker/providers/c;

    .line 38
    new-instance v0, Lcom/my/tracker/providers/f;

    invoke-direct {v0}, Lcom/my/tracker/providers/f;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/providers/e;->c:Lcom/my/tracker/providers/f;

    .line 39
    new-instance v0, Lcom/my/tracker/providers/h;

    invoke-direct {v0}, Lcom/my/tracker/providers/h;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/providers/e;->d:Lcom/my/tracker/providers/h;

    .line 40
    new-instance v0, Lcom/my/tracker/providers/g;

    invoke-direct {v0}, Lcom/my/tracker/providers/g;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/providers/e;->e:Lcom/my/tracker/providers/g;

    .line 41
    new-instance v0, Lcom/my/tracker/providers/b;

    invoke-direct {v0}, Lcom/my/tracker/providers/b;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/providers/e;->f:Lcom/my/tracker/providers/b;

    .line 42
    new-instance v0, Lcom/my/tracker/providers/d;

    invoke-direct {v0}, Lcom/my/tracker/providers/d;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/providers/e;->g:Lcom/my/tracker/providers/d;

    .line 82
    return-void
.end method

.method public static a()Lcom/my/tracker/providers/e;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/my/tracker/providers/e;->a:Lcom/my/tracker/providers/e;

    if-nez v0, :cond_0

    new-instance v0, Lcom/my/tracker/providers/e;

    invoke-direct {v0}, Lcom/my/tracker/providers/e;-><init>()V

    sput-object v0, Lcom/my/tracker/providers/e;->a:Lcom/my/tracker/providers/e;

    .line 29
    :cond_0
    sget-object v0, Lcom/my/tracker/providers/e;->a:Lcom/my/tracker/providers/e;

    return-object v0
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 116
    invoke-super {p0, p1}, Lcom/my/tracker/providers/a;->a(Landroid/content/Context;)V

    .line 117
    iget-object v0, p0, Lcom/my/tracker/providers/e;->b:Lcom/my/tracker/providers/c;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/c;->a(Landroid/content/Context;)V

    .line 118
    iget-object v0, p0, Lcom/my/tracker/providers/e;->c:Lcom/my/tracker/providers/f;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/f;->a(Landroid/content/Context;)V

    .line 119
    iget-object v0, p0, Lcom/my/tracker/providers/e;->d:Lcom/my/tracker/providers/h;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/h;->a(Landroid/content/Context;)V

    .line 120
    iget-object v0, p0, Lcom/my/tracker/providers/e;->e:Lcom/my/tracker/providers/g;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/g;->a(Landroid/content/Context;)V

    .line 121
    iget-object v0, p0, Lcom/my/tracker/providers/e;->g:Lcom/my/tracker/providers/d;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/d;->a(Landroid/content/Context;)V

    .line 122
    iget-object v0, p0, Lcom/my/tracker/providers/e;->f:Lcom/my/tracker/providers/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/b;->a(Landroid/content/Context;)V

    .line 123
    return-void
.end method

.method public final a(Lcom/my/tracker/builders/a;)V
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/my/tracker/providers/e;->b:Lcom/my/tracker/providers/c;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/c;->a(Lcom/my/tracker/builders/a;)V

    .line 106
    iget-object v0, p0, Lcom/my/tracker/providers/e;->c:Lcom/my/tracker/providers/f;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/f;->a(Lcom/my/tracker/builders/a;)V

    .line 107
    iget-object v0, p0, Lcom/my/tracker/providers/e;->d:Lcom/my/tracker/providers/h;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/h;->a(Lcom/my/tracker/builders/a;)V

    .line 108
    iget-object v0, p0, Lcom/my/tracker/providers/e;->e:Lcom/my/tracker/providers/g;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/g;->a(Lcom/my/tracker/builders/a;)V

    .line 109
    iget-object v0, p0, Lcom/my/tracker/providers/e;->f:Lcom/my/tracker/providers/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/b;->a(Lcom/my/tracker/builders/a;)V

    .line 110
    iget-object v0, p0, Lcom/my/tracker/providers/e;->g:Lcom/my/tracker/providers/d;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/d;->a(Lcom/my/tracker/builders/a;)V

    .line 111
    return-void
.end method

.method public final b()Lcom/my/tracker/providers/h;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/my/tracker/providers/e;->d:Lcom/my/tracker/providers/h;

    return-object v0
.end method

.method public final b(Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 89
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 91
    const-string/jumbo v0, "FingerprintDataProvider: You must not call collectData method from main thread"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 101
    :goto_0
    return-void

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/my/tracker/providers/e;->b:Lcom/my/tracker/providers/c;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/c;->b(Landroid/content/Context;)V

    .line 96
    iget-object v0, p0, Lcom/my/tracker/providers/e;->c:Lcom/my/tracker/providers/f;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/f;->b(Landroid/content/Context;)V

    .line 97
    iget-object v0, p0, Lcom/my/tracker/providers/e;->d:Lcom/my/tracker/providers/h;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/h;->b(Landroid/content/Context;)V

    .line 98
    iget-object v0, p0, Lcom/my/tracker/providers/e;->e:Lcom/my/tracker/providers/g;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/g;->b(Landroid/content/Context;)V

    .line 99
    iget-object v0, p0, Lcom/my/tracker/providers/e;->g:Lcom/my/tracker/providers/d;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/d;->b(Landroid/content/Context;)V

    .line 100
    iget-object v0, p0, Lcom/my/tracker/providers/e;->f:Lcom/my/tracker/providers/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/providers/b;->b(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public final c()Lcom/my/tracker/providers/g;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/my/tracker/providers/e;->e:Lcom/my/tracker/providers/g;

    return-object v0
.end method

.method public final d()Lcom/my/tracker/providers/b;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/my/tracker/providers/e;->f:Lcom/my/tracker/providers/b;

    return-object v0
.end method

.method public final e()Lcom/my/tracker/providers/d;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/my/tracker/providers/e;->g:Lcom/my/tracker/providers/d;

    return-object v0
.end method
