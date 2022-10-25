.class final Lru/mail/libverify/api/ad$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$1;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad$1;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->A()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$1;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$1;->a:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->b(Lru/mail/libverify/api/ad;)I

    move-result v1

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/l;->a(I)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$1;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->F()V

    return-void
.end method
