.class public final Lru/mail/libverify/requests/e$3;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/requests/i$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/requests/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/utils/e;

.field final synthetic b:Lru/mail/libverify/requests/e;


# direct methods
.method public constructor <init>(Lru/mail/libverify/requests/e;Lru/mail/libverify/utils/e;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/requests/e$3;->b:Lru/mail/libverify/requests/e;

    iput-object p2, p0, Lru/mail/libverify/requests/e$3;->a:Lru/mail/libverify/utils/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    :try_start_0
    const-string/jumbo v0, "ClientApiRequest"

    const-string/jumbo v1, "try to disconnect"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/requests/e$3;->a:Lru/mail/libverify/utils/e;

    invoke-interface {v0}, Lru/mail/libverify/utils/e;->b()V

    const-string/jumbo v0, "ClientApiRequest"

    const-string/jumbo v1, "disconnected"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "ClientApiRequest"

    const-string/jumbo v2, "failed to disconnect"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
