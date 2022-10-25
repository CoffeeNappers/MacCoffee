.class final Lru/mail/libverify/fetcher/f$a$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/fetcher/f$a;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/fetcher/f$a;


# direct methods
.method constructor <init>(Lru/mail/libverify/fetcher/f$a;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/fetcher/f$a$3;->a:Lru/mail/libverify/fetcher/f$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a$3;->a:Lru/mail/libverify/fetcher/f$a;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    iget-object v1, p0, Lru/mail/libverify/fetcher/f$a$3;->a:Lru/mail/libverify/fetcher/f$a;

    iget-object v1, v1, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    sget-object v2, Lru/mail/libverify/fetcher/f$b;->SUSPENDED_TEMPORARY:Lru/mail/libverify/fetcher/f$b;

    invoke-virtual {v1, v2}, Lru/mail/libverify/fetcher/f;->a(Lru/mail/libverify/fetcher/f$b;)Z

    move-result v1

    invoke-interface {v0, v1}, Lru/mail/libverify/fetcher/e;->a(Z)V

    return-void
.end method
