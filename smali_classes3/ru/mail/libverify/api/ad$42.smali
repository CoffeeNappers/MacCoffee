.class final Lru/mail/libverify/api/ad$42;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->setCustomLocale(Ljava/util/Locale;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/Locale;

.field final synthetic b:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/util/Locale;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$42;->b:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$42;->a:Ljava/util/Locale;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "locale %s set"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/api/ad$42;->a:Ljava/util/Locale;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$42;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$42;->a:Ljava/util/Locale;

    invoke-interface {v0, v1}, Lru/mail/libverify/storage/l;->a(Ljava/util/Locale;)V

    iget-object v0, p0, Lru/mail/libverify/api/ad$42;->b:Lru/mail/libverify/api/ad;

    invoke-static {v0}, Lru/mail/libverify/api/ad;->d(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/a;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/api/a;->b()V

    iget-object v0, p0, Lru/mail/libverify/api/ad$42;->b:Lru/mail/libverify/api/ad;

    iget-object v1, p0, Lru/mail/libverify/api/ad$42;->b:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v1

    invoke-static {v1}, Lru/mail/libverify/requests/o;->a(Lru/mail/libverify/storage/k;)Lru/mail/libverify/requests/o;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Lru/mail/libverify/requests/e;)V

    return-void
.end method
