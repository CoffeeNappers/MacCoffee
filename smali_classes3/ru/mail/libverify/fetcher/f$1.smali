.class final Lru/mail/libverify/fetcher/f$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/fetcher/f;->a(Lru/mail/libverify/requests/response/FetcherInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/requests/response/FetcherInfo;

.field final synthetic b:Lru/mail/libverify/fetcher/f;


# direct methods
.method constructor <init>(Lru/mail/libverify/fetcher/f;Lru/mail/libverify/requests/response/FetcherInfo;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/fetcher/f$1;->b:Lru/mail/libverify/fetcher/f;

    iput-object p2, p0, Lru/mail/libverify/fetcher/f$1;->a:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "update fetcher info started"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$1;->b:Lru/mail/libverify/fetcher/f;

    iget-object v1, p0, Lru/mail/libverify/fetcher/f$1;->a:Lru/mail/libverify/requests/response/FetcherInfo;

    invoke-virtual {v0, v1}, Lru/mail/libverify/fetcher/f;->b(Lru/mail/libverify/requests/response/FetcherInfo;)V

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$1;->b:Lru/mail/libverify/fetcher/f;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lru/mail/libverify/fetcher/f;->a(Ljava/lang/String;Z)V

    const-string/jumbo v0, "FetcherManager"

    const-string/jumbo v1, "update fetcher info completed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
