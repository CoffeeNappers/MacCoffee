.class final Lru/mail/libverify/fetcher/f$a$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/fetcher/f$a;->a(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lru/mail/libverify/fetcher/f$a;


# direct methods
.method constructor <init>(Lru/mail/libverify/fetcher/f$a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/fetcher/f$a$1;->c:Lru/mail/libverify/fetcher/f$a;

    iput-object p2, p0, Lru/mail/libverify/fetcher/f$a$1;->a:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/fetcher/f$a$1;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a$1;->c:Lru/mail/libverify/fetcher/f$a;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    iget-object v1, p0, Lru/mail/libverify/fetcher/f$a$1;->c:Lru/mail/libverify/fetcher/f$a;

    iget-object v1, v1, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v1, v1, Lru/mail/libverify/fetcher/f;->a:Lru/mail/libverify/storage/k;

    iget-object v2, p0, Lru/mail/libverify/fetcher/f$a$1;->a:Ljava/lang/String;

    iget-object v3, p0, Lru/mail/libverify/fetcher/f$a$1;->b:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Lru/mail/libverify/storage/k;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/fetcher/e;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Lru/mail/libverify/storage/DecryptionError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "FetcherManager"

    const-string/jumbo v2, "fetcher message decryption error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a$1;->c:Lru/mail/libverify/fetcher/f$a;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v0}, Lru/mail/libverify/fetcher/f;->a()V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string/jumbo v1, "FetcherManager"

    const-string/jumbo v2, "unexpected error during fetcher message decryption"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a$1;->c:Lru/mail/libverify/fetcher/f$a;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    invoke-virtual {v0}, Lru/mail/libverify/fetcher/f;->a()V

    goto :goto_0
.end method
