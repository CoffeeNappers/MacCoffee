.class final Lru/mail/libverify/api/k$1;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/ab;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/k;->g(Landroid/content/Context;)Lru/mail/libverify/api/ab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/k$1;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lru/mail/libverify/api/k;->b()Lru/mail/libverify/api/ad;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0, p1, p2}, Lru/mail/libverify/api/ab;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/api/k$1;->a:Landroid/content/Context;

    invoke-static {v0, p1}, Lru/mail/libverify/storage/m;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/k$1;->a:Landroid/content/Context;

    invoke-static {v0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lru/mail/libverify/api/ab;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final a_(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lru/mail/libverify/api/k;->b()Lru/mail/libverify/api/ad;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lru/mail/libverify/api/ab;->a_(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
