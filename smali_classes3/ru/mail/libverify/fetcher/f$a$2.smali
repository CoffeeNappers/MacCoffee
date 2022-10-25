.class final Lru/mail/libverify/fetcher/f$a$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/fetcher/f$a;->a(Lru/mail/libverify/gcm/ServerInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/gcm/ServerInfo;

.field final synthetic b:Lru/mail/libverify/fetcher/f$a;


# direct methods
.method constructor <init>(Lru/mail/libverify/fetcher/f$a;Lru/mail/libverify/gcm/ServerInfo;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/fetcher/f$a$2;->b:Lru/mail/libverify/fetcher/f$a;

    iput-object p2, p0, Lru/mail/libverify/fetcher/f$a$2;->a:Lru/mail/libverify/gcm/ServerInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/fetcher/f$a$2;->b:Lru/mail/libverify/fetcher/f$a;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f$a;->a:Lru/mail/libverify/fetcher/f;

    iget-object v0, v0, Lru/mail/libverify/fetcher/f;->b:Lru/mail/libverify/fetcher/e;

    iget-object v1, p0, Lru/mail/libverify/fetcher/f$a$2;->a:Lru/mail/libverify/gcm/ServerInfo;

    invoke-interface {v0, v1}, Lru/mail/libverify/fetcher/e;->a(Lru/mail/libverify/gcm/ServerInfo;)V

    return-void
.end method
