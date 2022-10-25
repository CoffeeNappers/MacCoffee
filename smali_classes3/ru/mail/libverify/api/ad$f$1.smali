.class final Lru/mail/libverify/api/ad$f$1;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/sms/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad$f;->b()Lru/mail/libverify/sms/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad$f;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad$f;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$f$1;->a:Lru/mail/libverify/api/ad$f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$f$1;->a:Lru/mail/libverify/api/ad$f;

    iget-object v0, v0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    return-object v0
.end method

.method public final b()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$f$1;->a:Lru/mail/libverify/api/ad$f;

    iget-object v0, v0, Lru/mail/libverify/api/ad$f;->a:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/l;->d()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method
