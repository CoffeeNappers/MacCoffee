.class final Lru/mail/libverify/fetcher/f$a$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/fetcher/f$a;->a(Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/requests/e;

.field final synthetic b:Ljava/lang/Throwable;

.field final synthetic c:Lru/mail/libverify/fetcher/f$a;


# direct methods
.method constructor <init>(Lru/mail/libverify/fetcher/f$a;Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/fetcher/f$a$5;->c:Lru/mail/libverify/fetcher/f$a;

    iput-object p2, p0, Lru/mail/libverify/fetcher/f$a$5;->a:Lru/mail/libverify/requests/e;

    iput-object p3, p0, Lru/mail/libverify/fetcher/f$a$5;->b:Ljava/lang/Throwable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a$5;->c:Lru/mail/libverify/fetcher/f$a;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    iget-object v1, p0, Lru/mail/libverify/fetcher/f$a$5;->a:Lru/mail/libverify/requests/e;

    iget-object v2, p0, Lru/mail/libverify/fetcher/f$a$5;->b:Ljava/lang/Throwable;

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/fetcher/e;->a(Lru/mail/libverify/requests/e;Ljava/lang/Throwable;)V

    return-void
.end method