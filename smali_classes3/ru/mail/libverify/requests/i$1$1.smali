.class final Lru/mail/libverify/requests/i$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/requests/i$1;->call()Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/requests/i$1;


# direct methods
.method constructor <init>(Lru/mail/libverify/requests/i$1;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/requests/i$1$1;->a:Lru/mail/libverify/requests/i$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/requests/i$1$1;->a:Lru/mail/libverify/requests/i$1;

    iget-object v0, v0, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    iget-object v0, v0, Lru/mail/libverify/requests/i;->c:Lru/mail/libverify/requests/i$b;

    iget-object v1, p0, Lru/mail/libverify/requests/i$1$1;->a:Lru/mail/libverify/requests/i$1;

    iget-object v1, v1, Lru/mail/libverify/requests/i$1;->a:Lru/mail/libverify/requests/i;

    iget-object v1, v1, Lru/mail/libverify/requests/i;->d:Ljava/util/concurrent/Future;

    invoke-interface {v0, v1}, Lru/mail/libverify/requests/i$b;->a(Ljava/util/concurrent/Future;)V

    return-void
.end method
