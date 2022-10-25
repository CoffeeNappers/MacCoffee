.class final Lru/mail/libverify/api/ad$g$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad$g;->a(Ljava/lang/Throwable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/Thread;

.field final synthetic b:Ljava/lang/Throwable;

.field final synthetic c:Lru/mail/libverify/api/ad$g;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad$g;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$g$1;->c:Lru/mail/libverify/api/ad$g;

    iput-object p2, p0, Lru/mail/libverify/api/ad$g$1;->a:Ljava/lang/Thread;

    iput-object p3, p0, Lru/mail/libverify/api/ad$g$1;->b:Ljava/lang/Throwable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lru/mail/libverify/api/ad$g$1;->c:Lru/mail/libverify/api/ad$g;

    iget-object v0, v0, Lru/mail/libverify/api/ad$g;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->m(Lru/mail/libverify/api/ad;)Lru/mail/libverify/statistics/b;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$g$1;->a:Ljava/lang/Thread;

    iget-object v2, p0, Lru/mail/libverify/api/ad$g$1;->b:Ljava/lang/Throwable;

    iget-object v0, v0, Lru/mail/libverify/statistics/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/c;

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/statistics/c;->b(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method
