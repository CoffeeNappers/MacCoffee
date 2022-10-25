.class final Lru/mail/libverify/api/ad$i$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad$i;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad$i;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad$i;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$i$1;->a:Lru/mail/libverify/api/ad$i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$i$1;->a:Lru/mail/libverify/api/ad$i;

    iget-object v0, v0, Lru/mail/libverify/api/ad$i;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->A()V

    return-void
.end method
